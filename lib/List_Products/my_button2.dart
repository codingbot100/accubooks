import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton2 extends StatelessWidget {
  final String text;
  VoidCallback onPress;
   MyButton2({super.key,
   required this.onPress,required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child:Text(text)
    );
  }
}
