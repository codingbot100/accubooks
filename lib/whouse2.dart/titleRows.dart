import 'package:flutter/material.dart';

class titleRows extends StatelessWidget {
  const titleRows({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        title("قیمت فروش"),
        title("قیمت خرید",),
        title("کتگوری"),
        title('تاریخ انقضا'),
        title('نمبر بارکد'),
        title('تعداد کالا'),
        title('نام کالا'),
        title("شماره"),
      ]),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Yekan',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
