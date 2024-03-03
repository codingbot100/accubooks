// ignore_for_file: deprecated_member_use

import 'package:accubooks/rep/pie_Chart/Home_chart.dart';
import 'package:accubooks/rep/MainChart/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TopBox extends StatefulWidget {
  const TopBox({super.key});

  @override
  State<TopBox> createState() => _TopBoxState();
}

int num = 4;

class _TopBoxState extends State<TopBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  bigBox("پرداخت قرض ها", 90000),
                  bigBox(" مشتریان ", 90000),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    // left: 20.0, right: 40, bottom: 90
                    right: 20,
                    left: 10),
                child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 0.9, color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    width: 520,
                    height: 300,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 55, left: 15, bottom: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ringe('100%'),
                              ringe('90%'),
                              ringe('80%'),
                              ringe('60%'),
                              ringe('50%'),
                              ringe('40%'),
                              ringe('30%'),
                              ringe('10%'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 10, right: 10),
                            child: Container(
                                child: Center(
                                    child: sfchart(
                              title: "خسارات ماهانه",
                            ))),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Topbox("پرداخت قرض ها", Icons.account_balance_outlined, 90000),
                Topbox("مصارف داخلی  ", Icons.account_balance_sharp, 90000),
              ],
            ),
            Row(
              children: [
                Topbox(" مجموعه مالی", Icons.attach_money, 90000),
                // Topbox("فاکتور ها ", Iconsax.document_1, 90000),
                Topbox("خرید اجناس بازار ", Icons.shopping_cart, 90000),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  // left: 20.0, right: 40, bottom: 90
                  right: 20,
                  left: 10),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.9, color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: 520,
                  height: 300,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 55, left: 15, bottom: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ringe('100%'),
                            ringe('90%'),
                            ringe('80%'),
                            ringe('60%'),
                            ringe('50%'),
                            ringe('40%'),
                            ringe('30%'),
                            ringe('10%'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 10, right: 10),
                          child: Container(
                              child: Center(
                                  child: sfchart(
                            title: 'فروشات ماهانه ',
                          ))),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }

  Widget ringe(String range) {
    return Row(
      children: [
        Text('$range',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
                fontFamily: 'YekanBakh')),
      ],
    );
  }

  Widget Topbox(String PartName, var IconName, var income) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 6, bottom: 6),
      child: Container(
        width: 250,
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(width: 0.9, color: Colors.grey.shade500),
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Icon(
                      IconName,
                      size: 38,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Center(
                      child: Text(
                        PartName,
                        style: TextStyle(
                            fontFamily: 'Yekan',
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "افغانی ",
                    style: TextStyle(
                        fontFamily: 'Yekan',
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "$income",
                    style: TextStyle(
                        fontFamily: 'Yekan',
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 15),
                    child: Text(
                      "از شروع ماه",
                      style: TextStyle(
                          fontFamily: 'Yekan',
                          color: Colors.grey[400],
                          fontSize: 10,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 4),
                    child: Text(
                      "55.0 %",
                      style: TextStyle(
                          fontFamily: 'Yekan',
                          color: Colors.grey[500],
                          fontSize: 12,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Icon(
                    Iconsax.arrow_up_3,
                    size: 17,
                    color: Colors.green,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bigBox(String PartName, var income) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: 250,
        height: 310,
        decoration: BoxDecoration(
            border: Border.all(width: 0.9, color: Colors.grey.shade500),
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Center(
                      child: Text(
                        PartName,
                        style: TextStyle(
                            fontFamily: 'Yekan',
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "$income",
                    style: TextStyle(
                        fontFamily: 'Yekan',
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    "از شروع ماه",
                    style: TextStyle(
                        fontFamily: 'Yekan',
                        color: Colors.grey[400],
                        fontSize: 10,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            PieChart2(
              new_customer: 20,
              perviouse: 50,
              recursive_customer: 10,
              undetected_customer: 30,
            )
          ],
        ),
      ),
    );
  }
}
