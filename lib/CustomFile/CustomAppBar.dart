import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:morbimirror/CustomFile/Common.dart';
import 'package:morbimirror/Global/Global.dart';

import 'dart:ui' as ui;
import '../testing.dart';
import 'CustomColorsFile.dart';
import 'package:morbimirror/Screens/Homepage_New.dart';
class CustomAppBar extends StatelessWidget {
  final String logoimg;
  final VoidCallback clickonmenuicon;
  final VoidCallback clickonsearchicon;


  CustomAppBar(
      {this.clickonmenuicon,
        this.clickonsearchicon,
        this.logoimg,
        });

  @override
  Widget build(BuildContext context) {
    List<Widget> myTabBars = new List();

    GetPageData(){
      for(int i =0;i<Global.menu.length;i++){
        myTabBars.add(Testing(id: int.parse(Global.menu[i].objectId),index: i,catId: Global.menu[i].objectId,));
      }
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(width: 20,),

            GestureDetector(onTap: (){
         clickonmenuicon();

            },
                child: Icon(Icons.menu,color: staticBlack,)),
            Opacity(
              opacity: 0,
              child: Container(
                  child: Icon(Icons.search,color: staticBlack,)
              ),
            ),
            SizedBox(width: 10,),
            Opacity(
              opacity: 0,
              child: Container(
                  child: Icon(Icons.refresh,color: staticBlack,)
              ),
            ),
            Spacer(),
            Container(
              child: Image.asset(logoimg, height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),

            Spacer(),
            Opacity(
              opacity:clickonsearchicon==null?0:1,
              child: GestureDetector(
                  onTap: clickonsearchicon??(){

                  },child: Icon(Icons.share,color: staticBlack,)),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'search');
                print("search");
              },
              child: Container(
                  child: Icon(Icons.search,color: staticBlack,)
              ),
            ),



            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                GetPageData();
                Show_toast_Now("Data Refreshing", Colors.green);
                print("refresh data");
              },
              child: Container(
                  child: Icon(Icons.refresh,color: staticBlack,)
              ),
            ),
            SizedBox(width: 20,),

          ],
        ),
      ),
    );
  }
}

class CustomAppBarWithHeart extends StatefulWidget {
  final String logoimg;
  final VoidCallback clickonmenuicon;
  final VoidCallback clickonsearchicon;
  final VoidCallback onFav;


  CustomAppBarWithHeart(
      {this.clickonmenuicon,
        this.clickonsearchicon,
        this.logoimg,
        this.onFav
      });

  @override
  _CustomAppBarWithHeartState createState() => _CustomAppBarWithHeartState();
}

class _CustomAppBarWithHeartState extends State<CustomAppBarWithHeart> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(width: 20,),
            GestureDetector(onTap: (){
              widget.clickonmenuicon();

            },
                child: Icon(Icons.menu,color: staticBlack,)),
            Opacity(
              opacity: 0,
              child: Icon(Icons.favorite_border,color: staticBlack,),
            ),
            SizedBox(width: 10),

            Spacer(),
            Container(
              child: Image.asset(widget.logoimg, height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),

            Spacer(),
            GestureDetector(
                onTap: widget.onFav??(){
                },child: Icon(Global.bookMarkPosts.contains(Global.activePost)? Icons.favorite: Icons.favorite_border,color: staticBlack,)),
            SizedBox(width: 10),
            Opacity(
              opacity:widget.clickonsearchicon==null?0:1,
              child: GestureDetector(
                onTap: widget.clickonsearchicon??(){

                },child: Icon(Icons.share,color: staticBlack,)),
            ),

           /* GestureDetector(onTap: (){

              saveScreen();
            },
                child: Icon(Icons.save)),*/
            SizedBox(width: 20,),

          ],
        ),
      ),
    );
  }
}