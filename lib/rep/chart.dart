import 'package:accubooks/rep/bar_graph/bar_graph.dart';
import 'package:flutter/material.dart';

class chart extends StatefulWidget {
  const chart({Key? key}) : super(key: key);

  @override
  State<chart> createState() => _chartState();
}

class _chartState extends State<chart> {
  List<double> weeklySummary = [
    4.50,
    2.5,
    100.0,
    90.0,
    88,
    33,
    23,
    90,
    87,
    67,
    54
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: MybarGRAPH(
            weeklySummary: weeklySummary,
          ),
        ),
      ),
    );
  }
}
