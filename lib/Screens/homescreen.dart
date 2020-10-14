// ignore: slash_for_doc_comments
/**
 * File representing the HomeIndexPage Users can use this change page to different pages
 * DataBase: LeanCloud where AppID is fpEzAenpIWtvEqMgD3IBpJRe
 * Temporal server is   https://fpezaenp.lc-cn-n1-shared.com
 * Project Name:  OnBoaerd
 * CopyRight DECO3801 2020 TEAM MA(The university of Queensland)
 * Last updated by Xin Jin 01/10/2020
 **/

import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:onboard/Screens/homepage.dart';
import 'package:onboard/Screens/myUserProfile.dart';
import 'Calendar/calendarview.dart';
import 'SettingScreens/my_acc.dart';


///Home Index Page Taking 1 parameter
///@Parameter currentEmail: Email address of user which passed from LoginScreen and
///                         passing email address to the _HomeScreenState()
class HomeScreen extends StatefulWidget {
  final LCUser currentUser;
  HomeScreen({Key key, @required this.currentUser}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState(currentUser);
}

/// Home Index Page State, takes 1 parameter
///@Parameter currentEmail: Email address of user which passed from HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  LCUser  currentUser;
  _HomeScreenState(this.currentUser);  //constructor
  //Index of the page
  int _selectedTabIndex = 1;
  // Index Page for Main Screen.
  // First Page: Home Screen(),
  // Second page: ContactScreen()
  // Third Page: userProfileScreen()
  List _pages ;
  ///Setting State of Index (Index page)
  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages =  [
      HomePage(currentUser: widget.currentUser),
      Expanded(child: CalendarViewPage()),
      MyProfileScreen(currentUser:widget.currentUser),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedTabIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text("Calendar")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("My Account")),
        ],
      ),
    );
  }
}
