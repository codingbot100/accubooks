import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class BarChartSample extends StatefulWidget {
  @override
  State<BarChartSample> createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
        minY: 5,
        titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))),
        gridData: FlGridData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barsSpace: 4,
            barRods: [BarChartRodData(toY: 8, color: Colors.blue)],
            showingTooltipIndicators: [0],
          ),
          BarChartGroupData(
            x: 1,
            barsSpace: 4,
            barRods: [BarChartRodData(toY: 12, color: Colors.green)],
            showingTooltipIndicators: [0],
          ),
          BarChartGroupData(
            x: 2,
            barsSpace: 4,
            barRods: [BarChartRodData(toY: 6, color: Colors.orange)],
            showingTooltipIndicators: [0],
          ),
        ],
      ),
    );
  }
}

class sfchart extends StatefulWidget {
  final String title;
  const sfchart({super.key, required this.title});

  @override
  State<sfchart> createState() => _sfchartState();
}

class _sfchartState extends State<sfchart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBackgroundColor: Colors.transparent,
      // margin: EdgeInsets.symmetric(vertical: defaultPadd),
      title: ChartTitle(
          text: widget.title,
          textStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
          )),
      borderWidth: 0,
      plotAreaBorderWidth: 0,
      enableSideBySideSeriesPlacement: false,

      primaryXAxis: CategoryAxis(
          majorTickLines: MajorTickLines(width: 0),
          majorGridLines: MajorGridLines(width: 0),
          labelAlignment: LabelAlignment.center,
          labelStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey[450],
            fontWeight: FontWeight.w700,
          ),
          isVisible: true,
          labelPlacement: LabelPlacement.betweenTicks),
      primaryYAxis: NumericAxis(
        isVisible: false,
        minimum: 0,
        maximum: 2,
        interval: 0.5,
      ),
      series: <CartesianSeries>[
        // SfCartesianSeries(
        //   type: ChartSeriesType.bar,
        //   animationDuration: 1000,
        //   animationDelay: 0,
        //   borderWidth: 0,
        //   borderColor: Colors.transparent,
        //   dataPoints: [
        //     DataPoint(x: 0, y: 8),
        //     DataPoint(x: 1, y: 12),
        //     DataPoint(x: 2, y: 6),
        //   ],
        // ),
        ColumnSeries<ChartColumnData, String>(
          borderRadius: BorderRadius.circular(20),
          dataSource: chartData,
          width: 0.3,
          color: Color(0xFFE9EDF7),
          xValueMapper: (ChartColumnData data, _) => data.x,
          yValueMapper: (ChartColumnData data, _) => data.y,
        ),
        ColumnSeries<ChartColumnData, String>(
          borderRadius: BorderRadius.circular(20),
          dataSource: chartData,
          width: 0.3,
          color: const Color.fromARGB(255, 6, 73, 190),
          xValueMapper: (ChartColumnData data, _) => data.x,
          yValueMapper: (ChartColumnData data, _) => data.y1,
          spacing: 0.2,
        ),
      ],
    );
  }
}

class ChartColumnData {
  ChartColumnData(this.x, this.y, this.y1);
  final String x;
  final double? y;
  final double? y1;
}

final List<ChartColumnData> chartData = <ChartColumnData>[
  ChartColumnData('Jan', 1, 2),
  ChartColumnData('FEB', 2, 2),
  ChartColumnData('Mar', 0.2, 2),
  ChartColumnData('Apr', 0.5, 2),
  ChartColumnData('May', 0.3, 2),
  ChartColumnData('Jun', 0.4, 2),
  ChartColumnData('Jul', 0.8, 2),
  ChartColumnData('Aug', 0.1, 2),
  ChartColumnData('Sep', 0.2, 2),
  ChartColumnData('Oct', 0.9, 2),
  ChartColumnData('Nov', 0.1, 2),
  ChartColumnData('Dec', 0.3, 2),
];

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Bar Chart Example'),
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: sfchart(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BarChartSample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: SfCartesianChart(
//         plotAreaBackgroundColor: Colors.transparent,
//         borderWidth: 0,
//         plotAreaBorderWidth: 0,
//         enableSideBySideSeriesPlacement: false,
//         primaryXAxis: CategoryAxis(
//           labelPlacement: LabelPlacement.onTicks,
//           title: AxisTitle(text: 'Months'),
//           majorGridLines: MajorGridLines(width: 0),
//           interval: 1,
//           edgeLabelPlacement: EdgeLabelPlacement.shift,
//           majorTickLines: MajorTickLines(size: 0),
//         ),
//         primaryYAxis: NumericAxis(
//           isVisible: true,
//           minimum: 0,
//           maximum: 2,
//           interval: 1,
//         ),
//         series: <CartesianSeries>[
//           ColumnSeries<ChartColumnData, String>(
//             borderRadius: BorderRadius.circular(20),
//             dataSource: chartData,
//             width: 0.7, // increase or decrease based on your preference
//             color: Color(0xFFE9EDF7),
//             xValueMapper: (ChartColumnData data, _) => data.x,
//             yValueMapper: (ChartColumnData data, _) => data.y,
//           ),
//           ColumnSeries<ChartColumnData, String>(
//             borderRadius: BorderRadius.circular(20),
//             dataSource: chartData,
//             width: 0.7, // increase or decrease based on your preference
//             color: Color(0xFF0A9396),
//             xValueMapper: (ChartColumnData data, _) => data.x,
//             yValueMapper: (ChartColumnData data, _) => data.y1,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class sfchart extends StatefulWidget {
//   const sfchart({super.key});

//   @override
//   State<sfchart> createState() => _sfchartState();
// }

// class _sfchartState extends State<sfchart> {
//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//       plotAreaBackgroundColor: Colors.transparent,
//       borderWidth: 0,
//       plotAreaBorderWidth: 0,
//       enableSideBySideSeriesPlacement: false,
//       primaryXAxis: CategoryAxis(
//         labelPlacement: LabelPlacement.onTicks,
//         title: AxisTitle(text: 'Months'),
//         majorGridLines: MajorGridLines(width: 0),
//         interval: 1,
//         edgeLabelPlacement: EdgeLabelPlacement.shift,
//         majorTickLines: MajorTickLines(size: 0),
//         maximumLabelWidth: 10,
//         // groupingWidth: 0.8,
//       ),
//       primaryYAxis: NumericAxis(
//         borderWidth: 0,
//         isVisible: true,
//         minimum: 0,
//         maximum: 2,
//         interval: 0.5,
//       ),
//       series: <CartesianSeries>[
//         ColumnSeries<ChartColumnData, String>(
//           borderRadius: BorderRadius.circular(20),
//           dataSource: chartData,
//           width: 0.5,
//           color: Color(0xFFE9EDF7),
//           xValueMapper: (ChartColumnData data, _) => data.x,
//           yValueMapper: (ChartColumnData data, _) => data.y,
//         ),
//         ColumnSeries<ChartColumnData, String>(
//           borderRadius: BorderRadius.circular(20),
//           dataSource: chartData,
//           width: 0.5,
//           color: Color(0xFF0A9396),
//           xValueMapper: (ChartColumnData data, _) => data.x,
//           yValueMapper: (ChartColumnData data, _) => data.y1,
//         ),
//       ],
//     );
//   }
// }

// class ChartColumnData {
//   ChartColumnData(this.x, this.y, this.y1);
//   final String x;
//   final double? y;
//   final double? y1;
// }

// final List<ChartColumnData> chartData = <ChartColumnData>[
//   ChartColumnData('Jan', 2, 1),
//   ChartColumnData('FEB', 2, 1),
//   ChartColumnData('Mar', 2, 1),
//   ChartColumnData('Apr', 2, 1),
//   ChartColumnData('May', 2, 1),
//   ChartColumnData('Jun', 2, 1),
//   ChartColumnData('Jul', 2, 1),
//   ChartColumnData('Aug', 2, 1),
//   ChartColumnData('Sep', 2, 1),
//   ChartColumnData('Oct', 2, 1),
//   ChartColumnData('Nov', 2, 1),
//   ChartColumnData('Dec', 2, 1),
// ];
