// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoEmployees extends StatefulWidget {
  Function(BuildContext)? deleteFunction;
  final String Name;
  final String Father_s_name;
  final String Address;
  final String date_of_employeement;
  final String education;
  var Salary;
  final int counter;

  ToDoEmployees(
      {required this.counter,
      required this.Name,
      required this.Father_s_name,
      required this.Address,
      required this.date_of_employeement,
      required this.education,
      required this.Salary,
      required this.deleteFunction,
      super.key});

  @override
  State<ToDoEmployees> createState() => _ToDoEmployeesState();
}

class _ToDoEmployeesState extends State<ToDoEmployees>
    with TickerProviderStateMixin {
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

  bool isHover = false;
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
                _showSnackBar(context, "کارمند موفقانه حدف شد ");
              },
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 232, 17, 17),
              borderRadius: BorderRadius.circular(5.0),
              spacing: 10,
            ),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                            width: 25,
                            child: Center(
                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                        color: isHover
                                            ? Colors.pink
                                            : Colors.grey[200],
                                        borderRadius: BorderRadius.circular(100)),
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
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          alignment: Alignment.centerRight,
                          width: 140,
                          child: Center(
                            child: Text(
                              widget.Name.toString(),
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 110,
                          child: Center(
                            child: Text(
                              widget.Father_s_name.toString(),
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Container(
                            width: 140,
                            child: Center(
                              child: Text(
                                widget.Address.toString(),
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
                          child: Center(
                            child: Text(
                              widget.date_of_employeement.toString(),
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Container(
                          width: 100,
                          child: Center(
                            child: Text(
                              widget.education.toString(),
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Container(
                          width: 90,
                          child: Center(
                            child: Text(
                              widget.Salary.toString(),
                              style: TextStyle(
                                  fontFamily: 'Yekan',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
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
    );
  }

  void _showSnackBar(BuildContext context, String message,
      [Color color = Colors.green]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Directionality(
              textDirection: TextDirection.rtl, child: Text(message)),
        ),
        backgroundColor: color,
      ),
    );
  }
}
