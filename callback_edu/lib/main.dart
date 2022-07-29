import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = "Ashgabat";

  void newCity(String newCity) {
    setState(() {
      city = newCity;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Ok');
    return MaterialApp(
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: LeftSide(
              city: city,
            )),
            Expanded(
                child: AWidget(
              callback: newCity,
              city: city,
            )),
          ],
        ),
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  final String city;
  const LeftSide({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Text(city),
    );
  }
}

class AWidget extends StatelessWidget {
  final String city;
  final Function callback;

  const AWidget({Key? key, required this.city, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Text("A widget"),
          BWidget(
            city: city,
            callback: callback,
          )
        ],
      ),
    );
  }
}

class BWidget extends StatelessWidget {
  final String city;
  final Function callback;

  const BWidget({Key? key, required this.city, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [Text("B widget"), CWidget(city: city, callback: callback)],
      ),
    );
  }
}

class CWidget extends StatelessWidget {
  final String city;
  final Function callback;

  const CWidget({Key? key, required this.city, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Shehir adi: $city"),
          TextField(onChanged: (text) => callback(text))
        ],
      ),
    );
  }
}
