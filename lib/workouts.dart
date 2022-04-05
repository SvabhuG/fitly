import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'data_collection.dart';

void main() {
  runApp( const Workouts());
}
class Workouts extends StatefulWidget {
  const Workouts({Key? key}) : super(key: key);


  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workouts',
      theme: ThemeData(),
      home: Scaffold(
        backgroundColor: const Color(0xff000000),
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
              children: [
              const Text(
              'Workouts',
              style: TextStyle(fontSize: 25),
            ),
            TextButton(
                child: const Text("Log New Workout"),
                onPressed: (){    showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        scrollable: true,
                        title: const Text('New Workout (THE DATE)'),
                        content: SingleChildScrollView(
                          padding: const EdgeInsets.all(5.0),
                          child: ListBody(
                            children: <Widget>[
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Duration',
                                  icon: Icon(Icons.access_time),
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Heart Rate',
                                  icon: Icon(Icons.monitor_heart_outlined),
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Calories Burned',
                                  icon: Icon(Icons.fastfood_outlined),
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Targeted Muscle Group',
                                  icon: Icon(Icons.person_rounded),
                                ),
                              ),
                            ],
                          ),
                        ),

                        actions: <Widget>[
                    TextButton(
                    child: const Text("Done"), onPressed: () {
    Navigator.of(context).pop();
    })
                    ],
                    );
                    });
                  },
                ),
                /** TextButton(
                    style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.redAccent),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                    return Colors.greenAccent;
                    }
                    return null;
                    },
                    ),
                    ),
                    onPressed: () {
                    _openPopup(pop)
                    },
                    child: const Text(
                    'Log New Workout',
                    style: TextStyle(fontSize: 15),

                    ),

                    ),
                 */
                Wrap(
                  spacing: 10.0,
                  children: [
                    Container(
                        height: 50.0,
                        width: 150.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.red[300],
                            border: Border.all(),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                          child: Text("Your Next Workout:"),
                        )),
                    Container(
                      height: 50.0,
                      width: 25.0,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.red[300],
                        border: Border.all(),
                      ),
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        Text('the date lmao'),
                        Icon(Icons.calendar_month_outlined),
                   ],
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 100.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      color: Colors.red[300],
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(20))),
                  child: Column(children: const [
                    Text("exercise 1"),
                    Text("exercise 2"),
                    Text("exercise 3"),
                    Text("exercise 4"),
                    Text("exercise 5"),
                    Text("exercise 6"),
                  ]),
                ),
              /*  CheckboxListTile(

                  title: const Text("Completed"),
                  activeColor: Colors.lightGreen,
                  checkColor: Colors.grey,
                  selected: checkedValue,
                  // need to create a variable for checked value but how?
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                )

               */
                ],

            ),
        ),
      ),
    );
  }

/**  Alert(
    context: pop,
    title: "New Workout (DATE)",
    content: Column(
    children: <Widget>[
    const TextField(
    decoration: InputDecoration(
    labelText: 'workout exercise 1',
    ),
    ),
    TextField(
    obscureText: true,
    decoration
    )
    ]
    )
    ) */

}