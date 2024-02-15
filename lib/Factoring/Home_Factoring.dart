// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:accubooks/Factoring/First_Row.dart';
import 'package:accubooks/Factoring/TextFieldRow.dart';
import 'package:accubooks/Factoring/secondRow.dart';
import 'package:flutter/material.dart';

class Home_Factoring extends StatefulWidget {
  const Home_Factoring({super.key});

  @override
  State<Home_Factoring> createState() => _Home_FactoringState();
}

class _Home_FactoringState extends State<Home_Factoring> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 120, right: 120, top: 60, bottom: 45),
        child: Expanded(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromRGBO(247, 247, 247, 1),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: Text(
                        "فروشگاه مواد غذایی تک",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Yekan',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  First_Row(),
                  Divider(
                    thickness: 1,
                  ),
                  Second_Row(),
                  Divider(
                    thickness: 1,
                  ),
                  YourWidget(),
                  
                ],
              )),
        ),
      ),
    );
  }
}
