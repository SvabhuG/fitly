import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  double unitHeightValue = 0;
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
  List<Widget> _recommendedExMaxList = [];
  List<String> exs = [];
  List<Exercise> newExercises = [];

  List<TextEditingController> _controllers = [];

  TextStyle hintStyle = TextStyle(color: Color(0xff4c4c58), fontSize: 25);

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('intro_seen', true);
    print("building user");
    if(!userBuilt){
      print("in build if statement");
      await user.buildUser();
      firstWorkout();
      userBuilt = true;

      for(Exercise e in user.getExercises()){
        if(user.getMuscles().contains(e.getMuscleGroup())){
          exs.add(e.getName());
          print("builduser: " + e.getName());
        }
      }
    }
  }

  bool checkRecommendedController(){
    bool check = true;
    print("entered function");
    print("new exercises length: " + newExercises.length.toString());
    print("controller length: " + _controllers.length.toString());
    for(TextEditingController c in _controllers){
      print((c.text));
      if(c.text == ""){
        check = false;
      }
    }
    return check;
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

  void _addRecommendedExWidget(Exercise ex){
    String name = ex.getName();
    String sets = ex.getSets().toString();
    String reps = ex.getReps().toString();

    _recommendedExDialogList.add(Padding(
      padding: EdgeInsets.all(13),
      child:Text(
          "$name",
          style: exStyle
      ),
    )
    );

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

  void updateRecommended(){
    setState(() {
      newExercises = user.workoutUpdate();
      _recommendedExList = [];
      _recommendedExDialogList = [];
      for(Exercise e in newExercises){
        _addRecommendedExWidget(e);
      }
    });
  }

  void saveRecommended(){
    for(int i = 0; i < newExercises.length; i++){
      newExercises[i].setMaxlastreps(int.parse(_controllers[i].text));
    }
  }

  void firstWorkout(){
    setState(() {
      newExercises = user.baseWorkout();
      _recommendedExList = [];
      for(Exercise e in newExercises){
        _addRecommendedExWidget(e);
      }
    });
  }

  void resetTempVars(){
    customTempMaxReps = "";
    customTempEx = "Bench Press";
    customTempSets = "";
    customTempReps = "";
    customTempWeight = "";
    _customExList = [];
    _controllers = [];
  }

  @override
  Widget build(BuildContext context) {
    unitHeightValue = MediaQuery.of(context).size.width * 0.001;
    double iconSize = unitHeightValue*50;
    hintStyle = TextStyle(color: Color(0xff4c4c58), fontSize: unitHeightValue*30);
    TextStyle alertTextStyle = TextStyle(fontSize: unitHeightValue*25);
    TextStyle buttonTextStyle = TextStyle(fontSize: unitHeightValue*35);
    print("Controllers length: " + _controllers.length.toString());
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
                                  title: Text('Recommended Workout'),
                                  alignment: Alignment.center,
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                          children: [
                                            SizedBox(
                                                width: 150,
                                                height: 300,
                                                child: ListView.builder(
                                                    itemCount: _recommendedExDialogList.length,
                                                    itemBuilder: (context,index){
                                                      return _recommendedExDialogList[index];
                                                    })
                                            ),
                                            SizedBox(
                                                width: 150,
                                                height: 300,
                                                child: ListView.builder(
                                                    itemCount: 6,
                                                    itemBuilder: (context,index){
                                                      if(_controllers.length < 6){
                                                        _controllers.add(TextEditingController());
                                                      }

                                                      return SizedBox(
                                                          height: unitHeightValue*75,
                                                          child: Center(
                                                              child: SizedBox(
                                                                  height: unitHeightValue*60,
                                                                  width: unitHeightValue*180,
                                                                  child: TextField(
                                                                      controller: _controllers[index],
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
                                                                        hintText: 'max reps',
                                                                      )
                                                                  )
                                                              )
                                                          )
                                                      );
                                                    })
                                            )
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
                                              minimumSize: Size(unitHeightValue*300, 45), //////// HERE
                                            ),
                                            onPressed: () {
                                              setState((){
                                                if(checkRecommendedController()){
                                                  saveRecommended();
                                                  updateRecommended();
                                                  Navigator.pop(context);
                                                  _controllers = [];

                                                }
                                                else{
                                                  Fluttertoast.showToast(
                                                      msg: "Enter all max reps before saving",
                                                      toastLength: Toast.LENGTH_SHORT,
                                                      gravity: ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor: Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0
                                                  );
                                                }

                                              });
                                            },
                                            child: const Text('Save',
                                                style: TextStyle(fontSize: 14))
                                        ),
                                      ),
                                    ],
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
                                                            items: exs.map<DropdownMenuItem<String>>((String value) {
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
                                                        if(_customExList.isNotEmpty){
                                                          Navigator.pop(context);
                                                          updateRecommended();
                                                        }
                                                        else{
                                                          Fluttertoast.showToast(
                                                              msg: "Add exercise before submitting",
                                                              toastLength: Toast.LENGTH_SHORT,
                                                              gravity: ToastGravity.BOTTOM,
                                                              timeInSecForIosWeb: 1,
                                                              backgroundColor: Colors.red,
                                                              textColor: Colors.white,
                                                              fontSize: 16.0
                                                          );
                                                        }
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    '* Perform max reps to failure on the last set of every exercise',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '* Too easy or difficult? Log a custom workout for better future recommendations',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),/*
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
        ),*/
      ),
    );
  }
}
