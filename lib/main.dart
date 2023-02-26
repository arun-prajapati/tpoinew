import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:morbimirror/ApiCall/All_URLS.dart';
//import 'package:morbiupdate /Screens/BookMarkPage.dart';
import 'package:morbimirror/Screens/SearchPage.dart';
import 'package:morbimirror/Screens/Splash_Screen.dart';
import 'package:morbimirror/Screens/StaticPageDisplay.dart';
import 'package:morbimirror/Screens/SubCategoryList.dart';
import 'package:morbimirror/test.dart';
import 'package:morbimirror/testing.dart';
import 'Global/Global.dart';
import 'Screens/BookMarkPage.dart';
import 'Screens/Category_News.dart';
import 'Screens/Drawer_Category.dart';
import 'Screens/HomeNewsMainPage.dart';
import 'Screens/Homepage_New.dart';
import 'Screens/test.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


 main() async {

  getAdvertisement();
   HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await DatabaseHelper.getAllCat();
  runApp(MyApp());
}


getAdvertisement(){
  getAdvertisementData();
  getAdvertisementCustomData();
}

getAdvertisementData(){
//calling api

  http.get(Uri.parse('${BaseURL}wp-json/wp/v2/get_add?position=header'),
  ).then((res){

    print(res.body);
    print("KKKKK");
    String content;
    var advertiseList = jsonDecode(res.body);

    print(advertiseList['content']);
    Global.advertisementList = advertiseList['content'];

    print("KKKKMMMM");




  });

}
getAdvertisementCustomData(){
//calling api

  http.get(Uri.parse('${BaseURL}wp-json/wp/v2/get_add?position=custom_ad_1'),
  ).then((res){

    print(res.body);
    print("NNN");
    String content;
    var advertiseCustomList = jsonDecode(res.body);

    print(advertiseCustomList['content']);
    Global.advertisementCustomList = advertiseCustomList['content'];

    print("KKKKMMMM");

  });

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'The Press Of India',
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
        'test':(context)=>Testing(),
        'staticPage':(context)=>StaticPageDisplay(),
        'bookmark':(context)=>BookmarkPage(),
        SubCategoryListPage.route:(context)=>SubCategoryListPage()
      },
    );
  }
}


