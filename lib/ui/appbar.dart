import 'package:flutter/material.dart';
import 'url.dart';
import 'homepage.dart';

  Title(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 25,
      color: Colors.black ,
      fontWeight: FontWeight.bold ,
      ) ,
    );
}

 MyAppBar(text) {
    return AppBar(
      backgroundColor: Colors.cyanAccent,
      title: Title(text),
      leading: Leading_Icon(),
      actions: <Widget>[
        Linkedin() ,
      ],
    );
  } 