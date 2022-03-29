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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text( "Workouts",
              style: TextStyle(fontSize: 25),
              ),

              Container(
                height:100.0,
                width:300.0,
                decoration: BoxDecoration(
                  color: Colors.red[300],
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: const Center(
                child: Text("Log New Workout"),
              ))]))),
    );
  }
}
