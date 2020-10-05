import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'backtohomepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {

  _MyChatState createState() => _MyChatState();

}


class _MyChatState extends State<Chat> {


var webdata;
var fs2=FirebaseFirestore.instance;
var webdata2;
var string=" ";
var cmd;
myweb(cmd) async {
    var url = "http://192.168.43.86/cgi-bin/linux_cmd.py?x=${cmd}";
    var r = await http.get(url);
    setState(() {
      webdata2 = r.body;
      string = string + " " + webdata2;
    });
    var d= fs2.collection("mydb").add(
      {
        '$cmd' : '$webdata2' ,
      }
    );
  }

void initState() {
    print("landed to chat");
    super.initState();
  }


  Widget build(BuildContext context) {

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText1,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    color: Colors.cyan,
              padding: EdgeInsets.all(20),
              child: Text('Chat-Box',
              style: TextStyle(
                fontSize: 40 ,
                color: Colors.black , 
                fontWeight: FontWeight.bold,
            ),
              ),
                  ),
            Card(
                              child: TextField(
                                autocorrect: false,
                                decoration: InputDecoration(
                                  hintText: 'linux command',
                                  
                                  hoverColor: Colors.blue , 
                                  icon: Icon(FontAwesomeIcons.linux , size: 40,) ,
                                ),
                  onChanged: (value) {
                    cmd = value;
                  },
                ),
              ),
              FlatButton(
                  onPressed: () async {
                myweb(cmd);
                await for (var i in fs2.collection("mydb").snapshots()) {
                  for(var doc in i.docs) {
                    webdata=doc.data();
                    print(webdata);
                  }
                }
              },
              child: Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    Colors.black,
                    Color(0xFF0D47A1),
                    Colors.black,
                  ]
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text('Click to Get Stream of data ' ,
              style: TextStyle(fontSize: 25 , color: Colors.white)),
            ),),
              Container(
                 margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [
        //0.1,
        0.4,
        0.6,
        0.9
      ] ,
    colors: [
     // Colors.yellow,
      Colors.red[900],
      Colors.purple[600],
      Colors.deepPurple[900],
    ]),),
    child: Text( string ?? "output is coming .." ,
              style: TextStyle(fontSize: 15 ,
               color: Colors.white ,
                fontWeight: FontWeight.bold)),
               ),
               HomePage(),    
                 ],
              ),
            ),
          );
        },
      ),
    );

  }
}