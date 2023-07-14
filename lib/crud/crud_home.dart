import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/crud/controller/posts_controller.dart';
import 'package:getx/crud/model/post.dart';

class CrudHome extends GetView<AvailablePostsController> {
  static const String route = "/CrudHome";

  const CrudHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: controller.obx(
          (state) {
            if (state == null) return const SizedBox();
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                return IndividualItem(post: state[index]);
              },
            );
          },
          onError: (value) => Center(
            child: Text(value ?? "Error"),
          ),
        ),
      ),
    );
  }
}

class IndividualItem extends StatelessWidget {
  final Post post;

  const IndividualItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade500)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(
            post.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const Divider(),
          Text(
            post.body,
          ),
          const SizedBox(
            height: 10,
          ),
          const Comments(),
        ],
      ),
    );
  }
}

class Comments extends StatelessWidget {
  const Comments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Comments",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              SizedBox(width: 5,),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ],
    );
  }
}
