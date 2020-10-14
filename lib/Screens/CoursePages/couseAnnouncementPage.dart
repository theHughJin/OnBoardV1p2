import 'package:flutter/material.dart';
import 'package:onboard/models/Announcement.dart';

class CourseAnnouncementPage extends StatelessWidget {
  Announcement announcement;
  CourseAnnouncementPage(Announcement announcement) {this.announcement = announcement;}
  Widget announcementsCard(BuildContext context,Announcement announcement){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: ListTile(
          title:Row(
            children: [
              Text(announcement.sender,
                style: TextStyle(color: Colors.black),),
              Expanded(child: Text(announcement.timePost.toString(),textAlign: TextAlign.end,
                style: TextStyle(color: Colors.grey,fontSize: 12),),)
            ],
          ),
          subtitle:Container(
              child:Text(announcement.announcement)
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(announcement.title),
        toolbarHeight: 90,
      ),
      body: Column(
        children: [
          announcementsCard(context,announcement),
        ],
      ),
    );
  }
}



/**
    RaisedButton(
    child: Text("Reply"),
    color: Colors.white,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
    side: BorderSide(color: Colors.black)
    ),
    onPressed: (){}),
    SizedBox(width: 30,),
    RaisedButton(
    child: Text("Back"),
    color: Colors.white,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
    side: BorderSide(color: Colors.black)

    ),
    onPressed: (){
    Navigator.pop(context);
    }),
 */