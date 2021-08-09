import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:morbiupdate /Screens/BookMarkPage.dart';
import 'package:morbimirror/Screens/SearchPage.dart';
import 'package:morbimirror/Screens/Splash_Screen.dart';
import 'package:morbimirror/Screens/StaticPageDisplay.dart';
import 'package:morbimirror/test.dart';
import 'package:morbimirror/testing.dart';
import 'Screens/BookMarkPage.dart';
import 'Screens/Category_News.dart';
import 'Screens/Drawer_Category.dart';
import 'Screens/HomeNewsMainPage.dart';
import 'Screens/Homepage_New.dart';
import 'Screens/test.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


 main() async {
   HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'The Press of INDIA',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:splashscreen(),
      routes: {

        'home':(context)=>homepage(),
        'categorynews':(context)=>CategoryNews(),
        'Homenewspagemain':(context)=>Newsmainpage(),
        'search':(context)=>searching(),
        'drawer_category':(context)=>News_category_drawer(),
        'test':(context)=>testing(),
        'staticPage':(context)=>StaticPageDisplay(),
        'bookmark':(context)=>BookmarkPage()


      },
    );
  }
}


