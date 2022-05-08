import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
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
  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.width * 0.001;
    double iconSize = unitHeightValue*50;
    TextStyle hintStyle = TextStyle(color: Color(0xff4c4c58), fontSize: unitHeightValue*30);
    TextStyle alertTextStyle = TextStyle(fontSize: unitHeightValue*30);
    return MaterialApp(
      theme: ThemeData(
        unselectedWidgetColor: Colors.red,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff111110),
        appBar: AppBar(
          title: const Text(
            'Good Morning!',
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
                margin: const EdgeInsets.only(top: 40),
                child: const Text(
                    'Inspirational message of the day',
                    style: TextStyle(fontSize: 24, color: Colors.white)
                )
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 75.0,
                    width: 200.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        border: Border.all(),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: const Center(
                      child: Text("Your next workout is scheduled for:",
                          style: TextStyle(color: Colors.white, fontSize: 16, )),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 15),
                        Icon(Icons.calendar_month_outlined,
                            size: 65, color: Colors.purple),
                        Text(
                          '--/--/--',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ]),
                ],
              ),
              Card(
                  color: overlaycolor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              'Your last workout     --/--/--',
                              style: TextStyle(color: Colors.white, fontSize: 24)
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(width: 30, height:200),
                          Icon(Icons.monitor_heart_outlined,
                              size: 90, color: Colors.purple),
                              SizedBox(width: 30, height:200),
                          Icon(Icons.fastfood_outlined,
                              size: 90, color: Colors.purple),
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(width: 30, height:200),
                              Icon(Icons.timelapse_outlined,
                                  size: 90, color: Colors.purple),
                              SizedBox(width: 30, height:200),
                              Icon(Icons.emoji_people_outlined ,
                                  size: 90, color: Colors.purple),
                            ]),
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
                            child: Text("Full summary ",
                                style: TextStyle(color: Colors.white, fontSize: 16)),
                          ),
                        ),
                      ]
                  )
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

