import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/counter/counter_screen.dart';
import 'package:getx/crud/crud_home.dart';

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
          padding: const EdgeInsets.all(10),
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
                  onPressed: (){
                    Get.toNamed(CrudHome.route);
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
