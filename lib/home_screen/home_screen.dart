import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/counter/counter_screen.dart';
import 'package:getx/crud/controller/available_posts_controller.dart';
import 'package:getx/crud/all_posts_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height:size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Get.to(const CounterScreen());
                  },
                  child: const Text("Counter"),
                ),
                ElevatedButton(
                  onPressed: ()async{
                    Get.lazyPut(()=>AvailablePostsController());
                    await Get.toNamed(AllPostScreen.route,);
                    debugPrint("Page was closed");
                    Get.delete<AvailablePostsController>();
                  },
                  child: const Text("CRUD Home"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
