import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  late String _title = widget.post.title;
  late String _content = widget.post.body;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
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
            const SizedBox(height: 10,),
            TextFormField(
              initialValue: _title,
              validator: (v) => v == "" ? "Enter Value" : null,
              onSaved: (v) => _title = v ?? "",
              decoration: const InputDecoration(
                label: Text("Title",)
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              initialValue: _content,
              validator: (v) => v == "" ? "Enter Value" : null,
              onSaved: (v) => _content = v ?? "",
              decoration: const InputDecoration(
                  label: Text("Content",)
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                _formKey.currentState?.save();
                //Todo: Implement Backend
                Get.showSnackbar(
                  const GetSnackBar(
                    message: "Successfully Edited",
                    duration: Duration(seconds: 1),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text("Confirm"),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
