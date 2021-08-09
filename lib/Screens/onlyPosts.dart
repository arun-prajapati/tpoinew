import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/widgets/MajorPost.dart';

class OnlyPosts extends StatefulWidget {

  List<Posts> posts;
  OnlyPosts({this.posts});

  @override
  _OnlyPostsState createState() => _OnlyPostsState();
}

class _OnlyPostsState extends State<OnlyPosts> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
        itemCount: widget.posts.length
        ,itemBuilder: (context,index){
      return index==0?MajorPost(posts: widget.posts[index],):MinorPost(widget.posts[index]);
    });
  }
}
