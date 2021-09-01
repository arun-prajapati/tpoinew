import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/ApiCall/Category_api.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/Models/appdata.dart';
import 'package:morbimirror/Screens/onlyPosts.dart';
import 'package:morbimirror/widgets/MajorPost.dart';
import 'package:morbimirror/widgets/PageContent.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ApiCall/Post_api.dart';
import 'Global/Global.dart';

class Testing extends StatefulWidget {
  int id;
  int index;
  String catId;

  Testing({this.id, this.index, this.catId, this.name});

  String name;

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  bool isLoading = true;
  List<Category> myCategories = new List();
  List<List<Posts>> myPostsList = new List();
  List<Posts> myPosts = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCat();
  }

  getCat() async {
    print("Pulling Categories for id ${widget.id} ::: ${widget.name}");

    if (Global.allData[widget.index] == null) {
      myCategories.clear();
      myPostsList.clear();
      myCategories = await getCategoriesFromURL(
          Url: urlForTopBarSubCategories + widget.id.toString());

      if (myCategories.isEmpty) {
        print("Pulling Posts for id ${widget.id}");
        myPosts = await getPosts(
            url:
                "${BaseURL}wp-json/wp/v2/posts?status=publish&order=desc&per_page=5&page=1&categories=${widget.id}");

        print("---- GOING FOR POSTS ------");
        print(myPosts.length);
      } else {
        for (int i = 0; i < myCategories.length; i++) {
          print(
              "Pulling Categories for id ${widget.id} subcat id ${myCategories[i].id}");

          myPostsList.add(await getPosts(
              url:
                  "${BaseURL}wp-json/wp/v2/posts?status=publish&order=desc&per_page=5&page=1&categories=${myCategories[i].id}"));
        }
        print("Pulling Posts for id ${widget.id}");
        myPosts = await getPosts(
            url:
                "${BaseURL}wp-json/wp/v2/posts?status=publish&order=desc&per_page=5&page=1&categories=${widget.id}");
      }

      isLoading = false;

      print("Category List Length : " + myCategories.length.toString());
      print("PostList List Length : " + myPostsList.length.toString());
      print("Post Length : " + myPosts.length.toString());

      Global.allData[widget.index] = AllData(
          myCategories: myCategories,
          myPosts: myPosts,
          myPostsList: myPostsList);
      print("GGGGGGGGGGGGG ${Global.allData[2]}");
      SharedPreferences pref = await SharedPreferences.getInstance();
      String abc = jsonEncode(Global.allData);
      print("String ::::::::${abc}");
      pref.setString("key", "$abc");
      String get = pref.getString("key");
      print("get:::::::::: $get");

      setState(() {});
    } else {
      myPostsList = Global.allData[widget.index].myPostsList;
      myPosts = Global.allData[widget.index].myPosts;
      myCategories = Global.allData[widget.index].myCategories;
      print("MyCategories ::::::::: $myCategories");
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            ))
          : myCategories.isEmpty
              ? myPosts.isEmpty && myPostsList.isEmpty
                  ? Center(
                      child: Text("No News Available..."),
                    )
                  : OnlyPosts(posts: myPosts)
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      CategoryContent(posts: myPosts),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: myPostsList.length,
                          itemBuilder: (context, index) {
                            return myPostsList[index].length > 2
                                ? PostForCategory(
                                    postsList: myPostsList[index],
                                    categoryTitle: myCategories[index].name,
                                    catId: myCategories[index].id.toString(),
                                  )
                                : SizedBox();
                          }),
                    ],
                  ),
                ),
    );
  }
}
