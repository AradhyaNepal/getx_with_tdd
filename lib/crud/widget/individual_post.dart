import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/crud/specific_post_screen.dart';

import '../model/post.dart';
import 'comments_box.dart';

class IndividualPost extends StatelessWidget {
  final Post post;
  final bool forEdit;

  const IndividualPost({
    Key? key,
    required this.post,
    this.forEdit=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Comments.putComment(post.id).toggleShowHide();
        Get.toNamed(SpecificPostScreen.route, arguments: post);
      },
      child: Container(
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
            const Divider(),
            Builder(
              builder: (context) {
                final child= Comments(
                  postId: post.id,
                  forEdit: forEdit,
                );
                if(forEdit){
                  return Expanded(child: child);
                }else{
                  return child;
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
