

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/crud/controller/comments_controller.dart';

class Comments extends StatelessWidget {
  final int postId;

  const Comments({
    required this.postId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CommentsController controller =
    Get.put(CommentsController(postId), tag: postId.toString());
    return Column(
      children: [
        GestureDetector(
          onTap: controller.toggleShowHide,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Comments",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Obx(() => Icon(controller.showComment.value
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down)),
            ],
          ),
        ),
        Obx(
              () {
            if (controller.showComment.value) {
              return controller.obx((state) {
                if (state == null) return const SizedBox();
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.redAccent,
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(state[index].body),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "By\n${state[index].name}",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  state[index].email,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: state.length,
                  ),
                );
              });
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
