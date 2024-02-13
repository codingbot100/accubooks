// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDotile2 extends StatefulWidget {
  Function(BuildContext)? deleteFunction;
  final String Product_Name;
  final int Number_of_goods;
  final int Barcode_number;
  final int Expiration_date;
  final double provisions;
  final double price;
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
  Color normalColor = Color.fromRGBO(248, 248, 251, 1);
  Color hoverColor = Color.fromRGBO(200, 200, 255, 1);
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
      
    ).animate(_controller);

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
          SlidableAction(
            onPressed: widget.deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade900,
            borderRadius: BorderRadius.circular(12.0),
            spacing: 50,
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
                _controller.forward();
              });
            },
            onExit: (event) {
              setState(() {
                _controller.reverse();
              });
            },
            child: GestureDetector(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      color:
                          Color.lerp(normalColor, hoverColor, _animation.value),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                              width: 60,
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
                            width: 120,
                          ),
                          Container(
                            width: 80,
                            child: Text(
                              widget.Barcode_number.toString(),
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 100,
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
                            width: 30,
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
}
