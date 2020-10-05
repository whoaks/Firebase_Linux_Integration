import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import 'backtohomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart'as  http;

class Signup extends StatefulWidget {
  @override
  _MySignupState createState() => _MySignupState();
}

class _MySignupState extends State<Signup> {
  var cmd;
  var webdata;

  var auth=FirebaseAuth.instance;

  String email;
  String password;

  var fs1=FirebaseFirestore.instance;


 myweb(email , password) async {
    var d= fs1.collection("mydb").add(
      {
        'email' : '$email' ,
        'password': '$password',
      }
    );
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
                    color: Colors.amber,
              padding: EdgeInsets.all(10),
              child: Text('Sign-Up Page',
              style: TextStyle(
                fontSize: 20 ,
                color: Colors.black , 
                fontWeight: FontWeight.bold,
            ),
              ),
                  ),
            Card(
                 child: TextField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
               hintText: 'Enter Email Address',
               hoverColor: Colors.blue , 
                icon: Icon(Icons.email , size: 40,) ,
                 ),
                onChanged: (value) {
                    email = value;
                    print(email);
                  },
                ),
              ),
              Card(
                 child: TextField(
                autocorrect: false,
                obscureText: true,
              decoration: InputDecoration(
               hintText: 'Enter Password',
               hoverColor: Colors.blue , 
                ),
                onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              FlatButton(
                  onPressed: () async {
             //     myweb(email , password);
             try{
               var user= await auth.createUserWithEmailAndPassword(
                 email: email, 
                 password: password ,
                 );
                 print(email);
                 print(password);
                 print(user);

                 if (user.additionalUserInfo.isNewUser == true) {
                    Navigator.pushNamed(context, "chat");
                  }
             }
             catch(e) {
               print(e);
             }

           //  print(password);
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
              padding: EdgeInsets.all(15),
              child: Text('Sign-up' ,
              style: TextStyle(fontSize: 30 , color: Colors.white)),
            ),),
             
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
