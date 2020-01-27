import 'package:flutter/material.dart';
import 'package:tech_talk/homepage_screen.dart';
import 'package:tech_talk/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechTalk Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          button: TextStyle(
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 1.5,
          ),
        ),
      ),
      home: MainScreen(),
    );
  }
}
