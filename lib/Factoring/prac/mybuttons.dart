import 'package:flutter/material.dart';

class mybuttons extends StatelessWidget {
  final String topic;
  int counter;
  final Function callbackFunction;

  mybuttons(
      {super.key,
      required this.topic,
      required this.callbackFunction,
      required this.counter});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callbackFunction('good boy', counter);
      },
      child: Container(
        color: Colors.lightBlue,
        width: 300,
        height: 70,
        margin: EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 20),
        child: Center(
          child: Text(topic),
        ),
      ),
    );
  }
}
