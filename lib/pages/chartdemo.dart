// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class LineChartSample extends StatelessWidget {
//   const LineChartSample({super.key});

//   @override
//   @override
//   Widget build(BuildContext context) {
//     final List<ChartData> chartData = [
//       ChartData(2010, 35),
//       ChartData(2011, 28),
//       ChartData(2012, 34),
//       ChartData(2013, 32),
//       ChartData(2014, 40)
//     ];

//     return Scaffold(
//         body: Center(
//             child: Container(
//                 child: SfCartesianChart(series: <ChartSeries>[
//       // Renders line chart
//       LineSeries<ChartData, int>(
//           dataSource: chartData,
//           xValueMapper: (ChartData data, _) => data.x,
//           yValueMapper: (ChartData data, _) => data.y)
//     ]))));
//   }

//   Widget _buildLineChart() {
//     return SfCartesianChart(
//       title: ChartTitle(text: 'Line Chart Example'),
//       legend: const Legend(isVisible: true),
//       tooltipBehavior: TooltipBehavior(enable: true),
//       series: <ChartSeries>[
//         LineSeries<SalesData, double>(
//           dataSource: _getChartData(),
//           xValueMapper: (SalesData sales, _) => sales.year,
//           yValueMapper: (SalesData sales, _) => sales.sales,
//           name: 'Sales',
//         ),
//       ],
//       primaryXAxis: NumericAxis(title: AxisTitle(text: 'Year')),
//       primaryYAxis: NumericAxis(title: AxisTitle(text: 'Sales')),
//     );
//   }

//   List<SalesData> _getChartData() {
//     final List<SalesData> chartData = [
//       SalesData(2010, 35),
//       SalesData(2011, 28),
//       SalesData(2012, 34),
//       SalesData(2013, 32),
//       SalesData(2014, 40),
//       SalesData(2015, 30),
//     ];
//     return chartData;
//   }
// }

// class SalesData {
//   SalesData(this.year, this.sales);

//   final double year;
//   final double sales;
// }

// class ChartData {
//   ChartData(this.x, this.y);
//   final int x;
//   final double y;
// }
