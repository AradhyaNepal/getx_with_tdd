import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/crud/controller/available_posts_controller.dart';
import 'widget/individual_post.dart';

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
                return IndividualPost(post: state[index]);
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

