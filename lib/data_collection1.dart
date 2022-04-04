import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DataCollectPage extends StatefulWidget {
  const DataCollectPage({Key? key}) : super(key: key);

  @override
  State<DataCollectPage> createState() => _DataCollectPageState();
}

class _DataCollectPageState extends State<DataCollectPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xffaeb1b9));

  static Color bgrdColor = const Color(0xff000000);

  static const TextStyle questStyle =
  TextStyle(fontSize: 14, color: Color(0xffffffff));

  static const TextStyle hintStyle = TextStyle(color: Color(0xff4c4c58), fontSize: 10);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Dashboard',
      style: optionStyle,
    ),
    Text(
      'Index 1: Workout',
      style: optionStyle,
    ),
    Text(
      'Index 2: Journal',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20, bottom: 10, right: 20),
                child: Text(
                  'How much do you currently weigh?',
                  style: questStyle
                )
            ),

            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                height: 40,
                child: TextField(
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
                    hintText: 'lbs',
                  ),
                )
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20, bottom: 10, right: 20),
                child: Text(
                    'How much protein do you consume weekly?',
                    style: questStyle
                )
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                    height: 40,
                    child: TextField(
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
                        hintText: 'grams',
                      ),
                    )
                )
            ),
            const Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20, bottom: 10, right: 20),
                child: Text(
                    'How long have you been lifting for?',
                )
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                    height: 40,
                    child: TextField(
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
                        hintText: 'months',
                      ),
                    )
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DataCollectPage())
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
            Container(
                margin: const EdgeInsets.all(20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Expanded(
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        lineHeight: 15.0,
                        animationDuration: 500,
                        percent: 0.3,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.purple[200],
                        progressColor: Colors.purple,
                      ),
                    )

                    ]
                )
            )
          ]

      ),
    );
  }
}
