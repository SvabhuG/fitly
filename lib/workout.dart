import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'algo/Barbell.dart';
import 'algo/Bodyweight.dart';
import 'algo/Dumbbell.dart';
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
  static const TextStyle exStyle =
  TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool valuefirst = false;

  var customExs = <String>[];

  String customTempMaxReps = "";
  String customTempEx = "Bench Press";
  String customTempSets = "";
  String customTempReps = "";
  String customTempWeight = "";

  List<Widget> _customExList = [];
  List<Widget> _recommendedExList = [];
  List<Widget> _recommendedExDialogList = [];
  List<String> exs = [];

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

  Future<void> buildUser() async {
    if(!userBuilt){
      await user.buildUser();
      updateRecommended();
      userBuilt = true;

      for(Exercise e in user.getExercises()){
        exs.add(e.getName());
      }
    }
  }

  void _addRecommendedExWidget(Exercise ex){
    String name = ex.getName();
    print("add recommended widget: " + ex.getName());
    String sets = ex.getSets().toString();
    String reps = ex.getReps().toString();

    if(ex is Barbell){
      String weight = ex.getWeight().toString();
      _recommendedExList.add(Padding(
        padding: EdgeInsets.all(10),
        child:Column(
            children: [
              Text(
                  "$name",
                  style: exStyle
              ),
              Text(
                  "$sets x $reps at $weight lbs",
                  style: exStyle
              )
            ]
        ))
      );
      _recommendedExDialogList.add(Padding(
          padding: EdgeInsets.all(10),
          child:Text(
              "$name",
              style: exStyle
          ),
        )
      );
    }
    else if(ex is Dumbbell){
      String weight = ex.getWeight().toString();
      _recommendedExList.add(Padding(
        padding: EdgeInsets.all(10),
        child: Column(
            children: [
              Text(
                  "$name",
                  style: exStyle
              ),
              Text(
                  "$sets x $reps with ${weight}lbs dumbbells",
                  style: exStyle
              )
            ]
        ))
      );
    }
    else if(ex is Bodyweight){
      _recommendedExList.add(Padding(
        padding: EdgeInsets.all(10),
        child: Column(
            children: [
              Text(
                "$name",
                style: exStyle,
              ),
              Text(
                "$sets x $reps",
                style: exStyle,
              )
            ]
        ))
      );
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
        exercise.setReps(int.parse(reps));
        exercise.setSets(int.parse(customTempSets));

        if(exercise is Dumbbell){
          exercise.setWeight(int.parse(customTempWeight));
        }
        else if(exercise is Barbell){
          exercise.setWeight(int.parse(customTempWeight));
        }
      }
    }
  }

  void updateRecommended(){
    var newExercises = user.workoutUpdate();
    _recommendedExList = [];
    print("new exercises length: " + newExercises.length.toString());
    for(Exercise e in newExercises){
      print("update recommended: " + e.getName());
      _addRecommendedExWidget(e);
    }
  }

  void resetTempVars(){
    customTempMaxReps = "";
    customTempEx = "Bench Press";
    customTempSets = "";
    customTempReps = "";
    customTempWeight = "";
    _customExList = [];
  }

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.width * 0.001;
    double iconSize = unitHeightValue*50;
    TextStyle hintStyle = TextStyle(color: Color(0xff4c4c58), fontSize: unitHeightValue*30);
    TextStyle alertTextStyle = TextStyle(fontSize: unitHeightValue*25);
    TextStyle buttonTextStyle = TextStyle(fontSize: unitHeightValue*35);

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
                      children:[
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              'Recommended',
                              style: TextStyle(color: Colors.white, fontSize: 24)
                          ),
                        ),
                        Container(
                          width: 400,
                          height: 400,
                          child: ListView.builder(
                              itemCount: _recommendedExList.length,
                              itemBuilder: (context,index){
                                return _recommendedExList[index];
                              }),
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
                          resetTempVars();
                          showDialog(context: context, builder: (context) {
                            return StatefulBuilder(builder: (context, setState) {
                              return AlertDialog(
                                  backgroundColor: overlaycolor,
                                  title: Text('Record Recommended Workout'),
                                  alignment: Alignment.center,
                                  content: Row(
                                    children: [
                                      ListView.builder(
                                          itemCount: _recommendedExDialogList.length,
                                          itemBuilder: (context,index){
                                            return _recommendedExDialogList[index];
                                          }),
                                    ]
                                  )
                              );
                            }
                            );
                          });
                        },

                        child: const Text('Log Recommended Workout',
                            style: TextStyle(fontSize: 18))))
              ]),
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
                          resetTempVars();
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
                                        Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                            items: exs
                                                                .map<DropdownMenuItem<String>>((String value) {
                                                              return DropdownMenuItem<String>(
                                                                value: value,
                                                                child: Text(value, style: alertTextStyle),
                                                              );
                                                            }).toList(),

                                                          ),
                                                        )
                                                    )
                                                  ]
                                              ),
                                              Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children:[
                                                    SizedBox(
                                                      height: unitHeightValue*75,
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
                                                      height: unitHeightValue*75,
                                                      child: Center(
                                                        child: SizedBox(
                                                            height: unitHeightValue*60,
                                                            width: unitHeightValue*180,
                                                            child: TextField(
                                                              onChanged: (text) {
                                                                customTempWeight = text;
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
                                                                hintText: 'lbs',
                                                              ),
                                                            )
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                              ),
                                              Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                        height: unitHeightValue*80,
                                                        margin: EdgeInsets.only(right:15),
                                                        child: Center(
                                                          child: Text("Perform max reps on last set: ", style: alertTextStyle),
                                                        )
                                                    ),
                                                    SizedBox(
                                                      height: unitHeightValue*80,
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
                                              )
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
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
                                                      minimumSize: Size(unitHeightValue*300, 45), //////// HERE
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
                                                        minimumSize: Size(unitHeightValue*300, 45), //////// HERE
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
