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
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 250),
        child: Column(
          children: <Widget>[
            Text("Welcome!",
              style: TextStyle(
                color: Colors.pink[600],
                fontSize: 45,
                fontFamily: 'Moon2.0',
              ),
              textAlign: TextAlign.left,
            ),

            FlatButton(
              onPressed: () {
                print("Test initiated");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Splash()),
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