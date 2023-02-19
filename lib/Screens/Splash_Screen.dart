import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:morbimirror/ApiCall/Advertisement.dart';

import 'dart:async';

import 'package:morbimirror/ApiCall/Category_api.dart';
import 'package:morbimirror/ApiCall/staticPageContent.dart';
import 'package:morbimirror/BookMark/bookMark.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/Page.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Global/Global.dart';
import '../Models/appdata.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  startTime() async {
  //   getLocalData();
    await readBookMark();
    await getPrivacyPage();
    await getAboutUs();
    await getFaq();
    await getCategories();
    await getAddData();

    
   // await getMenu();
    var _duration = new Duration(milliseconds: 5);
    print("Global.alldata ${Global.allData}");
    return new Timer(_duration, navigationPage);
  }

  getLocalData() async {
    SharedPreferences? sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString("data");
    if(data!=null)
    Global.allData = (jsonDecode(data) as List).map((e) {
      if(e==null){
        return null;
      }else{
        return AllData.fromJson(e);
      }

    } ).toList();



    String? myPostsList = sharedPreferences.getString("myPostsList");
    if(myPostsList!=null){
      print("PPPPPPPPPPPPPP");
      Global.allData![2]?.myPostsList=((jsonDecode(myPostsList) as List).map((e) => (e as List).map((g) => Posts.fromJson(g)).toList()).toList());
    }

    String? myPosts = sharedPreferences.getString("myPosts");
    if(myPosts!=null){
      print("XXXXXXXXXXXX");


      Global.allData![2]?.myPosts=(jsonDecode(myPosts) as List ).map((g) => Posts.fromJson(g)).toList().toList();
    }
    String? myCategories = sharedPreferences.getString("myCategories");
    if(myCategories!=null){
      print("NNNNNNNNNNN");

      Global.allData![2]?.myCategories=(jsonDecode(myCategories) as List ).map((g) => Category.fromJson(g)).toList();
    }


    print("++++++++++++++++++++++++++ !!!");
    log(jsonEncode(Global.allData![2]));
    print(Global.allData!.length);


  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('home');
  }

  /*saveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String keyData = jsonEncode(Global.allData);
    print("mydata ::::::::::: $keyData");
    prefs.setString('key', Global.allData.toString());
  }*/

/*  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('key');

    print("keyValue :::::::::::: $stringValue");
    if (stringValue != null) {
      var s = jsonDecode(stringValue);
      //print("RRRRRRRRRRRRRRRRRRRRRRRRR ${s[2]["myCategories"]}");
      Global.allData = (s as List).map((e) => AllData.fromJson(e)).toList();
     // print("Global.allData[2] ${Global.allData[2].myPostsList[0][0].title}");
      print("data found");
    } else {
      print("data not found");
    }

    setState(() {});
  }*/

  void initState() {
    getToken();
    startTime();
    //getValue();
    //getLocalData();
    super.initState();

  }

  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
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
            Image.asset(
              'assets/images/logo.png',
              height: 110,
              width: 110,
            )
          ],
        ),
      ),
    );
  }
}
