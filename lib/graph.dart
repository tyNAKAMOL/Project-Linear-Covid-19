// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, use_key_in_widget_constructors, must_call_super

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
bool _visible = false;
String output1 = "";
String output2 = "";
String output3 = "";
String data = "";

class GraphPage extends StatefulWidget {
  final int row;
  final int p;
  const GraphPage(
      {required this.p,
      required this.row,
      required String huakor,
      required String samakan,
      required String kampud});

  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  late String t;
  // ignore: unused_field

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Data"),
            content: TextField(
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                onChanged: (value) {
                  data = value.trim();
                },
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: "Input",
                  labelStyle: TextStyle(color: Colors.purple),
                  hintText: "Input data here",
                )),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: Text('Enter'),
                  onPressed: () {
                    InputData(data.toString(), widget.row);
                    Future.delayed(const Duration(milliseconds: 2000),
                        () async {
                      _visible = true;
                      Navigator.pop(context);
                      final gsheets = GSheets(_credentials);
                      final _sheet = await gsheets.spreadsheet(_spreadsheetId);
                      var sheet = _sheet.worksheetByTitle('Page1');
                      final cell1 =
                          await sheet!.cells.cell(column: 6, row: widget.row);
                      output1 = cell1.value;
                      final cell2 =
                          await sheet.cells.cell(column: 7, row: widget.row);
                      output2 = cell2.value;
                      final cell3 =
                          await sheet.cells.cell(column: 3, row: widget.row);
                      output3 = cell3.value;
                      setState(() {});
                    });
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF2C1843),
          leading: IconButton(
            onPressed: () {
              output1 = "";
              output2 = "";
              output3 = "";
              data = "";
              _visible = false;
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
                stops: [0.1, 0.3, 0.75],
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  // Color(0xFF2C1843),
                  Color(0xFF1BA7E3),
                  Color(0xFF7E46FD),
                  Color(0xFF020546),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              // ignore: avoid_unnecessary_containers
              child: Container(
                color: Colors.white,
                width: 800,
                height: 800,
                child: Column(
                  children: [
                    Spacer(),
                    // Wrap(spacing: 20, children: <Widget>[
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Wrap(
                            // children: <Widget>[
                            // ignore: avoid_unnecessary_containers
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    30), //border corner radius
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple
                                        .withOpacity(0.7), //color of shadow
                                    spreadRadius: 5, //spread radius
                                    blurRadius: 7, // blur radius
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                    //first paramerter of offset is left-right
                                    //second parameter is top to down
                                  ),
                                  //you can set more BoxShadow() here
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/P${widget.p}_ROW${widget.row}.png",
                                  // height: 500,
                                ),
                              ),
                              // height: 500,
                              // decoration: BoxDecoration(
                              //   color: Colors.amber[300],
                              //   borderRadius: BorderRadius.circular(40),
                              // ),
                              // child: Image.asset(
                              //     "assets/P${widget.p}_ROW${widget.row}.png"),
                            ),
                            // Image.asset(
                            //     "assets/P${widget.p}_ROW${widget.row}.png"),
                            // ],
                          ]),
                    ),
                    // Spacer(),
                    Center(
                      child: Container(
                        height: 150,
                        width: 850,
                        child: Center(
                          child: Column(
                            children: [
                              Opacity(
                                opacity: 0.0,
                                child: Image.asset(
                                  "assets/Animation.gif",
                                  width: 18,
                                  height: 18,
                                ),
                              ),
                              Center(
                                  child: Text(
                                "จากกราฟความสัมพันธ์ระหว่าง${huakor}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF020546)),
                              )),
                              Center(
                                  child: Text(
                                "คำนวนได้จากสมการ ${samakan}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF020546)),
                              )),
                              Center(
                                  child: Text(
                                "${kampud}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF020546)),
                              )),
                              Center(
                                  // ignore: unnecessary_brace_in_string_interps
                                  child: Opacity(
                                opacity: _visible ? 1.0 : 0.0,
                                child: Text(
                                  "${output1} ${data} คน ${output2} ${output3} คน",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          OutputData(widget.row);
                          createAlertDialog(context);
                        },
                        icon: Icon(
                          Icons.add_box_outlined,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF020546),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        label: Text(
                          "Input Data",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
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
