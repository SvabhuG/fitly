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
                        decoration: BoxDecoration(color: Colors.red[300]

                          borderRadius: BorderRadius.circular(20.0)
      ),
                          height: 150,
                        width: 200,
                        alignment: Alignment.center,
                        child: const Text ('Log New Workout'),
                    ),

                ),

            );
  }
}
