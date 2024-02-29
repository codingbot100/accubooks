import 'package:accubooks/rep/TopBox.dart';
import 'package:accubooks/rep/chart.dart';
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
            color: Color.fromRGBO(245, 245, 255, 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 220,
                height: double.infinity,
                color: Color.fromARGB(32, 4, 179, 248),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  TopBox(),
                  Center(
                      child: Container(width: 800, height: 300, child: chart()))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
