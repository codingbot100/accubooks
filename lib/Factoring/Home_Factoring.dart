// ignore_for_file: must_be_immutable

import 'package:accubooks/Factoring/First_Row.dart';
import 'package:accubooks/Factoring/TextFieldRow.dart';
import 'package:accubooks/Factoring/secondRow.dart';
import 'package:flutter/material.dart';

class Home_Factoring extends StatefulWidget {
  Home_Factoring({
    Key? key,
  }) : super(key: key);

  @override
  State<Home_Factoring> createState() => _Home_FactoringState();
}

class _Home_FactoringState extends State<Home_Factoring> with AutomaticKeepAliveClientMixin<Home_Factoring>  {
  late YourWidget youWidgetState;
  int totalSumNew = 0;
  TextEditingController discount = TextEditingController();
  TextEditingController remainedMoNEY = TextEditingController();
  int? counterfactor;

  bool _isActive = false;

  void handleSavePressed() {
    if (_isActive) {
      (youWidgetState as YourWidgetStateInterface).saveDataFromParent();

      print('Save button pressed!');
    } else {
      print('Error: Home_Factoring is not initialized or has been disposed.');
    }
  }

     final Key firstRowKey = UniqueKey();


  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                      FirstRow(
                        key:firstRowKey,
                        counter: counterfactor ?? 0,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Second_Row(),
                      Divider(
                        thickness: 1,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: YourWidget(
                              onStateReady: (state) {
                                youWidgetState = state as YourWidget;
                              },
                              home_factoring: widget,
                              onChangedfactor: (factor) async {
                                setState(() {
                                  counterfactor = factor;
                                });
                              },
                              onSavePressed: () {
                                handleSavePressed();
                              },
                              onIntegerChanged: (totalSum) async {
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
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          color: Color.fromRGBO(248, 249, 251, 1),
                          borderRadius: BorderRadius.circular(6.5)),
                      child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              handleSavePressed();
                            });
                          },
                          child: Text(
                            "  ذخیره کردن ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'YekanBakh',
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          color: Color.fromRGBO(248, 249, 251, 1),
                          borderRadius: BorderRadius.circular(6.5)),
                      child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            " لغو  فاکتور  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'YekanBakh',
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ],
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
              ),
              Text('$counterfactor')
            ],
          ),
        ),
      ),
    );
  }
 @override
  bool get wantKeepAlive => true;
 
}
