import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personalized Workout Information',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xff161324)),
      home: const MyHomePage(title: 'Personalized Workout Information'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xffaeb1b9));
  static const TextStyle questStyle = TextStyle(color: Color(0xffaeb1b9));
  static const TextStyle hintStyle = TextStyle(color: Color(0xff4c4c58));
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Row(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:const [
                Text(
                'How much do you currently weight?',
                  style: questStyle
                ),
                Text(
                    'How much protein do you consume weekly?',
                    style: questStyle
                ),
              ]
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:const [

                  SizedBox(
                      width: 70,
                      height: 30,
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
                  SizedBox(
                      width: 70,
                      height: 30,
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
                  )
                ]
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff161324),
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Workout',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Journal',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Profile',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: const Color(0xffaeb1b9),
        selectedItemColor: const Color(0xff7793d2),
        onTap: _onItemTapped,
      ),
    );
  }
}
