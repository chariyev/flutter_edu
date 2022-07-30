import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Education Assets',
            ),
          ),
          body: Center(
            child: Stack(children: [
              Image(
                image: AssetImage('assets/images/backgroundImage.jpeg'),
              ),
              Center(
                child: Text(
                  'Life good with flutter',
                  style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'SquarePeg',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
