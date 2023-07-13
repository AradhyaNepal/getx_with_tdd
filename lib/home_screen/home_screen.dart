import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/counter/counter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              Get.to(const CounterScreen());
            },
            child: const Text("Counter"),
          ),
        ],
      ),
    );
  }
}
