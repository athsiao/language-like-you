// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

int learnerType = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Like You',
      theme: ThemeData(fontFamily: 'Moon2.0-Regular'),
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
    "You're a photographer looking to improve your skills. How do you go about it?",
    "In a new place, how do you find your way around?",
    "Which activity is most appealing?",
    "When you picture a cat, what do you do?",
    "What's the best way to learn how a computer or video game works?",
  ];

  List<String> optionOne = [
    "Examine a diagram of a camera",
    "Look for a map",
    "A story with pictures",
    "Picture a cat in your mind",
    "Watch someone else",
  ];

  List<String> optionTwo = [
    "Ask questions about photography",
    "Ask someone for directions",
    "An audio book",
    "Say the word 'cat' to yourself",
    "Listen to an explanation",
  ];

  List<String> optionThree = [
    "Practice using a camera on your own",
    "Use surrounding buildings as a reference point",
    "A word search",
    "Think about being a cat",
    "Experiment until you figure it out"
  ];

  int _questionNumber = 0;

  void _nextQuestion() {
    setState(() {
      _questionNumber++;
      if (_questionNumber == 5) {
        _seeResults();
      }
    });
  }

  void _seeResults() {
    if (_1counter >= _2counter && _1counter >= _3counter) {
      learnerType = 0;
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Visual()),
        );
        print("Visual learner concluded");
    } else if (_2counter >= _1counter && _2counter >= _3counter) {
      learnerType = 1;
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Auditory()),
        );
        print("Auditory learner concluded");
    } else {
      learnerType = 2;
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Logical()),
        );
        print("Logical learner concluded");
    }
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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Text(questions[_questionNumber],
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                fontFamily: 'Moon2.0-Bold',
                color: Colors.pink[600],
              )
            ),

            // OPTION 1
            FlatButton(
              onPressed: () {
                print("Type 1 incremented");
                _incrementCounter1(); //increment type 1
                _nextQuestion(); //move on
              },
            child: Text(
                  optionOne[_questionNumber],
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
                  optionTwo[_questionNumber],
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
                  optionThree[_questionNumber],
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

// RESULTS PAGE - VISUAL LEARNERS
class Visual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
        child: Column(
          children: <Widget>[
            // logo
            Image(
              image: AssetImage('assets/eye.png'),
            ),
            Text("You are a visual learner!",
            style: TextStyle(
                fontFamily: "Moon2.0-Regular",
                fontWeight: FontWeight.w300,
                color: Colors.pink[400],
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: FlatButton(
                onPressed: () {
                  print("Visual Continue");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text(
                  "learn visually",
                  style: TextStyle(
                    color: Colors.pink[900],
                    fontFamily: 'Moon2.0',
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 75),
                color: Colors.pink[50],
              ),
            ),
          ]
        ),
      );
  }
}

// RESULTS PAGE - AUDITORY LEARNERS
class Auditory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
        child: Column(
          children: <Widget>[
            // logo
            Image(
              image: AssetImage('assets/ear.png'),
            ),
            Text("You are an auditory learner!",
            style: TextStyle(
                fontFamily: "Moon2.0-Regular",
                fontWeight: FontWeight.w300,
                color: Colors.pink[400],
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: FlatButton(
                onPressed: () {
                  print("Auditory continue");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text(
                  "learn with audio",
                  style: TextStyle(
                    color: Colors.pink[900],
                    fontFamily: 'Moon2.0',
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 75),
                color: Colors.pink[50],
              ),
            ),
          ]
        ),
      );
  }
}

// RESULTS PAGE - LOGICAL LEARNERS
class Logical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
        child: Column(
          children: <Widget>[
            // logo
            Image(
              image: AssetImage('assets/brain.png'),
            ),
            Text("You are a logical learner!",
              style: TextStyle(
                fontFamily: "Moon2.0-Regular",
                fontWeight: FontWeight.w300,
                color: Colors.pink[400],
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: FlatButton(
                onPressed: () {
                  print("Logical continue");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text(
                  "learn logically",
                  style: TextStyle(
                    color: Colors.pink[900],
                    fontFamily: 'Moon2.0',
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 75),
                color: Colors.pink[50],
              ),
            ),
          ]
        ),
      );
  }
}

// HOME PAGE ----------------------------------------------------------
class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  // 0 = visual
  // 1 = auditory
  // 2 = logical

  List<String> types = [
    "visually",
    "auditorily",
    "logically",
  ];

  @override
  Widget build(BuildContext context) {
    
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/china.png'),
                  width: 70,
                  ),
                Image(
                  image: AssetImage('assets/japan.png'),
                  width: 70,
                  ),
                Image(
                  image: AssetImage('assets/add-new.png'),
                  width: 70,
                  ),
              ],
            ),

            Container(
              padding: EdgeInsets.only(top: 60),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Welcome back!",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      fontFamily: 'Moon2.0-Bold',
                      color: Colors.pink[600],
                  )
                )
              )
            ),

            Container(
              padding: EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Lesson One: Introductions",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Moon2.0-Bold',
                      color: Colors.pink[600],
                  )
                )
              )
            ),

            Row( // first row
              children: <Widget>[
                Image(
                  image: AssetImage('assets/lessons/intro.png'),
                  width: 100,
                  ),
                Image(
                  image: AssetImage('assets/lessons/greeting.png'),
                  width: 100,
                  ),
                Image(
                  image: AssetImage('assets/lessons/meeting.png'),
                  width: 100,
                  ),
              ],
            ),

          Container(
              padding: EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Lesson Two: Times, Places, Emergency",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Moon2.0-Bold',
                      color: Colors.pink[600],
                  )
                )
              )
            ),

            Row( // second row
              children: <Widget>[
                Image(
                  image: AssetImage('assets/lessons/time.png'),
                  width: 100,
                  ),
                Image(
                  image: AssetImage('assets/lessons/location.png'),
                  width: 100,
                  ),
                Image(
                  image: AssetImage('assets/lessons/emergency.png'),
                  width: 100,
                  ),
              ],
            ),

            Container(
              padding: EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Lesson Three: Meals of the Day",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Moon2.0-Bold',
                      color: Colors.pink[600],
                  )
                )
              )
            ),

            Row( // third row
              children: <Widget>[
                Image(
                  image: AssetImage('assets/lessons/breakfast.png'),
                  width: 100,
                  ),
                Image(
                  image: AssetImage('assets/lessons/lunch.png'),
                  width: 100,
                  ),
                Image(
                  image: AssetImage('assets/lessons/dinner.png'),
                  width: 100,
                  ),
              ],
            ),

            // OPTION 3
            Container(
              padding: EdgeInsets.only(top: 20),
              child: FlatButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Welcome()),
              );
              },
            child: Text(
                  "retake the test",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Moon2.0',
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 75),
                color: Colors.pink[600],
              )
            ),

            Text("you are currently learning " + types[learnerType],
            style: TextStyle(
              color: Colors.pink[900],
              fontFamily: 'Moon2.0-Regular',
              fontWeight: FontWeight.w400,
              fontSize: 12,
            )),
            
          ]
        ),
    );
  }
}

// VISUAL EXERCISE -------------------------------------------------------
