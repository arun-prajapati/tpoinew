import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:morbimirror/ApiCall/Category_api.dart';
import 'package:morbimirror/ApiCall/staticPageContent.dart';
import 'package:morbimirror/BookMark/bookMark.dart';



class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  startTime() async {
    readBookMark();
    getPrivacyPage();
    getAboutUs();
    getFaq();
    getCategories();
    await getMenu();
   var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);

  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('home');
  }
  void initState() {
    getToken();
    startTime();
    super.initState();

  }


  getToken() async {



    String token = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.instance.subscribeToTopic('News');
    print(token);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.png',height: 200,width: 200,)
          ],
        ),
      ),
    );
  }
}
