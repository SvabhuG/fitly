import 'dart:ui';

import 'package:fitly/custom_icons.dart';
import 'package:fitly/workout.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'info.dart';

class MusclesPage extends StatefulWidget {
  const MusclesPage({Key? key}) : super(key: key);

  @override
  State<MusclesPage> createState() => _MusclesPageState();
}

class _MusclesPageState extends State<MusclesPage> {

  var bgrdcolors = List.generate(6, (_) => Color(0xff222222));

  static const TextStyle hintStyle = TextStyle(color: Color(0xff4c4c58), fontSize: 10);
  var muscles = <String>[];
  Future<void> setData() async {
    final prefs = await SharedPreferences.getInstance();


    if(muscles.isNotEmpty) {
      String save = "";
      for(String muscle in muscles){
        save = save + muscle + " ";
      }
      prefs.setString("Muscles", save);
    }
    else{
      Fluttertoast.showToast(
          msg: "Please enter focus areas before proceeding",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    double unitHeightValue = MediaQuery.of(context).size.width * 0.001;
    double iconSize = unitHeightValue*100;


    TextStyle buttonStyle = TextStyle(fontSize: unitHeightValue*40);
    TextStyle questStyle = TextStyle(fontSize: unitHeightValue*40);
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        title: const Text(
            'Information',

            style: TextStyle(fontSize: 30),

        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Please select muscles groups you would like to train", style: questStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: bgrdcolors[0],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(unitHeightValue*400, 60), //////// HERE
                          ),

                          onPressed: () {
                            setState(() {
                                bgrdcolors[0] = (bgrdcolors[0] == Color(0xff222222)) ? Colors.purple:Color(0xff222222);
                                if(muscles.contains("Chest")){
                                  muscles.remove("Chest");
                                }
                                else{
                                  muscles.add("Chest");
                                }

                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                                'Chest',
                                style: buttonStyle
                            ),
                          ),
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            primary: bgrdcolors[1],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(unitHeightValue*400, 60), //////// HERE
                          ),

                        onPressed: () {
                          setState(() {
                            bgrdcolors[1] = (bgrdcolors[1] == Color(0xff222222)) ? Colors.purple:Color(0xff222222);
                          });
                          if(muscles.contains("Biceps")){
                            muscles.remove("Biceps");
                          }
                          else{
                            muscles.add("Biceps");
                          }
                        },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                                'Biceps',
                                style: buttonStyle
                            ),
                          ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: bgrdcolors[2],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(unitHeightValue*400, 60), //////// HERE
                          ),

                        onPressed: () {
                          setState(() {
                            bgrdcolors[2] = (bgrdcolors[2] == Color(0xff222222)) ? Colors.purple:Color(0xff222222);
                          });
                          if(muscles.contains("Legs")){
                            muscles.remove("Legs");
                          }
                          else{
                            muscles.add("Legs");
                          }
                        },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                                'Legs',
                                style: buttonStyle
                            ),
                          ),
                      )
                    )
                  ]
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: bgrdcolors[3],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(unitHeightValue*400, 60), //////// HERE
                          ),

                        onPressed: () {
                          setState(() {
                            bgrdcolors[3] = (bgrdcolors[3] == Color(0xff222222)) ? Colors.purple:Color(0xff222222);
                          });
                          if(muscles.contains("Back")){
                            muscles.remove("Back");
                          }
                          else{
                            muscles.add("Back");
                          }
                        },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                                'Back',
                                style: buttonStyle
                            ),
                          ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: bgrdcolors[4],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(unitHeightValue*400, 60), //////// HERE
                          ),

                        onPressed: () {
                          setState(() {
                            bgrdcolors[4] = (bgrdcolors[4] == Color(0xff222222)) ? Colors.purple:Color(0xff222222);
                          });
                          if(muscles.contains("Triceps")){
                            muscles.remove("Triceps");
                          }
                          else{
                            muscles.add("Triceps");
                          }
                        },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                                'Triceps',
                                style: buttonStyle
                            ),
                          ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: bgrdcolors[5],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(unitHeightValue*400, 60), //////// HERE
                          ),

                        onPressed: () {
                          setState(() {
                            bgrdcolors[5] = (bgrdcolors[5] == Color(0xff222222)) ? Colors.purple:Color(0xff222222);
                          });
                          if(muscles.contains("Shoulders")){
                            muscles.remove("Shoulders");
                          }
                          else{
                            muscles.add("Shoulders");
                          }
                        },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                                'Shoulders',
                                style: buttonStyle
                            ),
                          ),
                      )
                    )
                  ]
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Expanded(
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 500,
                        percent: 1,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.purple[200],
                        progressColor: Colors.purple,
                      ),
                    )
                    ]
                )
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Container(
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
                          setData();
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkoutPage())
                          );
                        },
                        child: const Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 18
                            )
                        )
                    )
                )
                ]
            ),
          ],
        )
      )
    );
  }
}
