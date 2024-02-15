// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class First_Row extends StatelessWidget {
  int number_favtor = 1;

  First_Row({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(
                DateFormat("d,MM,yyy").format(DateTime.now()),
                style: TextStyle(
                  fontFamily: 'Yekan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                ": تاریخ امروز",
                style: TextStyle(
                  fontFamily: 'Yekan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            " شماره فاکتور:  $number_favtor",
            style: TextStyle(
              fontFamily: 'Yekan',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Row(
            children: [
              Container(
                  height: 25,
                  width: 150,
                  child: TextField(
                    style: TextStyle(
                      fontFamily: 'Yekan',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  )),
              Text(
                " : نام مشتری",
                style: TextStyle(
                  fontFamily: 'Yekan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}