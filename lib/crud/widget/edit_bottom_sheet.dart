import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/crud/controller/available_posts_controller.dart';
import 'package:getx/crud/model/post.dart';

class EditBottomSheet extends StatefulWidget {
  final Post post;

  const EditBottomSheet({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<EditBottomSheet> createState() => _EditBottomSheetState();
}

class _EditBottomSheetState extends State<EditBottomSheet> {
  late String _title = "";
  late String _body = "";
  final _formKey = GlobalKey<FormState>();
  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Edit Post",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: widget.post.title,
              validator: (v) => v == "" ? "Enter Value" : null,
              onSaved: (v) => _title = v ?? "",
              decoration: const InputDecoration(
                  label: Text(
                "Title",
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: widget.post.body,
              validator: (v) => v == "" ? "Enter Value" : null,
              onSaved: (v) => _body = v ?? "",
              decoration: const InputDecoration(
                  label: Text(
                "Content",
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            _isLoading?
            const Center(
              child: CircularProgressIndicator(),
            ):ElevatedButton(
              onPressed: ()async{
                if (!_formKey.currentState!.validate()) return;
                _formKey.currentState?.save();
                setState(() {
                  _isLoading=true;
                });
                final AvailablePostsController postController = Get.find();
                final updatedPost = widget.post.copyWith(
                  title: _title,
                  body: _body,
                );
                await postController.editPost(context,updatedPost:updatedPost,);
                setState(() {
                  _isLoading=false;
                });
              },
              child: const Text("Confirm"),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
