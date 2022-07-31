import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54),
          leading: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.menu,
            ),
          ),
          actions: [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: _buildBody());
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(children: [
              _infoWeather(),
              Divider(),
              _tempretureInfo(),
              Divider(),
              _tempretureForecost(),
              Divider(),
              _appRating()
            ]),
          ),
        )
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage(
      'https://avatars.mds.yandex.net/i?id=b8b4aa9a404e491afee1525eb085934e-5314608-images-thumbs&n=13',
    ),
    fit: BoxFit.cover,
  );
}

Column _infoWeather() {
  return Column(children: [
    Text(
      'Monday - August 12',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Divider(),
    Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incident ullamcorper. Ut enim ad minim veniam, quis',
      style: TextStyle(color: Colors.black54),
    )
  ]);
}

Row _tempretureInfo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.wb_sunny,
        color: Colors.yellow,
        size: 40,
      ),
      SizedBox(
        width: 16,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '23º Clear',
            style: TextStyle(color: Colors.deepPurple, fontSize: 20),
          ),
          Text('Ashgabat Turkmenistan', style: TextStyle(color: Colors.grey))
        ],
      )
    ],
  );
}

Wrap _tempretureForecost() {
  return Wrap(
    spacing: 10,
    children: List.generate(9, (int index) {
      return Chip(
        label: Text('${index + 20}° C'),
        avatar: (index % 3) == 0
            ? Icon(Icons.wb_cloudy, color: Colors.blue)
            : index % 4 == 1
                ? Icon(Icons.wb_sunny_rounded, color: Colors.yellow)
                : Icon(Icons.cloudy_snowing, color: Colors.blue),
        backgroundColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.grey),
        ),
      );
    }),
  );
}

Row _appRating() {
  Row rating = Row(children: [
    Icon(Icons.star, color: Colors.yellow),
    Icon(Icons.star, color: Colors.yellow),
    Icon(Icons.star, color: Colors.yellow),
    Icon(Icons.star, color: Colors.grey),
    Icon(Icons.star, color: Colors.grey),
  ]);
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text('howwa.tm rating:'),
    SizedBox(
      width: 20,
    ),
    rating
  ]);
}
