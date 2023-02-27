import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morbimirror/ApiCall/All_URLS.dart';

import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Category.dart';



import 'All_URLS.dart';




getNewsData(){
//calling api

  http.get(Uri.parse('${BaseURL}wp-json/wp/v2/categories'),
    ).then((res){

    print(res.body);

    var Storedataoflist = jsonDecode(res.body);



    print(Storedataoflist);
    Global.CategoryList = (Storedataoflist as List).map((data)=>Category.fromJson(data)).toList();
    print(Global.CategoryList!.length);
    print(jsonEncode(Global.CategoryList).toString());
  });

}

/*getMenu() async {

 await http.get(Uri.parse(urlForMenu),
  ).then((res){

    print(res.body);
    var Storedataoflist = jsonDecode(res.body);
    Global.menu = (Storedataoflist as List).map((data)=>Menu.fromJson(data)).toList();

    Global.menu.removeAt(0);
  });


  Global.myTabs.clear();
  Global.categoryContent.clear();
  Global.subCategoryPosts.clear();

  for(int i=0;i<Global.menu.length;i++){
    Global.myTabs.add(
        Tab(
          child: Text(Global.menu[i].title,style: TextStyle(
              color: Colors.red
          ),),
        )
    );

    //Global.allData.add();

   // Global.categoryPosts.add(await getPosts(url: "https://morbimirror.com/wp-json/wp/v2/posts?status=publish&per_page=20&page=1&categories=${Global.menu[i].objectId}"));
  }
}*/


Future getCategories() async {
  await http.get(Uri.parse(urlForTopBarCategories),
  ).then((res){
    //print(res.body);
    var Storedataoflist = jsonDecode(res.body);
   // print(Storedataoflist);
    Global.CategoryList = (Storedataoflist as List).map((data)=>Category.fromJson(data)).toList();
    print(Global.CategoryList!.length);
   // print(jsonEncode(Listofdata).toString());
  });
}

getCategoriesFromURL({String? Url}) async {

  List<Category> CategoryList = [];


  await http.get(Uri.parse(Url!),
  ).then((res){
    //print(res.body);
    var Storedataoflist = jsonDecode(res.body);
    // print(Storedataoflist);
    CategoryList = (Storedataoflist as List).map((data)=>Category.fromJson(data)).toList();

  });
  return CategoryList;
}