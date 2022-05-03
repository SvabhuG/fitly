import 'package:fitly/GoodMorning.dart';
import 'package:fitly/welcome.dart';
import 'package:flutter/material.dart';

import 'gender.dart';

void main() {
  runApp(GoodMorningPage());
}

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
}
