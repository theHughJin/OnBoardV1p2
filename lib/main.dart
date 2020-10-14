import 'package:flutter/material.dart';
import 'Screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

/*
  Main class of the program
  Currently setting the LoginScreen as HomePage
  HomeColor: Deep Purple => UQ purple
 */
class MyApp extends StatelessWidget {
  static String coursename = "COMP3710";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.purple[900],
        backgroundColor: Colors.grey
      ),
      title: "OnBoard",
      home: LoginScreen()
    );
  }
}
