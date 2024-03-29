import 'dart:convert';
import 'dart:developer';

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

class TestingNew extends StatefulWidget {
  int? id;
  int? index;
  String? catId;

  TestingNew({this.id, this.index, this.catId, this.name});

  String? name;

  @override
  _TestingNewState createState() => _TestingNewState();
}

class _TestingNewState extends State<TestingNew> {
  List<Posts>? posts = [];

  @override
  void initState() {
    posts = Global.mainCategory![0].posts!.sublist(0, Global.mainCategory![0].posts!.length < 4 ? Global.mainCategory![0].posts!.length : 4);

    // TODO: implement initState
    super.initState();

//getAllFeaturedPosts();
  }

  getAllFeaturedPosts() {
    Global.mainCategory!.forEach((element) {
      if (element.posts!.isNotEmpty && element.posts!.length > 2) {
        posts!.add(element.posts![0]);
        posts!.add(element.posts![1]);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("------------------------------------");

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (posts != null && posts!.isNotEmpty) CategoryContent(posts: posts, catID: Global.mainCategory![0].parentCatId),
            SizedBox(height: 3),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Global.mainCategory!.length,
                itemBuilder: (context, index) {
                  print(index);
                  print(jsonEncode(Global.mainCategory![index]));

                  return Global.mainCategory![index].category!.isNotEmpty || Global.mainCategory![index].posts!.isNotEmpty
                      ? PostForCategory(
                          postsList: Global.mainCategory![index].posts,
                          category: Global.mainCategory![index],
                          categoryTitle: Global.mainCategory![index].parentCatName,
                          catId: Global.mainCategory![index].parentCatId.toString(),
                        )
                      : SizedBox(); /* Text("${Global.mainCategory![index].parentCatId } ${Global.mainCategory![index].posts!.length}");*/
                }),
          ],
        ),
      ),
    );
  }
}
