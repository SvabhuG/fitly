import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(WorkoutPage());
}

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  Color _bgrdcolor1 = const Color(0xff222222);
  Color _iconcolor1 = Colors.purple;

  Color _bgrdcolor2 = const Color(0xff222222);
  Color _iconcolor2 = Colors.purple;

  Color _bgrdcolor3 = const Color(0xff222222);
  Color _iconcolor3 = Colors.purple;

  final _formKey = GlobalKey<FormState>();

  static const TextStyle hintStyle =
      TextStyle(color: Color(0xff4c4c58), fontSize: 10);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*   theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,

            displayColor: Colors.white,
          ),
      ),
      */
      home: Scaffold(
        backgroundColor: const Color(0xff111110),
        appBar: AppBar(
          title: const Text(
            'Workouts',
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          onPrimary: Colors.white,
                          shadowColor: Colors.greenAccent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          minimumSize: const Size(200, 60), //////// HERE
                        ),
                        onPressed: () {},
                        child: const Text('Log New Workout',
                            style: TextStyle(fontSize: 18))))
              ]),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 50.0,
                    width: 200.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        border: Border.all(),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Center(
                      child: Text("Your Next Workout: ",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'DATE',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                        Icon(Icons.calendar_month_outlined,
                            size: 65, color: _iconcolor1),
                        const SizedBox(width: 90)
                      ]),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(10.0),
                height: 130.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(children: const [
                  Text(
                    "exercise 1",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    "exercise 2",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    "exercise 3",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    "exercise 4",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    "exercise 5",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    "exercise 6",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  }

