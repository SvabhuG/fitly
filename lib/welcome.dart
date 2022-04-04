import 'dart:ui';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:fitly/data_collection1.dart';
import 'package:flutter/material.dart';

import 'data_collection.dart';

class WelcomePage extends StatefulWidget {

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  static Color bgrdColor = const Color(0xff15191c);

  static const TextStyle questStyle =
  TextStyle(fontSize: 14, color: Color(0xffffffff));

  static const TextStyle hintStyle = TextStyle(color: Color(0xff4c4c58), fontSize: 10);



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      appBar: AppBar(
        title: const Text(
            'Fitly',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,

        backgroundColor: const Color(0xff111111),
      ),
      body: Center(

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Container(
              margin: const EdgeInsets.all(30),
              height: 256,
            child: const FadeIn(
            // If the widget is visible, animate to 0.0 (invisible).
            // If the widget is hidden, animate to 1.0 (fully visible).
            duration: Duration(milliseconds: 2000),

            child: Text(
              'Fitness\nmade\neasy',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 42)
            ),
          ),
          ),
      const Text(
          'Log your workouts and track your progress'
      ),
      Container(
        margin: EdgeInsets.all(20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              onPrimary: Colors.white,
              shadowColor: Colors.greenAccent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: const Size(200, 60), //////// HERE
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DataCollectPage())
              );
            },
            child: const Text(
              'Get Started',
                style: TextStyle(
                    fontSize: 18
                )
            )
          )
      )
        ]
        ),
      )
    );
  }
}
