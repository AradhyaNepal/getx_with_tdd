import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/crud/controller/comments_controller.dart';

class Comments extends StatelessWidget {
  final int postId;
  final bool forEdit;

  static CommentsController putComment(int postId){
    return Get.put(CommentsController(postId), tag: postId.toString());
  }

  const Comments({
    required this.postId,
    required this.forEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CommentsController controller = forEdit?Get.find(tag: postId.toString()):putComment(postId);
    return Column(
      children: [
        if (!forEdit)
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
            if (controller.showComment.value || forEdit) {
              final child =  controller.obx((state) {
                if (state == null) return const SizedBox();
                return ListView.builder(
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
                );

              });
              if (forEdit) {
                return Expanded(child: child);
              } else {
                return SizedBox(
                  height: 200,
                  child: child,
                );
              }
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
