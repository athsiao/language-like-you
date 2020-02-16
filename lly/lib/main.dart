// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Like You',
      theme: ThemeData(fontFamily: 'Moon2.0'),
      home: Splash(),
    );
  }
}

// SPLASH SCREEN
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 250),
        child: Column(
          children: <Widget>[
            // logo
            Image(
              image: AssetImage('assets/logo.png'),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: FlatButton(
                onPressed: () {
                  print("Pressed continue");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                },
                child: Text(
                  "continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Moon2.0',
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 75),
                color: Colors.pink[600],
              ),
            ),
          ]
        ),
      );
  }
}

// WELCOME PAGE
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 200),
        child: Column(
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage('assets/welcome.png'),
                height: 200,
                width: 200,
              ),
              padding: EdgeInsets.all(20),
            ),

            FlatButton(
              onPressed: () {
                print("Test initiated");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningTest()),
                );
              },
            child: Text(
                  "Take the Test",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Moon2.0',
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 75),
                color: Colors.pink[600],
            ),
            
            FlatButton(
              onPressed: () {
                print("Went back to splash screen");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Splash()),
                );
              },
            child: Text(
                  "<< Go Back",
                  style: TextStyle(
                    color: Colors.pink[600],
                    fontFamily: 'Moon2.0',
                  )
                ),
                padding: EdgeInsets.only(right: 150, bottom: 40)
            ),
          ]
        ),
    );
  }
}

// LEARNING TEST
class LearningTest extends StatefulWidget {
  LearningTest({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LearningTestState createState() => _LearningTestState();
}

class _LearningTestState extends State<LearningTest> {
  int _1counter = 0;
  int _2counter = 0;
  int _3counter = 0;

  List<String> questions = [
    "one",
    "two",
    "three",
    "four",
    "five",
  ];

  int _questionNumber = 0;

  void _nextQuestion() {
    setState(() {
      _questionNumber++;
      if (_questionNumber == 5) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Splash()),
        );
        print("Test concluded");
      }
    });
  }

  void _incrementCounter1() {
    setState(() {
      _1counter++;
    });
  }

  void _incrementCounter2() {
    setState(() {
      _2counter++;
    });
  }

  void _incrementCounter3() {
    setState(() {
      _3counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Text(questions[_questionNumber]),

            // OPTION 1
            FlatButton(
              onPressed: () {
                print("Type 1 incremented");
                _incrementCounter1(); //increment type 1
                _nextQuestion(); //move on
              },
            child: Text(
                  "Option 1",
                  style: TextStyle(
                    color: Colors.pink[900],
                    fontFamily: 'Moon2.0',
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 75),
                color: Colors.pink[50],
            ),

            // OPTION 2
            FlatButton(
              onPressed: () {
                print("Type 2 incremented");
                _incrementCounter2(); //increment type 2
                _nextQuestion(); //move on
              },
            child: Text(
                  "Option 2",
                  style: TextStyle(
                    color: Colors.pink[900],
                    fontFamily: 'Moon2.0',
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 75),
                color: Colors.pink[50],
            ),

            // OPTION 3
            FlatButton(
              onPressed: () {
                print("Type 3 incremented");
                _incrementCounter3(); // increment type 3
                _nextQuestion();//move on
              },
            child: Text(
                  "Option 3",
                  style: TextStyle(
                    color: Colors.pink[900],
                    fontFamily: 'Moon2.0',
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 75),
                color: Colors.pink[50],
            ),
            
          ]
        ),
    );
  }
}