import 'package:accubooks/rep/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MybarGRAPH extends StatelessWidget {
  final List weeklySummary;
  const MybarGRAPH({Key? key, required this.weeklySummary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Perform null checks on each value in weeklySummary
    double sunAmount =
        weeklySummary.length > 0 ? (weeklySummary[0] ?? 0.0) : 0.0;
    double monAmount =
        weeklySummary.length > 1 ? (weeklySummary[1] ?? 0.0) : 0.0;
    double tueAmount =
        weeklySummary.length > 2 ? (weeklySummary[2] ?? 0.0) : 0.0;
    double wedAmount =
        weeklySummary.length > 3 ? (weeklySummary[3] ?? 0.0) : 0.0;
    double thurAmount =
        weeklySummary.length > 4 ? (weeklySummary[4] ?? 0.0) : 0.0;
    double friAmount =
        weeklySummary.length > 5 ? (weeklySummary[5] ?? 0.0) : 0.0;
    double satAmount =
        weeklySummary.length > 6 ? (weeklySummary[6] ?? 0.0) : 0.0;

    BarData myBarData = BarData(
      sunAmount: sunAmount,
      monAmount: monAmount,
      thurAmount: thurAmount,
      friAmount: friAmount,
      satAmount: satAmount,
      tueAmount: tueAmount,
      wedAmount: wedAmount,
    );

    myBarData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: 500000,
        minY: 1,
        barGroups: myBarData.barData
            .asMap()
            .entries
            .map((data) => BarChartGroupData(
                x: data.key, barRods: [BarChartRodData(toY: data.value.y)]))
            .toList(),
      ),
    );
  }
}
