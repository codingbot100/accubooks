// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

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

  final List<String> name = [
    "نام کالا",
    "تعداد کالا",
    "نمبر بارکد",
    "تاریخ انقضا",
    "قیمت خرید",
    "قیمت فروش"
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 500,
        width: 200,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Text(
                'کالا خود را ثبت کنید',
                style: TextStyle(
                  fontFamily: 'Yekan',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              for (int i = 0; i < controllers.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    height: 40,
                    child: TextField(
                      cursorOpacityAnimates: true,
                      controller: controllers[i],
                      decoration: InputDecoration(
                        labelText: name[i],
                        labelStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily:
                                "Yekan"), // Use the corresponding label from the name list
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: onCancel,
              child: Text('انصراف',
                  style: TextStyle(
                    fontFamily: 'Yekan',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            TextButton(
              onPressed: () {
                bool allFieldsFilled = controllers.every(
                  (controller) => controller.text.isNotEmpty,
                );

                if (allFieldsFilled) {
                  onSave();
                  _showSnackBar(context, 'اطلاعات با موفقیت ذخیره شد.');
                } else {
                  _showSnackBar(
                      context, 'لطفاً تمامی فیلدها را پر کنید.', Colors.red);
                }
              },
              child: Text(
                'ثبت',
                style: TextStyle(
                  fontFamily: 'Yekan',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message,
      [Color color = Colors.green]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Directionality(
              textDirection: TextDirection.rtl, child: Text(message)),
        ),
        backgroundColor: color,
      ),
    );
  }
}
