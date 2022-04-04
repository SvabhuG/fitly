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
                    ElevatedButton(
                      child: const Text("Log New Workout"),
                      onPressed:() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              scrollable: true,
                              title: const Text('New Workout (THE DATE HAHA)'),
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
                                          labelText:'Heart Rate',
                                          icon: Icon(Icons.monitor_heart_outlined),
                                        ),
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText:'Heart Rate',
                                          icon: Icon(Icons.monitor_heart_outlined),
                                        ),
                                      ),  TextFormField(
                                        decoration: const InputDecoration(
                                          labelText:'Heart Rate',
                                          icon: Icon(Icons.monitor_heart_outlined),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  child: const Text("Done"),
                                  onPressed:(){
                                  }
                                )
                              ],
                            );
                          }
                        );
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
                    Wrap(spacing: 5.0, children: [
                      Container(
                          height: 50.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              color: Colors.red[300],
                              border: Border.all(),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
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
                        child: const Center(
                          child: Text("the date lmao"),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.calendar_month_outlined),
                        ),
                      ),
                    ],
                    ),

                    Container(
                      height: 100.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          color: Colors.red[300],
                          border: Border.all(),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child: Column(children: const [
                        Text("exercise 1"),
                        Text("exercise 2"),
                      ]
                      ),
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
