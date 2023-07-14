import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../model/post.dart';

class AvailablePostsController extends GetxController
    with StateMixin<List<Post>> {
  void loadPosts() async {
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );
      if (response.statusCode < 300) {
        change(
          (response.body as List).map((e) => Post.fromJson(e)).toList(),
          status: RxStatus.success(),
        );
      } else {
        change(null, status: RxStatus.error("Backend Error"));
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}

class EditDeleteController extends GetxController {
  var isEditing = false.obs;
  var isDeleting = false.obs;

  void editPost(Post post) async {
    isEditing.value = true;
    try {
      final response = await http.patch(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/${post.id}"),
      );
      if (response.statusCode < 300) {
        Get.showSnackbar(const GetSnackBar(
          title: "Successfully Edited",
        ));
        Get.back();
      } else {
        Get.showSnackbar(const GetSnackBar(title: "Server Error"));
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      Get.showSnackbar(GetSnackBar(title: e.toString()));
    }
    isEditing.value = false;
    AvailablePostsController controller = Get.find();
    controller.loadPosts();
  }

  void deletePost(int postId) async {
    isDeleting.value = true;
    try {
      final response = await http.patch(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/$postId"),
      );
      if (response.statusCode < 300) {
        Get.showSnackbar(const GetSnackBar(
          title: "Successfully Deleted",
        ));
        Get.back();
      } else {
        Get.showSnackbar(const GetSnackBar(title: "Server Error"));
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      Get.showSnackbar(GetSnackBar(title: e.toString()));
    }
    isDeleting.value = false;
    AvailablePostsController controller = Get.find();
    controller.loadPosts();
  }
}
