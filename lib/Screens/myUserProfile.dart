import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';

import 'SettingScreens/my_acc.dart';
import 'homescreen.dart';

class MyProfileScreen extends StatelessWidget {
  final LCUser currentUser;
  MyProfileScreen({Key key, @required this.currentUser}) : super(key: key);

  Widget accCard(){
    return Card(
      child: ListTile(
        leading:FlutterLogo(size: 100,),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text( currentUser['NickName']),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text(currentUser['Position']),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(currentUser.email),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget acc_setting(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right: 8.0),
      child: Card(
        child: ListTile(
          leading:Icon(Icons.account_box),
          title: Text("My Profile"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap:(){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MyAccountScreen(currentUser: currentUser,)));
          },

        ),
      ),
    );
  }
  Widget accountSecurity(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right: 8.0),
      child: Card(
        child: ListTile(
          leading:Icon(Icons.security),
          title: Text("Account Security"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap:(){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeScreen(currentUser: currentUser,)));
          },

        ),
      ),
    );
  }
  Widget privacy_setting(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right: 8.0),
      child: Card(
        child: ListTile(
          leading:Icon(Icons.privacy_tip),
          title: Text("Privacy"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap:(){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeScreen(currentUser: currentUser,)));
          },

        ),
      ),
    );
  }
  Widget logout(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right: 8.0),
      child: Card(
        child: ListTile(
          leading:Icon(Icons.logout),
          title: Text("Log out"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap:(){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeScreen(currentUser: currentUser,)));
          },

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(("My Profile")),
        toolbarHeight: 90,
      ),
      body:  Column(
        children: [
          SizedBox(height: 20,),
          accCard(),
          Container(height: 20,color: Colors.grey[100],),
          acc_setting(context),
          accountSecurity(context),
          logout(context),
          //TODO: Grade Visualiser
        ],
      ),
    );
  }
}


