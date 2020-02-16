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