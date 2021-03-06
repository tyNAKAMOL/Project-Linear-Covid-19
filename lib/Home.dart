// ignore_for_file: file_names, avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors, type_init_formals, sized_box_for_whitespace, prefer_final_fields

import 'dart:ffi';
// import 'dart:html';
import 'package:covid_app/Menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  final Color color1;
  final Color color2;
  const HomePage(
      {this.color1 = const Color(0xFFEC7063),
      Color this.color2 = const Color(0xFF9B59B6)});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
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

  var glowing1 = true;
  var scale1 = 1.0;
  var glowing2 = true;
  var scale2 = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/Logo-Covid19_2.png"),
              )),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedImage(),
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
                                builder: (context) =>
                                    MenuPage(para: 2, p: 0, row: 0)));

                        setState(() {
                          glowing1 = true;
                          scale1 = 1.1;
                        });
                      },
                      child: AnimatedContainer(
                        transform: Matrix4.identity()..scale(scale1),
                        duration: Duration(milliseconds: 200),
                        height: 48,
                        width: 160,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(
                              Icons.analytics_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              "  2 Variable",
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
                                builder: (context) =>
                                    MenuPage(para: 3, p: 0, row: 20)));
                        setState(() {
                          glowing2 = true;
                          scale2 = 1.1;
                        });
                      },
                      child: AnimatedContainer(
                        transform: Matrix4.identity()..scale(scale2),
                        duration: Duration(milliseconds: 200),
                        height: 48,
                        width: 160,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(
                              Icons.analytics_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              "  3 Variable",
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
            ),
          ),
        ));
  }
}

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key}) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat(reverse: true);
  // ignore: unused_field
  late Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: Offset(0, 0.04),
  ).animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset(
        "assets/Logo-Covid19.png",
      ),
    );
  }
}
