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
  late List<ExpenseData> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(
                        enable: true, activationMode: ActivationMode.longPress),
                    series: <ChartSeries>[
                      LineSeries<ExpenseData, String>(
                          dataSource: _chartData,
                          xValueMapper: (ExpenseData exp, _) =>
                              exp.expenseCategory,
                          yValueMapper: (ExpenseData exp, _) => exp.infected,
                          name: 'Infected'),
                      LineSeries<ExpenseData, String>(
                          dataSource: _chartData,
                          xValueMapper: (ExpenseData exp, _) =>
                              exp.expenseCategory,
                          yValueMapper: (ExpenseData exp, _) => exp.cured,
                          name: "cured"),
                      LineSeries<ExpenseData, String>(
                          dataSource: _chartData,
                          xValueMapper: (ExpenseData exp, _) =>
                              exp.expenseCategory,
                          yValueMapper: (ExpenseData exp, _) => exp.death,
                          name: "death"),
                      LineSeries<ExpenseData, String>(
                          dataSource: _chartData,
                          xValueMapper: (ExpenseData exp, _) =>
                              exp.expenseCategory,
                          yValueMapper: (ExpenseData exp, _) => exp.vaccined,
                          name: 'vaccined'),
                    ],
                    primaryXAxis: CategoryAxis(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<ExpenseData> getChartData() {
    const x = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"];
    final List<ExpenseData> chartData = <ExpenseData>[];
    for (int i = 0; i < x.length; i++) {
      chartData.add(ExpenseData(
          x[i], 43 + (i * 10), 23 + (i * 10), 20 + (i * 10), 34 + (i * 10)));
    }
    // ExpenseData('Food', 55, 40, 45, 48),

    // ExpenseData('Transport', 33, 45, 54, 28),
    // ExpenseData('Medical', 43, 23, 20, 34),
    // ExpenseData('Clothes', 32, 54, 23, 54),
    // ExpenseData('Book', 56, 18, 43, 55),
    // ExpenseData('Other', 23, 54, 33, 56),

    return chartData;
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

class ExpenseData {
  ExpenseData(this.expenseCategory, this.infected, this.cured, this.death,
      this.vaccined);
  final String expenseCategory;
  final num infected;
  final num cured;
  final num death;
  final num vaccined;
}
