import 'package:flutter/material.dart';
import './live_calc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 225, 238, 255),
        primaryColor: Colors.amber,
      ),
      home: LiveCalc(),
    );
  }
}
