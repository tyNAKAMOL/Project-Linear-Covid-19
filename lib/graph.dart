// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:math';
import 'package:covid_app/Menu.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "covid-app-330409",
  "private_key_id": "00e37494fdb90b3f61c57c40315bf80ae8a6f6fb",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCaDkEhFKLDP1++\nknJz6ineYd2ThPOx5qEb6fa8WrWrmvE6t0wuD9jkygJaHTZOnSUz64FrG3SQodmj\nx6H4I5SXfpkjP36rklcNCFtS3KzDkJ/3CNjLoPZ24O/K8ykJtxfMfgXZTQK3WCVP\nh0rPE7Bb2TYDT3aYEk5urERBSAnpOlF6uMUIxXDoiSnCQlvAp+14UWYDjttOgbRS\nWuwS+x1ulIifKOTbdKqkXfzyjjenH7zanl/n9kjfzpn+pu1CMn/w3AL1Uw8G95Ah\nfu6ChdRTvTJC7lQEHvjjkWBd4lBO6DRBXwHGrqq1S1qcVdntt4RZTqTwKj3SGMPv\nLayM+oOHAgMBAAECggEABdsC2LoLEbbH8dtpJETDQKOho2jLRnjIqOH0seYUv6gN\nATlUWO/bQ572BezUUpqgfl+2NJb/kDvGpPYCjwbzL+rs8S0JqIXQbzthFT40Bt7p\nZZ9ddifxFkWod6NUbP0bl3c2y7Kkpslf6azvx/0sl+Eir2+Gx3Lyrjw3/+84CThS\nJa3vC/Z32hn9h7r3XSdXKpJ/goILaAYUuWMlyTuvjZopZ4FpQWNWC6GAwBhsJ3p5\n/WVwvNbuhutGL6cUUOl5GySiGExOb5ccDlHi8LKAEKZrOSJ2OndWtL2dMyX/WbBX\nhVi0v03uKW3Rn4ZaTqiXhMy5hj8vfKjZUtYP0Ltl0QKBgQDHzbJDD+hmr+ZvDRrq\nh87v12QitE4YYTiSgABYgEdw2/tv8II1KO6irUmaGu4TIuMA4c88WmbWWLXz0BTg\n0tC0EjYhe2y4zFxFSkCgW7wXtjBICQ14cJ3u+6hxbHrpiziyPrQ/gaSoH/PhVlQV\nhFGAsgREqGJ2+0i2N2x+M8M+CQKBgQDFYpyUeznB6ldVggbAcgSilVkpuB/H9KKR\nYbspk/1HhSoaq0dXIVoAQsPGd7kxX3vJcqZtnxCxvyBYmR2dCIfsE3+gOWv3ExY9\n2P8TNE7zeqllL1NOYK1q6Z/Ea64OT8rtBqbYDku8JiWFrF5HB/uhDoyhIZRrSXgv\n3qoyRmMZDwKBgEYubms37z4Ck0J2q/mtcna0havbAYN2wtRSucxcYru1yX/sTxA1\nLH1fuPa0duOp4Wqx5oUgi/bGekMF2A+QfVaC/xiLrgjLX63HAyRQlKUPja3/4Adq\nJ0+Gfgg5PoNCL8wMUmvsMdYMQzHnjOlx7N7zqKQlMVDxuvymQymhLPdhAoGABuKP\nr6Y0t4zjCvqEHcZcXwdymr/va9wep4+PJb4hwZLlixSaYnGpYAT0K0IV1aENAlPb\ndktsG6cdC7objFS12Qg9FWurVmz2A6ZED3ltn5SRwBPMhhldMzN+/Sz8X0dtPqNS\nwoqNHbz+5hDDIRsoLdACG8S+Fpfzd0f/C83kuwUCgYEAgK85X6iLG0/LnM2HM1rP\ntAAplSvUqfqZad7G8U+YsMk8MUX0rq0UXVU1R5PrXQWrU7I8lchuckEflJODVn9Y\nCyy9MZRdMKL62dR/F5nV6O8rHyXNMeX0kWjUubLJN05Qv/ipEvjMGT1YzSfmZSsf\nEyRacqSm04+0CM5dICud4g0=\n-----END PRIVATE KEY-----\n",
  "client_email": "covid-app@covid-app-330409.iam.gserviceaccount.com",
  "client_id": "111834156400603949709",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/covid-app%40covid-app-330409.iam.gserviceaccount.com"
}
''';

const _spreadsheetId = '16nMmHdCr80dghW7NDhsyTgq1NWSSimWhq_baCONspYo';
String value = "";
String check = "";

class GraphPage extends StatefulWidget {
  final int row;
  final int p;
  const GraphPage({required this.p, required this.row});

  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  late String data;
  late String t;
  // ignore: unused_field
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
          elevation: 0,
          backgroundColor: Color(0xFF2C1843),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: Text("Back"),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
                Color(0xFF9B59B6),
                Color(0xFFEC7063),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(children: [
              Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        spacing: 50,
                        children: <Widget>[
                          Image.asset(
                              "assets/P${widget.p}_ROW${widget.row}.png"),
                        ],
                      ),
                    ]),
              ),
              TextField(
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Input",
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "Input data here",
                ),
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                onChanged: (value) {
                  data = value.trim();
                },
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    InputData(data.toString(), 2);
                    Future.delayed(const Duration(milliseconds: 2000),
                        () async {
                      final gsheets = GSheets(_credentials);
                      final _sheet = await gsheets.spreadsheet(_spreadsheetId);
                      var sheet = _sheet.worksheetByTitle('Page1');
                      value = await sheet!.values.value(column: 3, row: 2);
                      setState(() {});
                    });
                  },
                  icon: Icon(Icons.add_box_outlined),
                  label: Text(
                    "Enter",
                    style: TextStyle(fontSize: 20),
                  )),
              // ElevatedButton.icon(
              //     onPressed: () async {
              //       print(value);

              //       setState(() {});
              //     },
              //     icon: Icon(Icons.download),
              //     label: Text(
              //       "Download",
              //       style: TextStyle(fontSize: 20),
              //     )),
              Text(widget.row.toString()),
              Text(widget.p.toString()),
            ]),

            // child: Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       Container(
            //         height: 550,
            //         child: SfCartesianChart(
            //           title: ChartTitle(text: "Data"),
            //           legend: Legend(isVisible: true),
            //           tooltipBehavior: TooltipBehavior(
            //               enable: true, activationMode: ActivationMode.longPress),
            //           series: <ChartSeries>[
            //             LineSeries<ExpenseData, String>(
            //                 dataSource: _chartData,
            //                 xValueMapper: (ExpenseData exp, _) =>
            //                     exp.expenseCategory,
            //                 yValueMapper: (ExpenseData exp, _) => exp.infected,
            //                 name: 'Infected'),
            //             LineSeries<ExpenseData, String>(
            //                 dataSource: _chartData,
            //                 xValueMapper: (ExpenseData exp, _) =>
            //                     exp.expenseCategory,
            //                 yValueMapper: (ExpenseData exp, _) => exp.cured,
            //                 name: "cured"),
            //             LineSeries<ExpenseData, String>(
            //                 dataSource: _chartData,
            //                 xValueMapper: (ExpenseData exp, _) =>
            //                     exp.expenseCategory,
            //                 yValueMapper: (ExpenseData exp, _) => exp.death,
            //                 name: "death"),
            //             LineSeries<ExpenseData, String>(
            //                 dataSource: _chartData,
            //                 xValueMapper: (ExpenseData exp, _) =>
            //                     exp.expenseCategory,
            //                 yValueMapper: (ExpenseData exp, _) => exp.vaccined,
            //                 name: 'vaccined'),
            //           ],
            //           primaryXAxis: CategoryAxis(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

List<ExpenseData> getChartData() {
  const x = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"];
  final List<ExpenseData> chartData = <ExpenseData>[];
  for (int i = 0; i < x.length; i++) {
    chartData.add(ExpenseData(
        x[i], 43 + (i * 10), 23 + (i * 10), 20 + (i * 10), 34 + (i * 10)));
  }

  return chartData;
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
  // ignore: unnecessary_new
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

void InputData(String data, int roll) async {
  final gsheets = GSheets(_credentials);
  final _sheet = await gsheets.spreadsheet(_spreadsheetId);
  var sheet = _sheet.worksheetByTitle('Page1');
  await sheet!.values.insertValue(data, column: 2, row: roll);
}

void OutputData(int roll) async {
  final gsheets = GSheets(_credentials);
  final _sheet = await gsheets.spreadsheet(_spreadsheetId);
  var sheet = _sheet.worksheetByTitle('Page1');
  final cell = await sheet!.cells.cell(column: 3, row: roll);
  value = cell.value;
}

void Check(int roll) async {
  final gsheets = GSheets(_credentials);
  final _sheet = await gsheets.spreadsheet(_spreadsheetId);
  var sheet = _sheet.worksheetByTitle('Page1');
  final cell = await sheet!.cells.cell(column: 2, row: roll);
  check = cell.value;
}
