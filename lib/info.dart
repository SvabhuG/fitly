import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'muscles.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();

}

class _InfoPageState extends State<InfoPage> {


  String expValue = 'Less than 1 month';
  String weight = "";
  String protein = "";
  String goalValue = "Strength";

  static const TextStyle hintStyle = TextStyle(color: Color(0xff4c4c58), fontSize: 18);


  Future<void> setData() async {
    final prefs = await SharedPreferences.getInstance();
    if(checkFilled()) {
      prefs.setInt("weight", int.parse(weight));
      prefs.setInt("Protein", int.parse(protein));
      prefs.setString("Goal", goalValue);
      prefs.setString("Exp", expValue);
    }
    else{
      Fluttertoast.showToast(
          msg: "Please enter all values before proceeding",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }


  bool checkFilled(){
      if(weight.isEmpty || protein.isEmpty){
        return false;
      }
      return true;
  }

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.width * 0.001;
    double iconSize = unitHeightValue*50;
    TextStyle questStyle = TextStyle(fontSize: unitHeightValue*40);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff000000),
      appBar: AppBar(
        title: const Text(
            'Information',
            style: TextStyle(fontSize: 30),

        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20, bottom: 15, right: 20),
                child: Text(
                  'How much do you currently weigh?',
                  style: questStyle
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (text) {
                    weight = text;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(

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
            Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, bottom: 0, right: 20),
                child: Text(
                    'How much protein do you consume daily?',
                    style: questStyle
                )
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 15, right: 20),
                child: Text(
                    'For reference: 1oz of chicken contains 8g protein',
                    style: TextStyle(fontSize: unitHeightValue*30)
                )
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right:20, bottom: 10),
                child: SizedBox(
                    height: 40,
                    child: TextField(
                      onChanged: (text) {
                        protein = text;
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(

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
            Padding(
                padding: EdgeInsets.only(top: 15.0, left: 20, bottom: 15, right: 20),
                child: Text(
                    'How long have you been lifting for?',
                  style: questStyle,
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: DropdownButton<String>(
                    itemHeight: 50,
                    iconSize: iconSize,
                    value: expValue,
                    dropdownColor: const Color(0xff111111),
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.purple, fontSize: 28),
                    onChanged: (String? newValue) {
                      setState(() {
                        expValue = newValue!;
                      });
                    },
                    items: <String>['Less than 1 month', 'Less than 6 months', 'Less than 1 year', 'More than 1 year']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: questStyle),
                      );
                    }).toList(),

                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 15, left: 20, bottom: 15, right: 20),
                child: Text(
                  'Which of the following best describes your goals?',
                  style: questStyle,
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: DropdownButton<String>(
                    itemHeight: 50,
                    iconSize: iconSize,
                    value: goalValue,
                    dropdownColor: const Color(0xff111111),
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.purple, fontSize: 28),
                    onChanged: (String? newValue) {
                      setState(() {
                        goalValue = newValue!;
                      });
                    },
                    items: <String>['Strength', 'Hypertrophy', 'Endurance']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: questStyle),
                      );
                    }).toList(),

                  ),
                ),
              ],
            ),

            Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Expanded(
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 500,
                        percent: 0.66,
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
                    margin: const EdgeInsets.all(20),
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
                          if(checkFilled()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (
                                    context) => const MusclesPage())
                            );
                          }
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
    );
  }
}
