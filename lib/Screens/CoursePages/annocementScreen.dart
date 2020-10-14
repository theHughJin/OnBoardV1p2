import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:onboard/models/Announcement.dart';

import 'couseAnnouncementPage.dart';

class AnnocementScreen extends StatefulWidget {
  String courseName;
  AnnocementScreen(String courseName) {this.courseName = courseName;}
  @override
  _AnnocementScreenState createState() => _AnnocementScreenState();
}

class _AnnocementScreenState extends State<AnnocementScreen> {
  List<Announcement> announcementsList = List();
  initState() {
    getAnnouncement();
  }
  Future<void> getAnnouncement() async {
    LeanCloud.initialize(
        'fpEzAenpIWtvEqMgD3IBpJRe-gzGzoHsz', 'wr8rRw6l5NM5UDX48McgUesl',
        server: 'https://fpezaenp.lc-cn-n1-shared.com',
        queryCache: new LCQueryCache());
    LCQuery<LCObject> query = LCQuery(widget.courseName);
    query.whereEqualTo('isAnnouncement' , true);
    List<LCObject> announcements = await query.find();
    for(LCObject each in announcements){
      Announcement announcement = Announcement(title:each['Title'],timePost:each['date'],sender: each['Sender'],announcement: each['Announcement'],announcementInit: each['AnnouncementInit']);
      setState(() {
        announcementsList.add(announcement);
      });
    }
  }

  String getSenderInital(Announcement announcement){
    String senderName = announcement.sender;
    List<String> senderNameList = senderName.split(' ');
    String firstLetter = senderNameList[0][0];
    String secondLetter = senderNameList[1][0];
    return firstLetter+""+secondLetter;
  }
  Widget announcementsCard(BuildContext context,Announcement announcement){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: ListTile(
          leading:Container(
            width: 50,
            height: 50,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(45)), //here
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
                child: Text(getSenderInital(announcement), style:
                TextStyle(color: Colors.white, fontWeight:FontWeight.bold),)),
          ),
          title:Row(
            children: [
              Text(announcement.sender,
                style: TextStyle(color: Colors.black),),
              Expanded(child: Text(announcement.timePost.toString(),textAlign: TextAlign.end,
                style: TextStyle(color: Colors.grey,fontSize: 12),),)
            ],
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CourseAnnouncementPage(announcement)),);
          },
          subtitle:Container(
              child:Text(announcement.announcementInit)
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: announcementsList.length ==0 ?  Center(child: CircularProgressIndicator()) :ListView.builder(
            itemCount: announcementsList.length,
            itemBuilder: (context, index) {
              return announcementsCard(context, announcementsList[index]);
            }
        )
    );
  }
}
