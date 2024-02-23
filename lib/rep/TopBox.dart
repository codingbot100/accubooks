// ignore_for_file: deprecated_member_use

import 'package:accubooks/Factoring/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';

class TopBox extends StatefulWidget {
  const TopBox({super.key});

  @override
  State<TopBox> createState() => _TopBoxState();
}

int num = 4;

class _TopBoxState extends State<TopBox> {
  ToDoDatabsestoreFactor db = ToDoDatabsestoreFactor();
  final _myBox = Hive.box('storeFactor');
  @override
  void initState() {
    if (_myBox.get('TODOLIST2') == null) {
      db.createinitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Topbox(" مجموعه مالی", Icons.attach_money, 90000),
          Topbox("فاکتور ها ", Iconsax.document_1, 90000),
          Topbox("خرید اجناس بازار ", Icons.shopping_cart, 90000),
          Topbox("پرداخت قرض ها", Icons.account_balance_outlined, 90000),
          Topbox("مصارف داخلی  ", Icons.account_balance_sharp, 90000),
        ],
      ),
    );
  }

  Widget Topbox(String PartName, var IconName, var income) {
    return Container(
      width: 170,
      height: 200,
      decoration: BoxDecoration(
          border: Border.all(),
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            IconName,
            size: 50,
          ),
          Center(
            child: Text(
              PartName,
              style: TextStyle(
                  fontFamily: 'Yekan',
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "افغانی ",
                  style: TextStyle(
                      fontFamily: 'Yekan',
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$income",
                  style: TextStyle(
                      fontFamily: 'Yekan',
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
