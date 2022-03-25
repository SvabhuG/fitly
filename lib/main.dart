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
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('Workouts'),
          )
        ),
        body: Container(
          child: Text ('Log New Workout')
        )
      ),
    );
  }
}
