import 'package:flutter/material.dart';

import './button_icon_text.dart';

TextStyle textStyle =
    TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold);
TextStyle infoTextStyle = TextStyle(
    color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.bold);

class LiveCalc extends StatefulWidget {
  const LiveCalc({Key? key}) : super(key: key);

  @override
  State<LiveCalc> createState() => _LiveCalcState();
}

class _LiveCalcState extends State<LiveCalc> {
  String gender = '';
  double cigarette = 0;
  double sportDay = 0;
  int height = 170;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('LIVE Calculation'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: HeightWeight('height'),
                ),
                Expanded(
                  child: HeightWeight('weight'),
                )
              ],
            ),
          ),
          Expanded(
            child: BoxContainer(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'How offen do you do sports in a week',
                      style: textStyle,
                    ),
                    Text(
                      sportDay.round().toString(),
                      style: infoTextStyle,
                    ),
                    Slider.adaptive(
                      divisions: 7,
                      value: sportDay,
                      onChanged: (double newValue) {
                        setState(() {
                          sportDay = newValue;
                        });
                      },
                      min: 0,
                      label: '${cigarette.toString()} cigarette',
                      max: 7,
                    ),
                  ],
                )),
          ),
          Expanded(
            child: BoxContainer(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'How many cigarette do you smoke?',
                      style: textStyle,
                    ),
                    Text(
                      cigarette.round().toString(),
                      style: infoTextStyle,
                    ),
                    Slider.adaptive(
                      value: cigarette,
                      onChanged: (double newValue) {
                        setState(() {
                          cigarette = newValue;
                        });
                      },
                      min: 0,
                      label: '${cigarette.toString()} cigarette',
                      max: 30,
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxContainer(
                    color:
                        gender == "female" ? Colors.blueAccent : Colors.white,
                    child: ButtonIconText(
                        icon: Icons.female,
                        color:
                            gender == "female" ? Colors.white : Colors.black54,
                        text: 'FEMALE',
                        onPress: () {
                          setState(() {
                            gender = 'female';
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: BoxContainer(
                    color: gender == "male" ? Colors.blueAccent : Colors.white,
                    child: ButtonIconText(
                        icon: Icons.male,
                        text: 'MALE',
                        color: gender == "male" ? Colors.white : Colors.black54,
                        onPress: () {
                          setState(() {
                            print('ok');
                            gender = 'male';
                          });
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxContainer HeightWeight(type) {
    return BoxContainer(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
                quarterTurns: -1,
                child: Text(
                  type == 'height' ? 'HEIGHT' : 'WIEGHT',
                  style: textStyle,
                )),
            RotatedBox(
                quarterTurns: -1,
                child: Text(
                  type == 'height' ? height.toString() : weight.toString(),
                  style: infoTextStyle,
                )),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        type == 'height' ? height++ : weight++;
                      });
                    },
                    child: Text('+')),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        type == 'height' ? height-- : weight--;
                      });
                    },
                    child: Text('-'))
              ],
            ),
          ],
        ));
  }
}

class BoxContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  BoxContainer({this.color = Colors.white, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: child,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: color),
    );
  }
}
