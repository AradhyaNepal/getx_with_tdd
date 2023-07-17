import 'package:flutter/material.dart';

class GenericAlert extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onSuccess;

  const GenericAlert({
    required this.title,
    required this.content,
    required this.onSuccess,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context,true);
            onSuccess();
          },
          child: const Text(
            "Yes",
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context,false);
          },
          child: const Text(
            "No",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
