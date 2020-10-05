import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


launchurl() async {
  const url = 'https://www.linkedin.com/in/akash-pandey-0687281a3/';
  if (await canLaunch(url)) {
    await launch(url);
  }
  else {
    throw 'Sorry , Not able to launch $url';
  }
}

Linkedin () {

  return IconButton(
    icon: Icon(
      FontAwesomeIcons.linkedin ,
      color: Colors.black,
      size: 40,
      ),
      hoverColor: Colors.purple[900],
      splashColor: Colors.white,
      onPressed: () {
      launchurl();
    },
  );

}

launchurl2() async {
 // const url = 'https://console.firebase.google.com/u/0/project/aksfirebase-12345/firestore/data~2Fwhoaks';
  const url = 'https://console.firebase.google.com/project/aksfirebase2/firestore/data~2Fmydb';
   if (await canLaunch(url)) {
    await launch(url);
  }
  else {
    throw 'Sorry , Not able to launch $url';
  }
}

Firestore_url() {

   return FlatButton(
                  onPressed: () {
                 launchurl2();
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
              child: Text('Go to Firestore GCP Cloud' ,
              style: TextStyle(fontSize: 25
           , color: Colors.white)),
            ),);
}
