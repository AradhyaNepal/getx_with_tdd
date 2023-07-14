import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/crud/model/comment.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class CommentsController extends GetxController with StateMixin<List<Comment>>{
  final int postId;
  var showComment=false.obs;
  CommentsController(this.postId);

  void toggleShowHide(){
    if(showComment.value){
      showComment.value=false;
    }else{
      showComment.value=true;
      if(state==null){
        loadData();
      }
    }
    update();
  }
  void loadData() async{
    try {
      change(null,status:RxStatus.loading());
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=$postId"),
      );
      if (response.statusCode < 300) {
        final data=jsonDecode(response.body) as List;
        change(
          data.map((e) => Comment.fromJson(e)).toList(),
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