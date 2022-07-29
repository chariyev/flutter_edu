import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LinearProgressPage(),
    );
  }
}

class LinearProgressPage extends StatefulWidget {
  const LinearProgressPage({Key? key}) : super(key: key);

  @override
  State<LinearProgressPage> createState() => _LinearProgressPageState();
}

class _LinearProgressPageState extends State<LinearProgressPage> {
  bool _isLoad = false;
  double _progressValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Progress App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: _isLoad
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        LinearProgressIndicator(
                          value: _progressValue,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('${(_progressValue * 100).toInt()} %'),
                        Text(_isLoad
                            ? 'Loading...'
                            : 'Press button to download'),
                      ])
                : Text('Press to download'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isLoad = true;
            _startToDownload();
          });
        },
        child: Icon(Icons.cloud_download),
      ),
    );
  }

  _startToDownload() {
    var duration = Duration(seconds: 1);
    Timer.periodic(duration, (Timer t) {
      setState(() {
        _progressValue += 0.2;
        if (_progressValue >= 1) {
          t.cancel();
          _isLoad = false;
          _progressValue = 0;
          return;
        }
      });
    });
  }
}
