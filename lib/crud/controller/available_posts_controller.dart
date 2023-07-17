import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../model/post.dart';
import '../specific_post_screen.dart';

class AvailablePostsController extends GetxController
    with StateMixin<List<Post>> {
  @override
  void onInit() async {
    super.onInit();
    try {
      change(null, status: RxStatus.loading());
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );
      if (response.statusCode < 300) {
        final data = jsonDecode(response.body) as List;
        change(
          data.map((e) => Post.fromJson(e)).toList(),
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

  Future<void> editPost(
    BuildContext context, {
    required Post updatedPost,
  }) async {
    try {
      final response = await http.put(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/${updatedPost.id}"),
        body: jsonEncode({
          "title":updatedPost.title,
          "body":updatedPost.body,
        }),
      );
      if (response.statusCode < 300) {
        final data = state ?? [];
        final index = data.indexWhere((e) => e.id == updatedPost.id);
        if (index != -1) {
          data[index] = updatedPost;
        }
        update(data);
        if (context.mounted) {
          //GetX was not double popping, so Navigator was used
          Get.showSnackbar(
            const GetSnackBar(
              message: "Successfully Edited",
              duration: Duration(seconds: 1),
            ),
          );
          Navigator.pop(context); //To Close Bottom Sheet
          Navigator.pop(context); //Close Old Details Screen
          Get.to(
            SpecificPostScreen(),
            arguments: updatedPost,
          );
        }
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            message: "Cannot Edit",
            duration: Duration(seconds: 1),
          ),
        );
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }
}
