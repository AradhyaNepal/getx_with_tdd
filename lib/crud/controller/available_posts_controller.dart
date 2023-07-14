import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../model/post.dart';

class AvailablePostsController extends GetxController
    with StateMixin<List<Post>> {
  @override
  void onInit() async{
    super.onInit();
    try {
      change(null,status:RxStatus.loading());
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );
      if (response.statusCode < 300) {
        final data=jsonDecode(response.body) as List;
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

}

