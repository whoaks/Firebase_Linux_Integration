import 'package:flutter/material.dart';


dec() {
  return  Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                   // Color(0xFF0D47A1),
                  //  Color(0xFF1976D2),
                    Colors.black,
                    Color(0xFF0D47A1),
                    Colors.black
                  ]
                ),
              ),
              padding: EdgeInsets.all(15),
              child: Text('Back to Home Page' ,
              style: TextStyle(fontSize: 25 , color: Colors.white)),
            );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, "home");
      },
      padding: EdgeInsets.all(0),
      child: dec(),
      );
  }
}