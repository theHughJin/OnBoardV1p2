import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:onboard/Screens/homescreen.dart';


class MyAccountScreen extends StatelessWidget {

  final LCUser currentUser;
  MyAccountScreen({Key key, @required this.currentUser}) : super(key: key);
  Widget profileImage(BuildContext context) {

    return Row(
      children: [
        Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              children: [
                Text(
                  "     Profile Image ",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),

              ],
            ),]),
        ),
      ),

        Container(
          width: 100,
          margin: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(
              image: NetworkImage(
                  'https://www.tutorialkart.com/img/hummingbird.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
            icon: Icon(Icons.chevron_right),
            iconSize: 30,
            onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ChangeNameView(currentUser: currentUser)));
            },
          ),
        )
      ],
    );
  }

  Widget profileName(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "     Name ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),

                ],
              ),]),
          ),
        ),


        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children:[
              Text(
                currentUser['NickName'],
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,color: Colors.grey[400]),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                iconSize: 30,
                onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ChangeNameView(currentUser: currentUser,)));
                },
              ),
              ],
          ),
        )
      ],
    );
  }
  Widget profilePosition() {

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "     Position ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),

                ],
              ),]),
          ),
        ),


        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children:[
              Text(
                currentUser['Position'],
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,color: Colors.grey[400]),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                iconSize: 30,
                onPressed: (){

                },
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [

            IconButton(icon: Icon(Icons.chevron_left,color: Colors.white,), onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomeScreen(currentUser: currentUser)));
            }),
            Expanded(child: Text("My Account")),
          ],
        ),toolbarHeight: 80,
      ),
      body:  ListView(
        children: <Widget>[
          profileImage(context),
          profileName(context),
          profilePosition(),

        ],
      ),
    );
  }
}


class ChangeNameView extends StatefulWidget {
  final LCUser currentUser;
  ChangeNameView({Key key, @required this.currentUser}) : super(key: key);

  @override
  _ChangeNameViewState createState() => _ChangeNameViewState(currentUser: currentUser);
}

class _ChangeNameViewState extends State<ChangeNameView> {
  final LCUser currentUser;
  _ChangeNameViewState({ @required this.currentUser});

  TextEditingController _controller;
  String text = "";
  String name = "No";
  void _setName(String nameSetTo) async{
    LeanCloud.initialize(
        'fpEzAenpIWtvEqMgD3IBpJRe-gzGzoHsz', 'wr8rRw6l5NM5UDX48McgUesl',
        server: 'https://fpezaenp.lc-cn-n1-shared.com',
        queryCache: new LCQueryCache());
    currentUser['NickName'] = nameSetTo;
    await currentUser.save();
    return null;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Name Setting"),
            ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(labelText: "Name To Change"),
              onChanged: (value) => name = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: RaisedButton(
                      color: Colors.grey[500],
                      child: Text("Cancel",style: TextStyle(color: Colors.white),),
                      onPressed:(){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen(currentUser: currentUser)));
                      }
                  ),
                ),
                SizedBox(
                  child: Container(
                    width: 20,
                    color: Colors.grey[200],
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                      color: Colors.purple[900],
                      child: Text("Done",style: TextStyle(color: Colors.white),),
                      onPressed:(){
                  _setName(name);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomeScreen(currentUser: currentUser)));
                  }

                  ),
                ),

              ],
            ),
          ),


          Text(text)
        ],
      ),
    );
  }
}

class ChangeProfileImage extends StatefulWidget {
  final LCUser currentUser;
  ChangeProfileImage({Key key, @required this.currentUser}) : super(key: key);
  @override
  _ChangeProfileImageState createState() => _ChangeProfileImageState(currentUser: currentUser);
}

class _ChangeProfileImageState extends State<ChangeProfileImage> {

  final LCUser currentUser;
  _ChangeProfileImageState({ @required this.currentUser});

  TextEditingController _controller;
  String text = "";
  String url = "No";
  void _setName(String  url ) async{
    LeanCloud.initialize(
        'fpEzAenpIWtvEqMgD3IBpJRe-gzGzoHsz', 'wr8rRw6l5NM5UDX48McgUesl',
        server: 'https://fpezaenp.lc-cn-n1-shared.com',
        queryCache: new LCQueryCache());
    LCQuery<LCObject> query = LCQuery('Users');
    query.whereEqualTo('username', currentUser['NickName']);
    List<LCObject> users = await query.find();
    for(LCObject each in users){
      each['profileURL'] = url;
    }
    await users[0].save();
    return null;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Profile Image Setting"),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(labelText: "Please Enter URL"),
              onChanged: (value) => url = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: RaisedButton(
                      color: Colors.grey[500],
                      child: Text("Cancel",style: TextStyle(color: Colors.white),),
                      onPressed:(){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => null));
                      }
                  ),
                ),
                SizedBox(
                  child: Container(
                    width: 20,
                    color: Colors.grey[200],
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                      color: Colors.purple[900],
                      child: Text("Done",style: TextStyle(color: Colors.white),),
                      onPressed:(){
                        _setName(url);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => null));
                      }

                  ),
                ),

              ],
            ),
          ),


          Text(text)
        ],
      ),
    );
  }
}


