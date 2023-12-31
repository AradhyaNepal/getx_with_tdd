import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/common/widget/generic_alert.dart';
import 'package:getx/crud/model/post.dart';
import 'package:getx/crud/widget/edit_bottom_sheet.dart';
import 'package:getx/crud/widget/individual_post.dart';

class SpecificPostScreen extends StatelessWidget {
  static const String route = "/specificPostScreen";

  SpecificPostScreen({Key? key}) : super(key: key);
  late final post =
      Get.arguments as Post; //Lazy loading was done just for fun ;-)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: IndividualPost(
                post: post,
                forEdit: true,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled:true,
                        context: context,
                        builder: (context) {
                          return EditBottomSheet(
                            post: post,
                          );
                        },
                      );
                    },
                    child: const Text("Edit"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return GenericAlert(
                            title: "Delete",
                            content: "Do you really want to delete?",
                            onSuccess: () {
                              //Todo: Implement backend request
                              Get.showSnackbar(const GetSnackBar(
                                message: "Successfully deleted",
                                duration: Duration(seconds: 1),
                              ));
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
