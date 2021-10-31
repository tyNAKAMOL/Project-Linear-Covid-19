// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, type_init_formals, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:covid_app/graph.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:gsheets/gsheets.dart';
import 'package:covid_app/Home.dart';

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
String samakan = "";
String kampud = "";
String huakor = "";
bool _visible = false;

class MenuPage extends StatefulWidget {
  final int row;
  final int p;
  final Color color1;
  final Color color2;
  const MenuPage(
      {this.color1 = const Color(0xFFEC7063),
      Color this.color2 = const Color(0xFF9B59B6),
      required this.p,
      required this.row});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  var glowing1 = true;
  var scale1 = 1.0;
  var glowing2 = true;
  var scale2 = 1.0;
  var glowing3 = true;
  var scale3 = 1.0;
  var glowing4 = true;
  var scale4 = 1.0;
  var glowing5 = true;
  var scale5 = 1.0;
  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/Logo-Covid19_2.png"),
        )),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xFF2C1843),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ));
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              title: Text("Back"),
            ),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                // width: MediaQuery.of(context).size.width / 1.5,
                // height: MediaQuery.of(context).size.width / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          spacing: 50,
                          children: <Widget>[
                            FadeTransition(
                              opacity: animation,
                              child: GestureDetector(
                                onTapUp: (val) {
                                  setState(() {
                                    glowing1 = false;
                                    scale1 = 1.0;
                                  });
                                },
                                onTapDown: (val) async {
                                  _visible = true;
                                  final gsheets = GSheets(_credentials);
                                  final _sheet =
                                      await gsheets.spreadsheet(_spreadsheetId);
                                  var sheet = _sheet.worksheetByTitle('Page1');
                                  final cell = await sheet!.cells
                                      .cell(column: 1, row: widget.row + 2);
                                  huakor = cell.value;
                                  final cell2 = await sheet.cells
                                      .cell(column: 4, row: widget.row + 2);
                                  samakan = cell2.value;
                                  final cell3 = await sheet.cells
                                      .cell(column: 5, row: widget.row + 2);
                                  kampud = cell3.value;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GraphPage(
                                                p: widget.p,
                                                row: widget.row + 2,
                                                huakor: huakor,
                                                samakan: samakan,
                                                kampud: kampud,
                                              )));
                                  _visible = false;
                                  setState(() {
                                    glowing1 = true;
                                    scale1 = 1.1;
                                  });
                                },
                                child: AnimatedContainer(
                                  // transform: Matrix4.identity()..scale(scale1),
                                  duration: Duration(milliseconds: 200),
                                  height: 200,
                                  width: 220,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      gradient: LinearGradient(
                                        colors: [
                                          widget.color1,
                                          widget.color2,
                                        ],
                                      ),
                                      boxShadow: glowing1
                                          ? [
                                              BoxShadow(
                                                color: widget.color1
                                                    .withOpacity(0.6),
                                                spreadRadius: 1,
                                                blurRadius: 16,
                                                offset: Offset(-8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color2
                                                    .withOpacity(0.6),
                                                spreadRadius: 1,
                                                blurRadius: 16,
                                                offset: Offset(8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color1
                                                    .withOpacity(0.2),
                                                spreadRadius: 16,
                                                blurRadius: 32,
                                                offset: Offset(-8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color2
                                                    .withOpacity(0.2),
                                                spreadRadius: 16,
                                                blurRadius: 32,
                                                offset: Offset(8, 0),
                                              )
                                            ]
                                          : []),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(
                                        Icons.add_moderator,
                                        color: Colors.white,
                                        size: 90,
                                      ),
                                      Text(
                                        "  Infected - Cured",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            FadeTransition(
                              opacity: animation,
                              child: GestureDetector(
                                onTapUp: (val) {
                                  setState(() {
                                    glowing2 = false;
                                    scale2 = 1.0;
                                  });
                                },
                                onTapDown: (val) async {
                                  _visible = true;
                                  final gsheets = GSheets(_credentials);
                                  final _sheet =
                                      await gsheets.spreadsheet(_spreadsheetId);
                                  var sheet = _sheet.worksheetByTitle('Page1');
                                  final cell = await sheet!.cells
                                      .cell(column: 1, row: widget.row + 6);
                                  huakor = cell.value;
                                  final cell2 = await sheet.cells
                                      .cell(column: 4, row: widget.row + 6);
                                  samakan = cell2.value;
                                  final cell3 = await sheet.cells
                                      .cell(column: 5, row: widget.row + 6);
                                  kampud = cell3.value;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GraphPage(
                                                p: widget.p,
                                                row: widget.row + 6,
                                                huakor: huakor,
                                                samakan: samakan,
                                                kampud: kampud,
                                              )));
                                  _visible = false;
                                  setState(() {
                                    glowing2 = true;
                                    scale2 = 1.1;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  height: 200,
                                  width: 220,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      gradient: LinearGradient(
                                        colors: [
                                          widget.color1,
                                          widget.color2,
                                        ],
                                      ),
                                      boxShadow: glowing2
                                          ? [
                                              BoxShadow(
                                                color: widget.color1
                                                    .withOpacity(0.6),
                                                spreadRadius: 1,
                                                blurRadius: 16,
                                                offset: Offset(-8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color2
                                                    .withOpacity(0.6),
                                                spreadRadius: 1,
                                                blurRadius: 16,
                                                offset: Offset(8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color1
                                                    .withOpacity(0.2),
                                                spreadRadius: 16,
                                                blurRadius: 32,
                                                offset: Offset(-8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color2
                                                    .withOpacity(0.2),
                                                spreadRadius: 16,
                                                blurRadius: 32,
                                                offset: Offset(8, 0),
                                              )
                                            ]
                                          : []),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(
                                        Icons.person_off_rounded,
                                        color: Colors.white,
                                        size: 90,
                                      ),
                                      Text(
                                        "  Infected - Death",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          spacing: 50,
                          children: <Widget>[
                            FadeTransition(
                              opacity: animation,
                              child: GestureDetector(
                                onTapUp: (val) {
                                  setState(() {
                                    glowing3 = false;
                                    scale3 = 1.0;
                                  });
                                },
                                onTapDown: (val) async {
                                  _visible = true;
                                  final gsheets = GSheets(_credentials);
                                  final _sheet =
                                      await gsheets.spreadsheet(_spreadsheetId);
                                  var sheet = _sheet.worksheetByTitle('Page1');
                                  final cell = await sheet!.cells
                                      .cell(column: 1, row: widget.row + 10);
                                  huakor = cell.value;
                                  final cell2 = await sheet.cells
                                      .cell(column: 4, row: widget.row + 10);
                                  samakan = cell2.value;
                                  final cell3 = await sheet.cells
                                      .cell(column: 5, row: widget.row + 10);
                                  kampud = cell3.value;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GraphPage(
                                                p: widget.p,
                                                row: widget.row + 10,
                                                huakor: huakor,
                                                samakan: samakan,
                                                kampud: kampud,
                                              )));
                                  _visible = false;
                                  setState(() {
                                    glowing3 = true;
                                    scale3 = 1.1;
                                  });
                                },
                                child: AnimatedContainer(
                                  // transform: Matrix4.identity()..scale(scale1),
                                  duration: Duration(milliseconds: 200),
                                  height: 200,
                                  width: 220,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      gradient: LinearGradient(
                                        colors: [
                                          widget.color1,
                                          widget.color2,
                                        ],
                                      ),
                                      boxShadow: glowing3
                                          ? [
                                              BoxShadow(
                                                color: widget.color1
                                                    .withOpacity(0.6),
                                                spreadRadius: 1,
                                                blurRadius: 16,
                                                offset: Offset(-8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color2
                                                    .withOpacity(0.6),
                                                spreadRadius: 1,
                                                blurRadius: 16,
                                                offset: Offset(8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color1
                                                    .withOpacity(0.2),
                                                spreadRadius: 16,
                                                blurRadius: 32,
                                                offset: Offset(-8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color2
                                                    .withOpacity(0.2),
                                                spreadRadius: 16,
                                                blurRadius: 32,
                                                offset: Offset(8, 0),
                                              )
                                            ]
                                          : []),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(
                                        Icons.ac_unit,
                                        color: Colors.white,
                                        size: 90,
                                      ),
                                      Text(
                                        "  Vaccined - Infected",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Spacer(),
                            FadeTransition(
                              opacity: animation,
                              child: GestureDetector(
                                onTapUp: (val) {
                                  setState(() {
                                    glowing4 = false;
                                    scale4 = 1.0;
                                  });
                                },
                                onTapDown: (val) async {
                                  _visible = true;
                                  final gsheets = GSheets(_credentials);
                                  final _sheet =
                                      await gsheets.spreadsheet(_spreadsheetId);
                                  var sheet = _sheet.worksheetByTitle('Page1');
                                  final cell = await sheet!.cells
                                      .cell(column: 1, row: widget.row + 14);
                                  huakor = cell.value;
                                  final cell2 = await sheet.cells
                                      .cell(column: 4, row: widget.row + 14);
                                  samakan = cell2.value;
                                  final cell3 = await sheet.cells
                                      .cell(column: 5, row: widget.row + 14);
                                  kampud = cell3.value;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GraphPage(
                                                p: widget.p,
                                                row: widget.row + 14,
                                                huakor: huakor,
                                                samakan: samakan,
                                                kampud: kampud,
                                              )));
                                  _visible = false;
                                  setState(() {
                                    glowing4 = true;
                                    scale4 = 1.1;
                                  });
                                },
                                child: AnimatedContainer(
                                  // transform: Matrix4.identity()..scale(scale1),
                                  duration: Duration(milliseconds: 200),
                                  height: 200,
                                  width: 220,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      gradient: LinearGradient(
                                        colors: [
                                          widget.color1,
                                          widget.color2,
                                        ],
                                      ),
                                      boxShadow: glowing4
                                          ? [
                                              BoxShadow(
                                                color: widget.color1
                                                    .withOpacity(0.6),
                                                spreadRadius: 1,
                                                blurRadius: 16,
                                                offset: Offset(-8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color2
                                                    .withOpacity(0.6),
                                                spreadRadius: 1,
                                                blurRadius: 16,
                                                offset: Offset(8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color1
                                                    .withOpacity(0.2),
                                                spreadRadius: 16,
                                                blurRadius: 32,
                                                offset: Offset(-8, 0),
                                              ),
                                              BoxShadow(
                                                color: widget.color2
                                                    .withOpacity(0.2),
                                                spreadRadius: 16,
                                                blurRadius: 32,
                                                offset: Offset(8, 0),
                                              )
                                            ]
                                          : []),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(
                                        Icons.medication_sharp,
                                        color: Colors.white,
                                        size: 90,
                                      ),
                                      Text(
                                        "  Vaccined - Cured",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Spacer(),
                      ],
                    ),
                    Spacer(),
                    FadeTransition(
                      opacity: animation,
                      child: GestureDetector(
                        onTapUp: (val) {
                          setState(() {
                            glowing5 = false;
                            scale5 = 1.0;
                          });
                        },
                        onTapDown: (val) async {
                          _visible = true;
                          final gsheets = GSheets(_credentials);
                          final _sheet =
                              await gsheets.spreadsheet(_spreadsheetId);
                          var sheet = _sheet.worksheetByTitle('Page1');
                          final cell = await sheet!.cells
                              .cell(column: 1, row: widget.row + 18);
                          huakor = cell.value;
                          final cell2 = await sheet.cells
                              .cell(column: 4, row: widget.row + 18);
                          samakan = cell2.value;
                          final cell3 = await sheet.cells
                              .cell(column: 5, row: widget.row + 18);
                          kampud = cell3.value;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GraphPage(
                                        p: widget.p,
                                        row: widget.row + 18,
                                        huakor: huakor,
                                        samakan: samakan,
                                        kampud: kampud,
                                      )));
                          _visible = false;
                          setState(() {
                            glowing5 = true;
                            scale5 = 1.1;
                          });
                        },
                        child: AnimatedContainer(
                          // transform: Matrix4.identity()..scale(scale1),
                          duration: Duration(milliseconds: 200),
                          height: 200,
                          width: 220,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              gradient: LinearGradient(
                                colors: [
                                  widget.color1,
                                  widget.color2,
                                ],
                              ),
                              boxShadow: glowing5
                                  ? [
                                      BoxShadow(
                                        color: widget.color1.withOpacity(0.6),
                                        spreadRadius: 1,
                                        blurRadius: 16,
                                        offset: Offset(-8, 0),
                                      ),
                                      BoxShadow(
                                        color: widget.color2.withOpacity(0.6),
                                        spreadRadius: 1,
                                        blurRadius: 16,
                                        offset: Offset(8, 0),
                                      ),
                                      BoxShadow(
                                        color: widget.color1.withOpacity(0.2),
                                        spreadRadius: 16,
                                        blurRadius: 32,
                                        offset: Offset(-8, 0),
                                      ),
                                      BoxShadow(
                                        color: widget.color2.withOpacity(0.2),
                                        spreadRadius: 16,
                                        blurRadius: 32,
                                        offset: Offset(8, 0),
                                      )
                                    ]
                                  : []),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(
                                Icons.medical_services,
                                color: Colors.white,
                                size: 90,
                              ),
                              Text(
                                "  Vaccined - Death",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Opacity(
                        opacity: _visible ? 1.0 : 0.0,
                        child: Image.asset(
                          "assets/Animation.gif",
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Opacity(
                        opacity: 0.0,
                        child: Image.asset(
                          "assets/Animation.gif",
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            )));
  }
}
