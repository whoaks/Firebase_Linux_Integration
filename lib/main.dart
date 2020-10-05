import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ui/homepage.dart';
import 'ui/login.dart';
import 'ui/signup.dart';
import 'ui/chat.dart';

var fs;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

fget() async {
  var d= await fs.collection('mydb').get();
  for (var i in d.docs) {
    print(i.data());
  }
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {

 /*   MyHome() {
      return Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
             /*   fs.collection('mydb').add(
                  {
                    'name': "Akash Pandey" ,
                    'age' : "21" ,
                  }
                ); */
                print('pushed');
              },
              child: Text('push'),
            ) ,
            RaisedButton(
              onPressed: () {
          //    fget() ;
                print('pulled');
              },
              child: Text('pull'),
            )
          ],
        ),
      );
    } */
    fs=FirebaseFirestore.instance;
    return MaterialApp(
   //   home: MyHome(),
      initialRoute: "home",
      routes: {
        "home": (context) => Home() , 
        "signup" : (context) => Signup() ,
        "login" : (context) => Login() ,
        "chat" : (context) => Chat() ,
      },
      debugShowCheckedModeBanner: false,
    );

  }
}