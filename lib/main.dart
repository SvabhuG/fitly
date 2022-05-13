import 'package:fitly/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//run page
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


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
