import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workouts',
      theme: ThemeData(
      ),
      home: Scaffold(
          appBar: AppBar(
              title: const Center(


                child: Text('Workouts'),

          )),
          body: Container(
            height:100.0,
              decoration: BoxDecoration(
                  color: Colors.red[300],
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: const Center(
                child: Text("Log New Workout"),
              ))),
    );
  }
}
