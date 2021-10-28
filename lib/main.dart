// ignore_for_file: unused_local_variable, sized_box_for_whitespace, prefer_const_constructors, unnecessary_new

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Covid-19'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ignore: prefer_const_literals_to_create_immutables
            colors: [
              // Color(0xFF2C1843),
              Color(0xFF00A5E5),
              Color(0xFFEFFBFF),
              // Color(0xFFFFFFFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 550,
                child: SfCartesianChart(
                  title: ChartTitle(text: "Data"),
                  primaryXAxis: NumericAxis(
                    title: AxisTitle(text: "x"),
                  ),
                  primaryYAxis: NumericAxis(
                      title: AxisTitle(text: "y"), labelFormat: "{value} M"),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: TooltipBehavior(
                      enable: true, activationMode: ActivationMode.longPress),
                  series: <ChartSeries>[
                    LineSeries<SalesData, double>(
                      dataSource: getColumnData(),
                      xValueMapper: (SalesData sales, _) => sales.x,
                      yValueMapper: (SalesData sales, _) => sales.y,
                      name: "ty",
                      legendIconType: LegendIconType.diamond,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SalesData {
  double x, y;
  SalesData(this.x, this.y);
}

dynamic getColumnData() {
  List<SalesData> columnData = <SalesData>[
    SalesData(10, 20),
    SalesData(20, 30),
    SalesData(30, 10),
    SalesData(40, 20),
  ];
  return columnData;
}

dynamic getHugeData() {
  List<SalesData> hugeData = <SalesData>[];
  double value = 100;
  Random rand = new Random();
  for (int i = 0; i < 1000; i++) {
    if (rand.nextDouble() > 0.5) {
      value += rand.nextDouble();
    } else {
      value -= rand.nextDouble();
    }
    hugeData.add(SalesData(i.toDouble(), value));
  }
  return hugeData;
}
