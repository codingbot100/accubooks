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
  final num price;
  final int counter;

  ToDotile2(
      {required this.counter,
      required this.Product_Name,
      required this.Number_of_goods,
      required this.Barcode_number,
      required this.Expiration_date,
      required this.provisions,
      required this.price,
      required this.deleteFunction,
      super.key});

  @override
  State<ToDotile2> createState() => _ToDotile2State();
}

class _ToDotile2State extends State<ToDotile2> with TickerProviderStateMixin {
  var color = Colors.transparent;
  late AnimationController _controller;

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
                color = Color.fromRGBO(200, 200, 255, 0.575);
              });
            },
            onExit: (event) {
              setState(() {
                color = Colors.transparent;
              });
            },
            child: GestureDetector(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      color: color,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                              width: 50,
                              child: Text(widget.counter.toString())),
                          Container(
                            padding: EdgeInsets.only(),
                            alignment: Alignment.centerRight,
                            width: 150,
                            child: Text(
                              widget.Product_Name.toString(),
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Container(
                            width: 50,
                            child: Text(
                              widget.Number_of_goods.toString(),
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 50,
                            ),
                            child: Container(
                              width: 130,
                              child: Center(
                                child: Text(
                                  widget.Barcode_number.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Yekan',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 130,
                            child: Text(
                              widget.Expiration_date.toString(),
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Container(
                            width: 100,
                            child: Text(
                              widget.provisions.toString(),
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          Container(
                            width: 70,
                            child: Text(
                              widget.price.toString(),
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
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
              textDirection: TextDirection.rtl, child: Text(message, style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),)),
        ),
        backgroundColor: color,
      ),
    );
  }
}
