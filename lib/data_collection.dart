import 'dart:ui';

import 'package:flutter/material.dart';

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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(const Radius.circular(12.0)),
            color: Color(0xff111111),
            //color: Colors.purple
          ),
          margin: const EdgeInsets.all(20.0),
          height: 256,
          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //Row(mainAxisAlignment: MainAxisAlignment.start,children: const [Text('Hello')]),
              children: [Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:const [
                  Text(
                  'How much do you currently weigh?',
                    style: questStyle
                  ),
                  Text(
                      'How much protein do you consume weekly?',
                      style: questStyle
                  ),
                  Text(
                      'How long have you been lifting for?',
                      style: questStyle
                  ),
                ]
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:const [

                    SizedBox(
                        width: 50,
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
                        width: 50,
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
                            hintText: 'grams',
                          ),
                        )
                    ),
                    SizedBox(
                        width: 50,
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
                            hintText: 'months',
                          ),
                        )
                    )
                  ]
              )
              ]
            ),
          ),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Expanded(
                      child: LinearProgressIndicator(
                        value: 0.2,
                        semanticsLabel: 'Linear progress indicator',
                        backgroundColor: Colors.purple[200],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                      ),
                    )

                    ]
                )
            )
          ]
      ),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff015191c),
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
        selectedItemColor: const Color(0xffF4442E),
        onTap: _onItemTapped,
      ),*/
    );
  }
}
