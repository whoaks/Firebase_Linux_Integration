import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  Widget build(BuildContext context) {

      return Center(
        child: Container(
          margin: EdgeInsets.only(top:10 , bottom:20),
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "login");
            },
            padding: EdgeInsets.all(0),
            child: Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    
                  Colors.black ,
                  Color(0xFF0D47A1),
                  Colors.black
                  ]
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text("Click to LOG-IN" ,
              style: TextStyle(fontSize: 25 , color: Colors.white , fontWeight: FontWeight.bold)),
            ),
          ) ,
        ),
      );

  }
}

class SignupButton extends StatelessWidget {
  Widget build(BuildContext context) {

      return Center(
        child: Container(
          margin: EdgeInsets.only(top:10 , bottom:20),
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "signup");
            },
            padding: EdgeInsets.all(0),
            child: Container(
              decoration:const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    
                  Colors.black ,
                  Color(0xFF0D47A1),
                  Colors.black
                  ]
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text("Click to SIGN-UP" ,
              style: TextStyle(fontSize: 25 , color: Colors.white , fontWeight: FontWeight.bold)),
            ),
          ) ,
        ),
      );

  }
}