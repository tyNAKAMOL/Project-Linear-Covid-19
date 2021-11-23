// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, use_key_in_widget_constructors, must_call_super, sized_box_for_whitespace, deprecated_member_use, unnecessary_brace_in_string_interps, curly_braces_in_flow_control_structures

import 'dart:math';
import 'package:covid_app/Menu.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

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
String output4 = "";
String data = "";
String data2 = "";
int parapapa = 0;
var _controller = TextEditingController();
var _controller2 = TextEditingController();

class GraphPage extends StatefulWidget {
  final int row;
  final int p;
  final int para;
  const GraphPage(
      {required this.para,
      required this.p,
      required this.row,
      required String huakor,
      required String samakan,
      required String kampud});

  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  late String name1 = "";
  late String name2 = "";
  late String t;
  // ignore: unused_field
  @override
  void initState() {
    parapapa = widget.para;
    if (widget.row == 2 ||
        widget.row == 4 ||
        widget.row == 6 ||
        widget.row == 8 ||
        widget.row == 22 ||
        widget.row == 24 ||
        widget.row == 26 ||
        widget.row == 30) {
      name1 = "Infected";
    }
    if (widget.row == 10 ||
        widget.row == 14 ||
        widget.row == 18 ||
        widget.row == 34) {
      name1 = "Vaccined";
    }
    if (widget.row == 22 || widget.row == 24 || widget.row == 34) {
      name2 = "Death";
    } else {
      name2 = "Vaccined";
    }

    super.initState();
  }

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
                    showDialog(
                        context: context,
                        builder: (_) => FlareGiffyDialog(
                              flarePath: 'assets/space_demo.flr',
                              flareAnimation: 'loading',
                              title: Text(
                                'เลือก phase',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              description: Text(
                                'Phase 1 : ช่วง ม.ค. - มิ.ย.64\nPhase 2 : ช่วง ก.ค. - ต.ค. 64',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              entryAnimation: EntryAnimation.DEFAULT,
                              buttonCancelText: Text("Phase 1"),
                              buttonCancelColor: Colors.green,
                              buttonOkColor: Colors.green,
                              buttonOkText: Text("Phase 2"),
                              onOkButtonPressed: () {},
                              onCancelButtonPressed: () {},
                            ));
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
              output4 = "";
              data = "";
              _controller.clear();
              _controller2.clear();
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
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/Logo-Covid19_2.png"),
                )),
            child: Center(
              // ignore: avoid_unnecessary_containers
              child: Container(
                color: Colors.white.withOpacity(0.5),
                width: 850,
                height: 800,
                child: Column(
                  children: [
                    Spacer(),
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // ignore: avoid_unnecessary_containers
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    30), //border corner radius
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple
                                        .withOpacity(0.9), //color of shadow
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
                                    "assets/X/${widget.para}P${widget.p}_ROW${widget.row}.png"),
                              ),
                              height: parapapa == 2 ? 450 : 400,
                            ),
                          ]),
                    ),
                    // Spacer(),
                    Center(
                      child: Container(
                        // color: Colors.amber,
                        height: 120,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Spacer(),
                    Container(
                      width: 300.0,
                      // height: 100.0,
                      // padding: const EdgeInsets.all(1.0),
                      // child: Row(children: [
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: false, decimal: false),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          fillColor: Colors.deepPurple,
                          // filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF020546), width: 3.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF020546), width: 3.0),
                          ),
                          labelText: name1,
                          labelStyle: TextStyle(color: Color(0xFF020546)),
                          hintText:
                              "Insert your ${name1} here", //"Insert your Data here"
                        ),
                        onChanged: (value) {
                          setState(() {
                            data = value.trim(); // ตัด spacebar
                          });
                        },
                      ),
                    ),
                    if (widget.para == 3)
                      SizedBox(
                        height: 10,
                      ),
                    if (widget.para == 3)
                      Container(
                        width: 300.0,
                        // height: 100.0,
                        // padding: const EdgeInsets.all(1.0),
                        // child: Row(children: [
                        child: TextField(
                          controller: _controller2,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: false, decimal: false),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            fillColor: Colors.deepPurple,
                            // filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF020546), width: 3.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF020546), width: 3.0),
                            ),
                            labelText: name2,
                            labelStyle: TextStyle(color: Color(0xFF020546)),
                            hintText: "Insert your ${name2}} here",
                          ),
                          onChanged: (value) {
                            setState(() {
                              data2 = value.trim(); // ตัด spacebar
                            });
                          },
                        ),
                      ),
                    Spacer(),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          _visible = true;
                          setState(() {});
                          InputData(data.toString(), widget.row);
                          if (widget.para == 3)
                            InputData(data2.toString(), widget.row + 1);
                          Future.delayed(const Duration(milliseconds: 2000),
                              () async {
                            // Navigator.pop(context)
                            final gsheets = GSheets(_credentials);
                            final _sheet =
                                await gsheets.spreadsheet(_spreadsheetId);
                            var sheet = _sheet.worksheetByTitle('Page1');
                            final cell1 = await sheet!.cells
                                .cell(column: 6, row: widget.row);
                            output1 = cell1.value;
                            final cell2 = await sheet.cells
                                .cell(column: 7, row: widget.row);
                            output2 = cell2.value;
                            final cell3 = await sheet.cells.cell(
                                column: 3,
                                row: widget.para == 3
                                    ? widget.row
                                    : widget.row + 35);
                            output3 = cell3.value;
                            if (widget.para == 3) {
                              final cell4 = await sheet.cells
                                  .cell(column: 6, row: widget.row + 1);
                              output4 = cell4.value;
                            }
                            _visible = false;
                            setState(() {});
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AdvanceCustomAlert();
                                });
                          });

                          // createAlertDialog(context);
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
                          "Submit",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _visible ? 1.0 : 0.0,
                      child: Image.asset(
                        "assets/Animation.gif",
                        width: 40,
                        height: 40,
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

class AdvanceCustomAlert extends StatelessWidget {
  // const AdvanceCustomAlert(
  //     {required x,});
  const AdvanceCustomAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 350,
              width: 750,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(children: [
                  Text(
                    'ผลลัพธ์',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      parapapa == 2
                          ? '${output1} ${NumberFormat("#,###").format(int.parse(data))} คน \n${output2} ${output3} คน'
                          : '${output1} ${NumberFormat("#,###").format(int.parse(data))} คน ${output4} ${NumberFormat("#,###").format(int.parse(data2))} คน \n${output2} ${output3} คน',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _controller.clear();
                      _controller2.clear();
                      data = "";
                      data2 = "";
                    },
                    color: Colors.green,
                    child: Text(
                      'Okay',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ]),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 60,
                  child: Icon(
                    Icons.campaign,
                    color: Colors.white,
                    size: 70,
                  ),
                )),
          ],
        ));
  }
}
