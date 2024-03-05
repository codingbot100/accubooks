// import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';

// class pie_chart extends StatefulWidget {
//   const pie_chart({super.key});

//   @override
//   State<pie_chart> createState() => _pie_chartState();
// }

// class _pie_chartState extends State<pie_chart> {
//   Map<String, double> dataMap = {
//     'Apple': 10,
//     'Banana': 20,
//     'Orange': 30,
//   };
//   List<Color> colorList = [Colors.red, Colors.green, Colors.blue];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: PieChart(
//             colorList: colorList,
//             dataMap: dataMap,
//             chartType: ChartType.disc,
//             chartLegendSpacing: 10,
//             chartRadius: MediaQuery.of(context).size.width / 1.5,
//             chartValuesOptions: ChartValuesOptions(
//               showChartValuesInPercentage: true,
//               // showChartValuesOutside: true
//             ),
//             legendOptions: LegendOptions(legendPosition: LegendPosition.right),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart2 extends StatefulWidget {
  double new_customer;
  double perviouse;
  double recursive_customer;
  double undetected_customer;

  PieChart2({
    Key? key,
    required this.new_customer,
    required this.recursive_customer,
    required this.undetected_customer,
    required this.perviouse,
  }) : super(key: key);

  @override
  State<PieChart2> createState() => _PieChart2State();
}

class _PieChart2State extends State<PieChart2> {
  final List<Color> segmentColors = [
    // Color(0xFF4CAF50), // Green
    Color(0xFF2196F3), // Blue
    Color(0xFFFFC107), // Yellow
    Color(0xFFF44336), // Red
    Color(0xFF673AB7), // Purple
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 180,
        child: SfCircularChart(
          series: <CircularSeries>[
            DoughnutSeries<SalesData, String>(
              dataSource: <SalesData>[
                SalesData('جدید', widget.new_customer),
                SalesData('قبلی ', widget.perviouse),
                SalesData(' بازگشتی', widget.recursive_customer),
                SalesData(' نامعلوم', widget.undetected_customer),
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              // dataLabelSettings: DataLabelSettings(isVisible: true),
              pointColorMapper: (SalesData sales, _) {
                final salesIndex = sales.sales.toInt(); // Convert to integer
                final index = salesIndex % segmentColors.length;
                return segmentColors[index];
              },
            )
          ],
          legend: Legend(
            isVisible: true,
            position: LegendPosition.right,
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
