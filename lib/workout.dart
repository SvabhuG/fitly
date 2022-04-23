import 'dart:ui';
import 'package:flutter/material.dart';


class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  Color overlaycolor = const Color(0xff1e1e1e);
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool valuefirst = false;
  static const TextStyle hintStyle =
      TextStyle(color: Color(0xff4c4c58), fontSize: 10);
  var customExs = <String>[];

  String expValue = "None";

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.width * 0.001;
    double iconSize = unitHeightValue*50;
    TextStyle questStyle = TextStyle(fontSize: unitHeightValue*40);
    return MaterialApp(
      theme: ThemeData(
          unselectedWidgetColor: Colors.red,
      ),
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
          backgroundColor: overlaycolor,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(30),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: overlaycolor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(200, 60), //////// HERE
                      ),

                      onPressed: () {
                        setState(() {

                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children:const [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                  'Recommended',
                                  style: TextStyle(fontSize: 24)
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                  'Muscle Groups: Biceps, Chest',
                                  style: TextStyle(fontSize: 18)
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                  'Exercises: Curls 4x12, Bench Press 5x5',
                                  style: TextStyle(fontSize: 18)
                              ),
                            ),

                          ]
                      )
                  )
              ),
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
                        onPressed: () {
                          showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(
                              backgroundColor: overlaycolor,
                              title: Text('Record Workout'),
                              alignment: Alignment.center,
                              content: Column(
                                children: [
                                  Row(
                                    children:[
                                      Text("Select muscle group: "),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: DropdownButton<String>(
                                          itemHeight: 50,
                                          iconSize: iconSize,
                                          value: expValue,
                                          dropdownColor: const Color(0xff111111),
                                          icon: const Icon(Icons.arrow_downward),
                                          elevation: 16,
                                          style: const TextStyle(color: Colors.purple, fontSize: 28),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              expValue = newValue!;
                                            });
                                          },
                                          items: <String>['None','Chest', 'Back', 'Biceps', 'Triceps', 'Shoulders', 'Legs']
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value, style: questStyle),
                                            );
                                          }).toList(),

                                        ),
                                      )
                                    ]
                                  ),
                                  ElevatedButton(
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
                                      child: const Text('Add Exercise',
                                          style: TextStyle(fontSize: 18)))

                                ]
                              )
                            );
                          });
                        },
                        child: const Text('Log Custom Workout',
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        SizedBox(width: 15),
                        Text(
                          'DATE',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                        SizedBox(width: 15),
                        Icon(Icons.calendar_month_outlined,
                            size: 65, color: Colors.purple),
                      ]),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10.0),
                height: 130.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Completed?',
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  Checkbox(

                    checkColor: Colors.white,
                    activeColor: Colors.green,
                    value: valuefirst,
                    onChanged: (value) {
                      setState(() {
                        valuefirst = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff1e1e1e),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Workouts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
