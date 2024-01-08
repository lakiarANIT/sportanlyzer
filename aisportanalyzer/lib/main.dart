import 'package:aisportanalyzer/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.lightBlue, // Set the primary color for the app
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
