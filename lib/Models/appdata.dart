import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/Posts.dart';

import 'Category.dart';
import 'Category.dart';

class AllData {
  AllData({
    this.myCategories,
    this.myPostsList,
    this.myPosts,
  });

  List<Category> myCategories;
  List<List<Posts>> myPostsList;
  List<Posts> myPosts;

  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
    myCategories: List<Category>.from(json["myCategories"].map((x) => Category.fromJson(x))),
    myPostsList: List<List<Posts>>.from(json["myPostsList"].map((x) => List<Posts>.from(x.map((x) => Posts.fromJson(x))))),
    myPosts: List<Posts>.from(json["myPosts"].map((x) => Posts.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "myCategories": List<dynamic>.from(myCategories.map((x) => x.toJson())),
    "myPostsList": List<dynamic>.from(myPostsList.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "myPosts": List<dynamic>.from(myPosts.map((x) => x.toJson())),
  };
}