// ignore: slash_for_doc_comments
import 'dart:collection';

/**
 * File representing the HomePage Users can creating Video calls, Join Meeting, View Calendar
 * Also user is able to see the Chatting List of User
 * DataBase: LeanCloud where AppID is fpEzAenpIWtvEqMgD3IBpJRe
 * Temporal server is   https://fpezaenp.lc-cn-n1-shared.com
 * Project Name:  OnBoaerd
 * CopyRight DECO3801 2020 TEAM MA(The university of Queensland)
 * Last updated by Xin Jin 01/10/2020
 **/

import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:onboard/Screens/CoursePages/CourseScreen.dart';

import 'homescreen.dart';


///Home Index Page Taking 1 parameter
///@Parameter emailadd: Email address of user which passed from HomeIndexPage()
class HomePage extends StatelessWidget {
  final LCUser currentUser;
  HomePage({Key key, @required this.currentUser}) : super(key: key);
  Widget _contactList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return new ListTile(
                onTap: () {
                  //CourseScreen
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CourseScreen(currentUser['CourseList'].elementAt(index))),);
                },
                leading: Icon(
                  Icons.school, color: Colors.purple[900], size: 30,),
                title: Text(this.currentUser['CourseList'].elementAt(index)),
                trailing: Icon(Icons.chevron_right),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
        toolbarHeight: 80,
      ),
      body: currentUser == null ?  Center(child: CircularProgressIndicator()):Column(
        children: [
          SizedBox(
            height: 10,
            child: Container(color: Colors.white),
          ),
          SizedBox(
            height: 10,
            child: Container(color: Colors.white),
          ),
          _contactList()
        ],
      )
    );
  }
}

