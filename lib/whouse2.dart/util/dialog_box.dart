// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:accubooks/whouse2.dart/my_button2.dart';

class DialogeBox2 extends StatelessWidget {
  final List<TextEditingController> controllers;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogeBox2({
    Key? key,
    required this.onSave,
    required this.onCancel,
    required this.controllers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 600,
        width: 200,
        color: Colors.yellow,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              //Get USER INPUT
              Text('کالا خود را  کنید'),
              SizedBox(height: 40),
              for (int i = 0; i < controllers.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: controllers[i],
                      decoration: InputDecoration(
                        hintText: ' کالا',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 30),
                child: Row(
                  children: [
                    MyButton2(onPress: onSave, text: 'Save'),
                    SizedBox(width: 30),
                    MyButton2(onPress: onCancel, text: 'Load'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
