import 'package:firebase_app2/ui/buttons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'url.dart';
import 'appbar.dart';
import 'topic.dart';
  

Leading_Icon() {
  return Image.network(
    'https://raw.githubusercontent.com/whoaks/Firebase_Integration_Flutter/master/firebase.JPG',
    );
}

class Home  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Linux - Firebase Chat App') , 
      backgroundColor: Colors.red[200],
      body: Column(
        children: <Widget>[
          Topic('Task3 - Chat Box \nLinux Integration Firebase using Sign-up and Login Page' , 25.0 , 200.0) ,
          SignupButton(),
          LoginButton(),
          Firestore_url(),
          Topic('Created By - \n \t   \t    \t   Akash Pandey ' , 25.0 , 100.0) ,
        ],
      )
    );
  }
}