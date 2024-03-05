// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDotile2 extends StatefulWidget {
  Function(BuildContext)? deleteFunction;
  final String Product_Name;
  final int Number_of_goods;
  final int Barcode_number;
  final String Expiration_date;
  final num provisions;
  final String part;
  final num price;

  final int counter;

  ToDotile2(
      {required this.counter,
      required this.Product_Name,
      required this.Number_of_goods,
      required this.Barcode_number,
      required this.Expiration_date,
      required this.provisions,
      required this.part,
      required this.price,
      required this.deleteFunction,
      super.key});

  @override
  State<ToDotile2> createState() => _ToDotile2State();
}

class _ToDotile2State extends State<ToDotile2> with TickerProviderStateMixin {
  var color = Colors.transparent;
  late AnimationController _controller;
  bool isHover = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          Container(
            child: SlidableAction(
              onPressed: (BuildContext) {
                widget.deleteFunction!(BuildContext);
                _showSnackBar(context, "لیست موفقانه پاک شد.");
              },
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 232, 17, 17),
              borderRadius: BorderRadius.circular(5.0),
              spacing: 10,
            ),
          )
        ],
      ),
      child: Container(
        width: double.infinity,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onHover: (event) {
              setState(() {
                Duration(milliseconds: 2500);
                color = Color.fromRGBO(51, 241, 54, 0.533);
              });
            },
            onEnter: (event) {
              setState(() {
                isHover = true;
                // color = const Color.fromARGB(255, 244, 239, 239);
              });
            },
            onExit: (event) {
              setState(() {
                isHover = false;
                color = Colors.transparent;
              });
            },
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Expanded(
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.only(
                          topRight: (isHover)
                              ? Radius.circular(40)
                              : Radius.circular(0),
                          topLeft: (isHover)
                              ? Radius.circular(40)
                              : Radius.circular(0),
                          bottomLeft: (isHover)
                              ? Radius.circular(40)
                              : Radius.circular(0),
                          bottomRight: (isHover)
                              ? Radius.circular(40)
                              : Radius.circular(0))),
                  height: isHover ? 40 : 23,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // SizedBox(
                      //   width: 33,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Container(
                            width: 25,
                            child: Center(
                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                        color: isHover
                                            ? Colors.pink
                                            : Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: Text(
                                        widget.counter.toString(),
                                        style: TextStyle(
                                            fontFamily: 'Yekan',
                                            color: isHover
                                                ? Colors.white
                                                : Colors.grey[700],
                                            fontSize: isHover ? 20 : 16,
                                            fontWeight: isHover
                                                ? FontWeight.normal
                                                : FontWeight.bold),
                                      ),
                                    )))),
                      ),
                      title(widget.Product_Name.toString(), 190),
                      // SizedBox(
                      //   width: 17,
                      // ),
                      title(widget.Number_of_goods.toString(), 50),
                      // SizedBox(
                      //   width: 25,
                      // ),
                      title(widget.Barcode_number.toString(), 170),
                      // SizedBox(
                      //   width: 19,
                      // ),
                      title(widget.Expiration_date.toString(), 90),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      title(widget.part.toString(), 170),
                      title(widget.provisions.toString(), 100),
                      // SizedBox(
                      //   width: 90,
                      // ),
                      title(widget.price.toString(), 70),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget title(String inText, double width) {
    return Container(
      width: width,
      child: Center(
        child: Text(
          inText,
          style: TextStyle(
              fontFamily: 'Yekan',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message,
      [Color color = Colors.green]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                message,
                style: TextStyle(
                    fontFamily: 'Yekan',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )),
        ),
        backgroundColor: color,
      ),
    );
  }
}
