import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Topic(topic_name , size , height) {
  return Container(
    margin: EdgeInsets.only(top: 20 , bottom: 15 , left: 10 , right: 20),
    height: height,
   // width: 300,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      gradient: LinearGradient(

        end: Alignment.topRight,
        stops: [
          0.1,
          0.4,
          0.6,
          0.9
        ] ,
        begin: Alignment.bottomLeft,
        colors: [
        //Colors.deepOrange,
          //Colors.red[800],
          Colors.indigo[900],
          Colors.black,

        //Colors.lime[600],
      //Color(0xFF42A5F5),
          Colors.green[900],
          Colors.indigo[900],
      //Colors.amber
        ]       
      ) ,
    ),
     child: Center(
      child: Text(topic_name,
                  style: TextStyle(fontSize: size , color: Colors.white ,fontWeight: FontWeight.bold)),
    ), 
  );
}