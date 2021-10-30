// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, type_init_formals, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:covid_app/graph.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:covid_app/Home.dart';

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
                    // FadeTransition(
                    //   opacity: animation,
                    //   child: Image.asset(
                    //     "assets/Logo-Covid19.png",
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    // Image.asset(
                    //   "assets/Logo-Covid19.png",
                    //   fit: BoxFit.cover,
                    // ),
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
                                onTapDown: (val) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GraphPage(
                                              p: widget.p,
                                              row: widget.row + 2)));
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
                                onTapDown: (val) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GraphPage(
                                              p: widget.p,
                                              row: widget.row + 6)));
                                  setState(() {
                                    glowing2 = true;
                                    scale2 = 1.1;
                                  });
                                },
                                child: AnimatedContainer(
                                  // transform: Matrix4.identity()..scale(scale2),
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
                                onTapDown: (val) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GraphPage(
                                              p: widget.p,
                                              row: widget.row + 10)));
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
                                onTapDown: (val) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GraphPage(
                                              p: widget.p,
                                              row: widget.row + 14)));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GraphPage(
                                      p: widget.p, row: widget.row + 18)));
                          setState(() {
                            glowing5 = false;
                            scale5 = 1.0;
                          });
                        },
                        onTapDown: (val) {
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
                  ],
                ),
              ),
            )));
  }
}
