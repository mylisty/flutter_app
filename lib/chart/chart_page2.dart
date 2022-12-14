import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'line_chart_sample2.dart';

class MyChartHomePage2 extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyChartHomePage2({Key key}) : super(key: key);

  @override
  _MyChartHomePage2State createState() => _MyChartHomePage2State();
}

class _MyChartHomePage2State extends State<MyChartHomePage2> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  void initState() {
    // TODO: implement initState
    // for (var i = 0; i < 1000; i++) {
    //   data.add(
    //     _SalesData('Mar', (i + 1).toDouble()),
    //   );
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Column(children: [
          ElevatedButton(
            onPressed: () {
              Get.to(LineChartSample2(),transition: Transition.rightToLeft);
            },
            child: Text("next"),
          ),
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: SfSparkLineChart.custom(
                negativePointColor: Colors.lightBlueAccent,
                // plotBand: SparkChartPlotBand(start: 1, end: 3,color: Colors.deepOrangeAccent),
                //Enable the trackball
                trackball: SparkChartTrackball(
                    borderColor: Colors.pinkAccent,
                    color: Colors.white60,
                    backgroundColor: Colors.tealAccent,
                    activationMode: SparkChartActivationMode.tap),
                //Enable marker
                marker: SparkChartMarker(
                    borderColor: Colors.blue,
                    color: Colors.purpleAccent,
                    displayMode: SparkChartMarkerDisplayMode.all),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                color: Colors.orangeAccent,
                axisLineColor: Colors.lime,
                dataCount: data.length,
              ),
            ),
          )
        ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
