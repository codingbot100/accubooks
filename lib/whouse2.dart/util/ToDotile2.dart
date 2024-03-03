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
                color = Color.fromRGBO(243, 243, 243, 1);
              });
            },
            onExit: (event) {
              setState(() {
                color = Colors.transparent;
              });
            },
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
                        // SizedBox(
                        //   width: 33,
                        // ),
                        title(widget.counter.toString(), 50),
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
