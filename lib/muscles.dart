import 'dart:ui';

import 'package:fitly/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'info.dart';

class MusclesPage extends StatefulWidget {
  const MusclesPage({Key? key}) : super(key: key);

  @override
  State<MusclesPage> createState() => _MusclesPageState();
}

class _MusclesPageState extends State<MusclesPage> {

  Color _bgrdcolor1 = const Color(0xff222222);
  Color _iconcolor1 = Colors.purple;

  Color _bgrdcolor2 = const Color(0xff222222);
  Color _iconcolor2 = Colors.purple;

  Color _bgrdcolor3 = const Color(0xff222222);
  Color _iconcolor3 = Colors.purple;

  static const TextStyle hintStyle = TextStyle(color: Color(0xff4c4c58), fontSize: 10);

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
            Text("Please select the muscles groups that you would like to train"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _bgrdcolor3,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(240, 60), //////// HERE
                        ),

                        onPressed: () {
                          setState(() {
                            _bgrdcolor3 = Colors.purple;
                            _iconcolor3 = Colors.white;

                            _bgrdcolor2 = const Color(0xff222222);
                            _iconcolor2 = Colors.purple;

                            _bgrdcolor1 = const Color(0xff222222);
                            _iconcolor1 = Colors.purple;
                          });
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Icon(
                                  Icons.transgender,
                                  size: iconSize,
                                  color: _iconcolor3
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 30),
                                child: Text(
                                    'Chest',
                                    style: buttonStyle
                                ),
                              ),
                              SizedBox(width: iconSize)
                            ]
                        )
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _bgrdcolor3,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(240, 60), //////// HERE
                        ),

                        onPressed: () {
                          setState(() {
                            _bgrdcolor3 = Colors.purple;
                            _iconcolor3 = Colors.white;

                            _bgrdcolor2 = const Color(0xff222222);
                            _iconcolor2 = Colors.purple;

                            _bgrdcolor1 = const Color(0xff222222);
                            _iconcolor1 = Colors.purple;
                          });
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Icon(
                                  Icons.transgender,
                                  size: iconSize,
                                  color: _iconcolor3
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                child: Text(
                                    'Biceps',
                                    style: buttonStyle
                                ),
                              ),
                              SizedBox(width: iconSize)
                            ]
                        )
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _bgrdcolor3,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(240, 60), //////// HERE
                        ),

                        onPressed: () {
                          setState(() {
                            _bgrdcolor3 = Colors.purple;
                            _iconcolor3 = Colors.white;

                            _bgrdcolor2 = const Color(0xff222222);
                            _iconcolor2 = Colors.purple;

                            _bgrdcolor1 = const Color(0xff222222);
                            _iconcolor1 = Colors.purple;
                          });
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                              Icon(
                                  Custom.male_hips_and_quadriceps_svgrepo_com,
                                  size: iconSize,
                                  color: _iconcolor3
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 30),
                                child: Text(
                                    'Legs',
                                    style: buttonStyle
                                ),
                              ),
                              SizedBox(width: iconSize)
                            ]
                        )
                    )
                  ]
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _bgrdcolor3,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(240, 60), //////// HERE
                        ),

                        onPressed: () {
                          setState(() {
                            _bgrdcolor3 = Colors.purple;
                            _iconcolor3 = Colors.white;

                            _bgrdcolor2 = const Color(0xff222222);
                            _iconcolor2 = Colors.purple;

                            _bgrdcolor1 = const Color(0xff222222);
                            _iconcolor1 = Colors.purple;
                          });
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Icon(
                                  Icons.transgender,
                                  size: iconSize,
                                  color: _iconcolor3
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 30),
                                child: Text(
                                    'Back',
                                    style: buttonStyle
                                ),
                              ),
                              SizedBox(width: iconSize)
                            ]
                        )
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _bgrdcolor3,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(240, 60), //////// HERE
                        ),

                        onPressed: () {
                          setState(() {
                            _bgrdcolor3 = Colors.purple;
                            _iconcolor3 = Colors.white;

                            _bgrdcolor2 = const Color(0xff222222);
                            _iconcolor2 = Colors.purple;

                            _bgrdcolor1 = const Color(0xff222222);
                            _iconcolor1 = Colors.purple;
                          });
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Icon(
                                  Icons.transgender,
                                  size: iconSize,
                                  color: _iconcolor3
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 30),
                                child: Text(
                                    'Triceps',
                                    style: buttonStyle
                                ),
                              ),
                              SizedBox(width: iconSize)
                            ]
                        )
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _bgrdcolor3,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(240, 60), //////// HERE
                        ),

                        onPressed: () {
                          setState(() {
                            _bgrdcolor3 = Colors.purple;
                            _iconcolor3 = Colors.white;

                            _bgrdcolor2 = const Color(0xff222222);
                            _iconcolor2 = Colors.purple;

                            _bgrdcolor1 = const Color(0xff222222);
                            _iconcolor1 = Colors.purple;
                          });
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Icon(
                                  Icons.transgender,
                                  size: iconSize,
                                  color: _iconcolor3
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                child: Text(
                                    'Shoulders',
                                    style: buttonStyle
                                ),
                              ),
                              SizedBox(width: iconSize)
                            ]
                        )
                    )
                  ]
                )
              ],
            )
          ],
        )
      )
    );
  }
}
