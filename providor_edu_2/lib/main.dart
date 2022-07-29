import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './city_data.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CityData()),
        ],
        child: MyApp(),
      ),
    );

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: LeftSide()),
            Expanded(child: AWidget()),
          ],
        ),
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Text(context.watch<CityData>().city),
    );
  }
}

class AWidget extends StatelessWidget {
  const AWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('A widget');
    return Container(
      color: Colors.green,
      padding: EdgeInsets.all(15),
      child: Column(
        children: [Text("A widget"), BWidget()],
      ),
    );
  }
}

class BWidget extends StatelessWidget {
  const BWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('B widget');
    return Container(
      color: Colors.amberAccent,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [Text("B widget"), CWidget()],
      ),
    );
  }
}

class CWidget extends StatelessWidget {
  const CWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Shehir adi: ${context.watch<CityData>().city}"),
          TextField(onChanged: (cityName) {
            context.read<CityData>().changeCity(cityName);
          })
        ],
      ),
    );
  }
}
