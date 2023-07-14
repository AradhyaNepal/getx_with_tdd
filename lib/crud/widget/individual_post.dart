import 'package:flutter/material.dart';

import '../model/post.dart';
import 'comments_box.dart';

class IndividualPost extends StatelessWidget {
  final Post post;

  const IndividualPost({
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
          const Divider(),
          Comments(
            postId: post.id,
          ),
        ],
      ),
    );
  }
}