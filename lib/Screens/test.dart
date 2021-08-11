/*
import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Posts.dart';

class MajorPost extends StatelessWidget {

  Posts posts;


  MajorPost({this.posts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: GestureDetector(
        onTap: (){
          Global.activePost = posts;
          Navigator.of(context).pushNamed('Homenewspagemain');
        },
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, position) {
            return Container(
              width: 400,
              height: 200,
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: new DecorationImage(
                    image: posts.featuredMedia.medium!=null?NetworkImage(posts.featuredMedia.medium):Text("No data"),
                    fit: BoxFit.cover,
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Spacer(flex: 2,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(

                              gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Colors.transparent,Colors.black])
                          ),

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 15,10),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 35,),
                                */
/*   Customtextheader(title: "Morbi",
                              titleclr: staticWhite,
                              bgcolor: Colors.black,),
                            SizedBox(height: 5,),*/ /*

                                customtext(title: posts.title.rendered,
                                  titleclr: staticWhite,),
                                SizedBox(height: 5,),
                                Text(MyDate(posts.date),
                                  style: TextStyle(
                                      color: staticWhite,fontSize: 10
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}*/




