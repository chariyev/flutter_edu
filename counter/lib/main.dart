import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edu Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Press + for increments',
              style: TextStyle(color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    icon: Icon(Icons.add),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(fontSize: 30),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        count--;
                      });
                    },
                    icon: Icon(Icons.remove),
                  ),
                ],
              ),
            ),
            Text(
              'Press - for decrements',
              style: TextStyle(color: Colors.grey),
            ),
          ]),
        ),
      ),
    );
  }
}
