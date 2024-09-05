import 'package:flutter/material.dart';

void message(BuildContext context,
    {required String message, required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(10),
        backgroundColor: color,
        content: Text(message)),
  );
}

//color

Color? bgColor = Colors.orange[100];

//button

class ActionButton extends StatelessWidget {
  final Function() onpressed;
  final String actionTitle;
  ActionButton({super.key, required this.onpressed, required this.actionTitle});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange,
      onPressed: onpressed,
      child: Text(actionTitle),
    );
  }
}
