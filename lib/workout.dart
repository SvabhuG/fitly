import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'algo/Barbell.dart';
import 'algo/Bodyweight.dart';
import 'algo/Dumbell.dart';
import 'algo/Exercise.dart';
import 'algo/User.dart';


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

  var customExs = <String>[];

  String customTempMaxReps = "";
  String customTempEx = "None";
  String customTempSets = "";
  String customTempReps = "";

  List<Widget> _customExList = [];

  Widget _customEx(String ex, String sets, String reps, String maxReps) {
    return Column(
      children: [
        Text(
          "Exercise: $ex"
        ),
        Text(
          "Sets: $sets"
        ),
        Text(
            "Reps: $reps"
        ),
        Text(
            "Max Reps: $maxReps"
        )
      ]
    );
  }
  bool userBuilt = false;
  User user = User(2);

  void buildUser(){
    if(!userBuilt){
      user.baseWorkout();
      userBuilt = true;
    }
  }

  void _addCustomExWidget(String ex, String sets, String reps, String maxReps) {
    var exercises = user.getExercises();
    setState(() {
      _customExList.add(_customEx(ex, sets, reps, maxReps));
      print(_customExList.length);
    });
    for(Exercise exercise in exercises){
      if(exercise.getName() == ex){
        exercise.setMaxlastreps(int.parse(maxReps));
      }
    }
  }

  void updateRecommended(){
    var newExercises = user.workoutUpdate();
    print("new exercises length: " + newExercises.length.toString());
    for(Exercise e in newExercises){
      print(e.getName());
      if (e is Bodyweight) {
        print((((("Sets: " + e.getSets().toString()) + " Reps: ") + e.getReps().toString()) + " of ") + e.getName());
      }
      else if (e is Dumbbell) {
        print(((((((("Sets: " + e.getSets().toString()) + " Reps: ") + e.getReps().toString()) + " of ") + e.getName()) + " with ") + e.getWeight().toString()) + " lb dumbbells");
      }
      else if (e is Barbell) {
        print(((((((("Sets: " + e.getSets().toString()) + " Reps: ") + e.getReps().toString()) + " of ") + e.getName()) + " at ") + e.getWeight().toString()) + " lbs");
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.width * 0.001;
    double iconSize = unitHeightValue*50;
    TextStyle hintStyle = TextStyle(color: Color(0xff4c4c58), fontSize: unitHeightValue*30);
    TextStyle alertTextStyle = TextStyle(fontSize: unitHeightValue*25);

    buildUser();

    return MaterialApp(
      theme: ThemeData(
          unselectedWidgetColor: Colors.red,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
              Card(
                color: overlaycolor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              'Recommended',
                              style: TextStyle(color: Colors.white, fontSize: 24)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              'Muscle Groups: Biceps, Chest',
                              style: TextStyle(color: Colors.white, fontSize: 18)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              'Exercises: Curls 4x12, Bench Press 5x5',
                              style: TextStyle(color: Colors.white, fontSize: 18)
                          ),
                        ),

                      ]
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
                          showDialog(context: context, builder: (context) {
                            return StatefulBuilder(builder: (context, setState) {
                              return AlertDialog(
                                  backgroundColor: overlaycolor,
                                  title: Text('Record Workout'),
                                  alignment: Alignment.center,
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 300,
                                          height: 220,
                                          child: ListView.builder(
                                              itemCount: _customExList.length,
                                              itemBuilder: (context,index){
                                                return _customExList[index];
                                              }),
                                        ),
                                        Row(
                                            children: [
                                              Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children:[
                                                    Container(
                                                        height: unitHeightValue*80,
                                                        margin: EdgeInsets.only(right:15),
                                                        child: Center(
                                                          child: Text("Select exercise: ", style: alertTextStyle),
                                                        )
                                                    ),
                                                    SizedBox(
                                                      height: unitHeightValue*70,
                                                      child: Center(
                                                        child: SizedBox(
                                                            height: unitHeightValue*60,
                                                            width: unitHeightValue*180,
                                                            child: TextField(
                                                              onChanged: (text) {
                                                                customTempSets = text;
                                                              },
                                                              keyboardType: TextInputType.number,
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter.digitsOnly
                                                              ],
                                                              textAlign: TextAlign.center,
                                                              decoration: InputDecoration(

                                                                contentPadding: EdgeInsets.all(0),
                                                                focusedBorder: const OutlineInputBorder(
                                                                  borderSide: BorderSide(color: Color(0xffaeb1b9), width: 1.0),
                                                                ),
                                                                enabledBorder: const OutlineInputBorder(
                                                                  borderSide: BorderSide(color: Color(0xffaeb1b9), width: 1.0),
                                                                ),
                                                                hintStyle: hintStyle,
                                                                hintText: 'sets',
                                                              ),
                                                            )
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        height: unitHeightValue*70,
                                                        margin: EdgeInsets.only(right:15),
                                                        child: Center(
                                                          child: Text("Perform max reps\non last set: ", style: alertTextStyle),
                                                        )
                                                    ),
                                                  ]
                                              ),
                                              Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children:[
                                                    SizedBox(
                                                        height: unitHeightValue*70,
                                                        child: Center(
                                                          child: DropdownButton<String>(
                                                            itemHeight: 50,
                                                            iconSize: iconSize,
                                                            value: customTempEx,
                                                            dropdownColor: const Color(0xff111111),
                                                            icon: const Icon(Icons.arrow_downward),
                                                            elevation: 16,
                                                            style: const TextStyle(color: Colors.purple, fontSize: 28),
                                                            onChanged: (String? newValue) {
                                                              setState(() {
                                                                customTempEx = newValue!;
                                                              });
                                                            },
                                                            items: <String>['None','Bench Press','Pec Flyes', 'Incline Press']
                                                                .map<DropdownMenuItem<String>>((String value) {
                                                              return DropdownMenuItem<String>(
                                                                value: value,
                                                                child: Text(value, style: alertTextStyle),
                                                              );
                                                            }).toList(),

                                                          ),
                                                        )
                                                    ),

                                                    SizedBox(
                                                      height: unitHeightValue*70,
                                                      child: Center(
                                                        child: SizedBox(
                                                            height: unitHeightValue*60,
                                                            width: unitHeightValue*180,
                                                            child: TextField(
                                                              onChanged: (text) {
                                                                customTempReps = text;
                                                              },
                                                              keyboardType: TextInputType.number,
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter.digitsOnly
                                                              ],
                                                              textAlign: TextAlign.center,
                                                              decoration: InputDecoration(

                                                                contentPadding: EdgeInsets.all(0),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(color: Color(0xffaeb1b9), width: 1.0),
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(color: Color(0xffaeb1b9), width: 1.0),
                                                                ),
                                                                hintStyle: hintStyle,
                                                                hintText: 'reps',
                                                              ),
                                                            )
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: unitHeightValue*70,
                                                      child: Center(
                                                        child: SizedBox(
                                                            height: unitHeightValue*60,
                                                            width: unitHeightValue*180,
                                                            child: TextField(
                                                              onChanged: (text) {
                                                                customTempMaxReps = text;
                                                              },
                                                              keyboardType: TextInputType.number,
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter.digitsOnly
                                                              ],
                                                              textAlign: TextAlign.center,
                                                              decoration: InputDecoration(

                                                                contentPadding: EdgeInsets.all(0),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(color: Color(0xffaeb1b9), width: 1.0),
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(color: Color(0xffaeb1b9), width: 1.0),
                                                                ),
                                                                hintStyle: hintStyle,
                                                                hintText: 'reps',
                                                              ),
                                                            )
                                                        ),
                                                      ),
                                                    )
                                                  ]
                                              ),
                                            ]
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                          primary: Colors.purple,
                                          onPrimary: Colors.white,
                                          shadowColor: Colors.greenAccent,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0)),
                                          minimumSize: const Size(150, 45), //////// HERE
                                        ),
                                        onPressed: () {
                                        setState((){
                                          _addCustomExWidget(
                                          customTempEx,
                                          customTempSets,
                                          customTempReps,
                                          customTempMaxReps);
                                        });
                                        },
                                        child: const Text('Add Exercise',
                                          style: TextStyle(fontSize: 14))
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top:5),
                                          child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                          primary: Colors.purple,
                                          onPrimary: Colors.white,
                                          shadowColor: Colors.greenAccent,
                                          elevation: 0,
                                            shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0)),
                                          minimumSize: const Size(150, 45), //////// HERE
                                          ),
                                            onPressed: () {
                                                Navigator.pop(context);
                                                updateRecommended();
                                            },
                                          child: const Text('Submit Workout',
                                            style: TextStyle(fontSize: 14)))
                                        )

                                      ]
                                  )
                              );
                            }
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
