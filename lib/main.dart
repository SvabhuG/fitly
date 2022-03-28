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


                    body: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                      )

          children: [
      SizedBox(
                          height: 250,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.red[300]
                          ),
                           border: Border.all(
                             color: Colors.blue,
                             width:4.0,
                             style:BorderStyle.solid),

                            borderRadius: BorderRadius.all(Radius.circular(10)
                            ),


                            height: 150,
                          width: 200,
                          alignment: Alignment.center,
                          child: const Text ('Log New Workout'),
      ),
      ),
    ],
                    ),
    ),

                );


  }
}
