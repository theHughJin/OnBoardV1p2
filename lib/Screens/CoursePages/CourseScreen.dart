import 'package:flutter/material.dart';
import 'annocementScreen.dart';

class CourseScreen extends StatefulWidget {
  String courseName;
  CourseScreen(String courseName) {this.courseName = courseName;}
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.announcement)),
              Tab(icon: Icon(Icons.assignment)),
              Tab(icon: Icon(Icons.calendar_today)),
              Tab(icon: Icon(Icons.question_answer)),

            ],
          ),
          title: Text(widget.courseName),
        ),
        body: TabBarView(
          children: [
            AnnocementScreen(widget.courseName),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_bike),

          ],
        ),
      ),
    );
  }
}
