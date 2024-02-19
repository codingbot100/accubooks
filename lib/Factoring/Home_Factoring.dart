// ignore_for_file: must_be_immutable

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
  int totalSumNew = 0;
  TextEditingController discount = TextEditingController();
  TextEditingController remainedMoNEY = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color.fromRGBO(247, 247, 247, 1),
          ),
          child: Column(
            children: [
              Expanded(
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
                              fontWeight: FontWeight.w900,
                            ),
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
                      Expanded(
                        child: SingleChildScrollView(
                          child: YourWidget(onIntegerChanged: (totalSum) async {
                            setState(() {
                              totalSumNew = totalSum;
                            });
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " افغانی",
                            style: TextStyle(
                              fontFamily: 'Yekan',
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$totalSumNew",
                            style: TextStyle(
                              fontFamily: 'Yekan',
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      ": " ' جمع کل پول  ',
                      style: TextStyle(
                        fontFamily: 'Yekan',
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Container(
                      height: 30,
                      width: 150,
                      child: Center(
                        child: TextField(
                          style: TextStyle(
                            fontFamily: 'Yekan',
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                          controller: remainedMoNEY,
                          cursorHeight: 0,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              prefix: Text(
                                "افغانی",
                                style: TextStyle(
                                    fontFamily: 'Yekan',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.8, color: Colors.black))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      ": " "باقی مانده حساب",
                      style: TextStyle(
                        fontFamily: 'Yekan',
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    Container(
                      height: 33,
                      width: 150,
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Yekan',
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                        cursorHeight: 0,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefix: Text(
                              "افغانی",
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.8, color: Colors.grey))),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      ": " "تخفیف برای مشتریان ",
                      style: TextStyle(
                        fontFamily: 'Yekan',
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
