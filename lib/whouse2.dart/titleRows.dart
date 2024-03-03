import 'package:flutter/material.dart';

class titleRows extends StatelessWidget {
  const titleRows({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        SizedBox(
          width: 10,
        ),
        title("قیمت فروش"),
        SizedBox(
          width: 60,
        ),
        title(
          "قیمت خرید",
        ),
        SizedBox(
          width: 125,
        ),
        title("کتگوری"),
        SizedBox(
          width: 125,
        ),
        title('تاریخ انقضا'),
        SizedBox(
          width: 106,
        ),
        title('نمبر بارکد'),
        SizedBox(
          width: 105,
        ),
        title('تعداد کالا'),
        SizedBox(
          width: 110,
        ),
        title('نام کالا'),
        SizedBox(
          width: 130,
        ),
        Container(
          width: 45,
          child: Text(
            "شماره",
            style: TextStyle(
              fontFamily: 'Yekan',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ]),
    );
  }

  Widget title(String title) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Yekan',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
