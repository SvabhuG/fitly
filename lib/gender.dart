import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'info.dart';

//informational page for the user's gender
class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {

  Color _bgrdcolor1 = const Color(0xff222222);
  Color _iconcolor1 = Colors.purple;

  Color _bgrdcolor2 = const Color(0xff222222);
  Color _iconcolor2 = Colors.purple;

  Color _bgrdcolor3 = const Color(0xff222222);
  Color _iconcolor3 = Colors.purple;

  static const TextStyle hintStyle = TextStyle(color: Color(0xff4c4c58), fontSize: 10);

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
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Container(
                margin: const EdgeInsets.only(top: 40),
                  child: const Text(
                      'Pleast select your gender',
                      style: TextStyle(fontSize: 24)
                  )
              ),
              Container(
                  margin: const EdgeInsets.all(30),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: _bgrdcolor1,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(200, 60), //////// HERE
                      ),
                      onPressed: () {
                        setState(() {
                          _bgrdcolor1 = Colors.purple;
                          _iconcolor1 = Colors.white;

                          _bgrdcolor2 = const Color(0xff222222);
                          _iconcolor2 = Colors.purple;

                          _bgrdcolor3 = const Color(0xff222222);
                          _iconcolor3 = Colors.purple;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Icon(
                              Icons.male,
                              size: 90,
                              color: _iconcolor1
                            ),
                            const Text(
                                'Male',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 28)
                            ),
                            const SizedBox(width: 90)
                          ]
                      )
                  )
              ),
              Container(
                  margin: const EdgeInsets.all(30),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: _bgrdcolor2,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(200, 60), //////// HERE
                      ),

                      onPressed: () {
                        setState(() {
                          _bgrdcolor2 = Colors.purple;
                          _iconcolor2 = Colors.white;

                          _bgrdcolor1 = const Color(0xff222222);
                          _iconcolor1 = Colors.purple;

                          _bgrdcolor3 = const Color(0xff222222);
                          _iconcolor3 = Colors.purple;
                        });
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children:[
                            Icon(
                                Icons.female,
                                size: 90,
                                color: _iconcolor2
                            ),
                            const Text(
                                'Female',
                                style: TextStyle(fontSize: 28)
                            ),
                            const SizedBox(
                              width: 90,
                            )
                          ]
                      )
                  )
              ),
              Container(
                  margin: const EdgeInsets.all(30),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: _bgrdcolor3,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(200, 60), //////// HERE
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
                                size: 75,
                                color: _iconcolor3
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 30),
                                child: Text(
                                'Other',
                                style: TextStyle(fontSize: 28)
                              ),
                            ),
                            const SizedBox(width: 75)
                          ]
                      )
                  )
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
                          percent: 0.33,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InfoPage())
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
            ]
        ),
      )
    );
  }
}
