import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:morbimirror/Global/Global.dart';
import 'package:http/http.dart' as http;
import 'package:morbimirror/Models/advertisment.dart';

import 'All_URLS.dart';


Future getAddData() async {
//calling api

  await http.get(Uri.parse('${BaseURL}wp-json/wp/v2/get_add?position=header'),
  ).then((res){

    print(res.body);
    print("KKKKK");
String content;
    var advertiseList = jsonDecode(res.body);

    print(advertiseList['content']);
    Global.advertisementList = advertiseList['content'];

    print("KKKKMMMM");
    //print(advertiseList);
    /*Global.adList = (advertiseList as List).map((data)=>Advertisment.fromJson(data)).toList();
    print(Global.adList.length);*/

  });

}