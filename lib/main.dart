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
      theme: ThemeData(),
      home: Scaffold(
        body: Center(
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
              const Text(
                'Workouts',
                style: TextStyle(fontSize: 25),
              ),
              RaisedButton(
                child: const Text("Log New Workout"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: const Text('New Workout (THE DATE)'),
                          content: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Form(
                              child: Column(
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
                          ),
                          actions: [
                            RaisedButton(
                                child: const Text("Done"), onPressed: () {})
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
                spacing: 5.0,
                children: [
                  Container(
                      height: 50.0,
                      width: 150.0,
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
                    ], //I want to put this in the box
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8.0),

                height: 100.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: Colors.red[300],
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(children: const [
                  Text("exercise 1"),
                  Text("exercise 2"),
                  Text("exercise 3"),
                  Text("exercise 4"),
                  Text("exercise 5"),
                  Text("exercise 6"),
                ]),
              ),
                  CheckboxListTile(

                    title: const Text("Completed"),
                    activeColor: Colors.lightGreen,
                    checkColor: Colors.grey,
                    selected: checkedValue,   // need to create a variable for checked value but how?
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  )
            ]

            )
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
