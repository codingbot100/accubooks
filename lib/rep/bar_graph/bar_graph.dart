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
        backgroundColor: Color.fromRGBO(245, 245, 255, 1),
        maxY: 200,
        minY: 1,
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
            ))),
        barGroups: myBarData.barData
            .asMap()
            .entries
            .map((data) => BarChartGroupData(x: data.key, barRods: [
                  BarChartRodData(
                      toY: data.value.y,
                      color: Colors.grey[800],
                      width: 25,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true, toY: 100, color: Colors.grey[300]))
                ]))
            .toList(),
      ),
    );
  }

  Widget getBottomTitle(double value, Title meta) {
    const style = TextStyle(
      color: Colors.transparent,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    late Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('شنبه', style: style);
        break;
      case 1:
        text = Text('یکشنبه', style: style);
        break;
      case 2:
        text = Text('دوشنبه', style: style);
        break;
      case 3:
        text = Text('سه شنبه', style: style);
        break;
      case 4:
        text = Text('چهار شنبه', style: style);
        break;
      case 5:
        text = Text('پنج شنبه', style: style);
        break;
      case 6:
        text = Text('جمعه', style: style); // Added a meaningful default case
        break;
      default:
    }
    return text;
  }
}
