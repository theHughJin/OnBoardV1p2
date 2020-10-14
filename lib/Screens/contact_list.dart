import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'dart:collection';

import 'package:onboard/Resources/global_method.dart';

class ContactList extends StatelessWidget {

  final LCUser currentUser;
  ContactList ({Key key, @required this.currentUser}):super (key : key);
  var controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List"),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: (){
            GloablMethods().addingFriend(currentUser, "uq@uq.com");
          })
        ],
      ),
      body : Padding(
        padding: new EdgeInsets.only(top: 22.0),
        child: ListView.builder(
          itemCount: 1+currentUser['ContactList'].length,
          itemBuilder: (BuildContext context , int index){
            return  new ListTile(
                leading: Icon(Icons.supervised_user_circle),
                title: Text(currentUser['ContactList'].elementAt(index)),
                trailing: IconButton(
                  icon: Icon(Icons.chevron_right),
                ),
              );
          },
        ),
      ),
    );
  }
}
