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
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                        ),
                          borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
                          height: 150,
                        width: 200,
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: const Text ('Log New Workout'),
                    ),

                ),

            );
  }
}
