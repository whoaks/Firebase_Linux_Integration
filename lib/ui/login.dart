import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import 'backtohomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart'as  http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
class Login extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<Login> {

  var auth=FirebaseAuth.instance;

  String email;
  String password;
  bool spin=false;

  var fs1=FirebaseFirestore.instance;


  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: MyAppBar('Login-Page'),
      body: ModalProgressHUD(
        inAsyncCall: spin,
        color: Colors.red[900],
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                color: Colors.deepPurple,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Card(
                                          child: TextField(
                        autocorrect: false,
                        onChanged: (value) {
                          email=value;
                    //      print(email);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Email" ,
                          hoverColor: Colors.white,
                          fillColor: Colors.amber,
                        ),
                      ),
                    ),
                     Card(
                                            child: TextField(
                         obscureText: true,
                         autocorrect: false,
                        onChanged: (value) {
                          password=value;
                      //    print(password);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Password" ,
                          hoverColor: Colors.white,
                        ),
                    ),
                     ),
                    RaisedButton(
                      onPressed: () async{
                        print('clicked');
                        setState(() {
                          spin=true;
                        });
                        try {
                          var usignin = await auth.signInWithEmailAndPassword(
                            email: email, 
                            password: password ,
                            );
                            print(usignin);
                            if(usignin != null) {
                              Navigator.pushNamed(context, "chat");
                              setState(() {
                                spin=false;
                              });
                            }
                            else {
                              print('Incorrect Credentials');
                              spin=false;
                            }
                        }
                        catch(e) {
                          print(e);
                        }
                      },
                      child: Text('Login'),
                    )
                  ],
                ),
              ),
            ) ,
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, "home");
              },
              child: Text('Back to Home Page'),
            )
            ],
        )
      ),
    );

  }
}
