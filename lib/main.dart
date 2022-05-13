import 'package:bmi_calculator/modules/BMI_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// constructor
// build

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMI_Screen(),
    );
  }
}
