import 'dart:async';

import 'package:fitly/welcome.dart';
import 'package:fitly/workout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}
/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,

          displayColor: Colors.white,
        )
      )
    );
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      theme: ThemeData(
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.white,

        displayColor: Colors.white,
        )
      )
    );
  }
}

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();

    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _introSeen = (prefs.getBool('intro_seen') ?? false);

    Navigator.pop(context);
    if (_introSeen) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WorkoutPage())
      );
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}
