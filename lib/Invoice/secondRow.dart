import 'package:flutter/material.dart';

class Second_Row extends StatefulWidget {
  const Second_Row({super.key});

  @override
  State<Second_Row> createState() => _Second_RowState();
}

class _Second_RowState extends State<Second_Row> {
  List<String> names_List = [
    "قیمت کل ",
    "قیمت فی",
    "تعداد کالا",
    "نام کالا",
    "نمبر بارکد",
    "کالای شماره"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var name in names_List)
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Yekan',
                        fontWeight: FontWeight.w900),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
