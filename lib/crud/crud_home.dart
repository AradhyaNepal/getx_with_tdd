import 'package:flutter/material.dart';

class CrudHome extends StatelessWidget {
  static const String route="/CrudHome";
  const CrudHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CRUD Home"
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
