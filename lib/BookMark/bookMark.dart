import 'dart:convert';

import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:shared_preferences/shared_preferences.dart';

SaveBookMark( Posts post ) async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Global.bookMarkPosts.add(post);
  //print(jsonEncode(Global.bookMarkPosts));
  sharedPreferences.setString('posts',jsonEncode(Global.bookMarkPosts) );



 }


 removeBookMark(Posts post)  async {

   Global.bookMarkPosts.remove(post);
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.setString('posts',jsonEncode(Global.bookMarkPosts) );

 }


readBookMark()  async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  String posts = sharedPreferences.get('posts');


  print("____________---------__________------____---_-_----_-_-_-_--__--");
  print("$posts");

  if(posts!=null && posts!=""){
    var parsedText = jsonDecode(posts);
    Global.bookMarkPosts = (parsedText as List).map((e) => Posts.fromJson(e)).toList();
  }

}

