import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/crud/all_posts_screen.dart';
import 'package:getx/crud/specific_post_screen.dart';
import 'package:getx/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: AllPostScreen.route,
          page: ()=>const AllPostScreen(),
        ),
        GetPage(
          name: SpecificPostScreen.route,
          page: ()=> SpecificPostScreen(),
        ),
      ],
      home: const HomeScreen(),
    );
  }
}
