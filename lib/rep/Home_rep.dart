import 'package:flutter/material.dart';

class Home_rep extends StatefulWidget {
  const Home_rep({super.key});

  @override
  State<Home_rep> createState() => _Home_repState();
}

class _Home_repState extends State<Home_rep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 30, left: 30, top: 30, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromRGBO(248, 248, 251, 1),
          ),
        ),
      ),
    );
  }
}
