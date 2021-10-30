// ignore_for_file: unused_local_variable, sized_box_for_whitespace, prefer_const_constructors, unnecessary_new, non_constant_identifier_names, void_checks, prefer_typing_uninitialized_variables, avoid_print
import 'package:covid_app/Home.dart';
import 'package:covid_app/Menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
