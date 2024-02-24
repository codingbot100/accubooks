import 'package:accubooks/Factoring/secondRow.dart';
import 'package:flutter/material.dart';

// main() {
//   runApp(page_detail());
// }

class page_detail extends StatefulWidget {
  final int numberFactor;
  final String TodayDate;
  final String day;
  var time;
  final String customer_name;
  final int barcode;
  final String siglePrice;
  final String totalPrice;
  page_detail(
      {super.key,
      required this.numberFactor,
      required this.TodayDate,
      required this.day,
      required this.customer_name,
      required this.barcode,
      required this.siglePrice,
      required this.totalPrice});

  @override
  State<page_detail> createState() => _page_detailState();
}

class _page_detailState extends State<page_detail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
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
                Padding(
                  padding: EdgeInsets.only(
                    top: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.time,
                        style: TextStyle(
                          fontFamily: 'Yekan',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          title(
                            widget.day,
                          ),
                          title("  :  " "امروز"),
                        ],
                      ),
                      Row(
                        children: [
                          title(
                            '$widget.TodayDate',
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          title(": تاریخ امروز"),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      title('$widget.numberFactor'),
                      Row(
                        children: [
                          title('$widget.customer_name'),
                          SizedBox(
                            width: 10,
                          ),
                          title(": " + 'نام مشتری')
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Second_Row(),
                Divider(
                  thickness: 1,
                ),
                Expanded(
                    child: Container(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: ((context, index) {
                        int index1 = index + 1;
                        return pageTitle(index1);
                      })),
                ))
              ],
            ),
          )),
    ));
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

  Widget pageTitle(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 30,
            width: 180,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Center(
                child: Text(
              '',
              style: TextStyle(
                fontFamily: 'Yekan',
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            )),
          ),
          Container(
            height: 30,
            width: 180,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Center(
                child: Text(
              '',
              style: TextStyle(
                fontFamily: 'Yekan',
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            )),
          ),
          Container(
            height: 30,
            width: 180,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Center(
                child: Text(
              '',
              style: TextStyle(
                fontFamily: 'Yekan',
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            )),
          ),
          Container(
            height: 30,
            width: 180,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Center(
                child: Text(
              '',
              style: TextStyle(
                fontFamily: 'Yekan',
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            )),
          ),
          Container(
            height: 30,
            width: 180,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Center(
                child: Text(
              '',
              style: TextStyle(
                fontFamily: 'Yekan',
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            )),
          ),
          Container(
            height: 30,
            width: 180,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Center(
                child: Text(
              '$index',
              style: TextStyle(
                fontFamily: 'Yekan',
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            )),
          )
        ],
      ),
    );
  }
}
