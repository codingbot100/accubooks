import 'package:accubooks/rep/TopBox.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home_rep extends StatefulWidget {
  Home_rep({super.key});

  @override
  State<Home_rep> createState() => _Home_repState();
}

class _Home_repState extends State<Home_rep> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, top: 50, right: 40),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            // color: Color.fromRGBO(245, 245, 255, 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Center(
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.calendar_month, size: 25),
                                  Text(
                                    '${DateFormat("d,MM,yyy").format(DateTime.now())}'
                                    " - 1,3,2024",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Yekan',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 30, bottom: 10, left: 680),
                          child: Text(
                            "گزارشات  ",
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Yekan',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Column(
                      children: [
                        TopBox(),
                      ],
                    ),
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
