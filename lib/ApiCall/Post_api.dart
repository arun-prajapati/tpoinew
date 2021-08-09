import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morbimirror/Models/Posts.dart';



Future<List<Posts>> getPosts({String url }) async {
//calling api
  List<Posts> Listofpost = new List();
    await  http.get(Uri.parse(url)).then((res){
    print(res.body);
    var Storedataofpost = jsonDecode(res.body);
    print(Storedataofpost);
    Listofpost = (Storedataofpost as List).map((data)=>Posts.fromJson(data)).toList();
    print(Listofpost.length);
    print(jsonEncode(Listofpost).toString());
  });

return Listofpost;

}