import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (context) => HomePage());
          case LoginPage.routeName:
            return MaterialPageRoute(builder: (context) => LoginPage());
          case RegisterPage.routeName:
            return MaterialPageRoute(builder: (context) => RegisterPage());
          default:
            return null;
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Welcome Home page'),
          FlatButton(
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, RegisterPage.routeName);
            },
            child: Text('Registration'),
          ),
          FlatButton(
            color: Colors.orange,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, LoginPage.routeName);
            },
            child: Text('Login Page'),
          ),
        ]),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  static const String routeName = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text('Registration Page')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Welcome Registration Page'),
          FlatButton(
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
            child: Text('Home Page'),
          ),
          FlatButton(
            color: Colors.orange,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginPage.routeName, (route) => false);
            },
            child: Text('Login Page'),
          ),
          FlatButton(
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'),
          ),
        ]),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  static const String routeName = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Login Page')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Welcome Login Page'),
          FlatButton(
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
            child: Text('Home Page'),
          ),
          FlatButton(
            color: Colors.orange,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, RegisterPage.routeName);
            },
            child: Text('Registration Page'),
          ),
          FlatButton(
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'),
          ),
        ]),
      ),
    );
  }
}
