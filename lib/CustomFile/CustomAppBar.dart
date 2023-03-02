import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:morbimirror/CustomFile/Common.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:screenshot/screenshot.dart';

import 'dart:ui' as ui;
import '../testing.dart';
import 'CustomColorsFile.dart';
import 'package:morbimirror/Screens/Homepage_New.dart';

class CustomAppBar extends StatelessWidget {
  final String? logoimg;
  final VoidCallback? clickonmenuicon;
  final VoidCallback? clickonsearchicon;

  CustomAppBar({
    this.clickonmenuicon,
    this.clickonsearchicon,
    this.logoimg,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> myTabBars = [];

   /* GetPageData() {
      for (int i = 0; i < Global.menu.length; i++) {
        myTabBars.add(Testing(
          id: int.parse(Global.menu[i].objectId),
          index: i,
          catId: Global.menu[i].objectId,
        ));
      }
    }*/

    return Container(
      color: Color(0xff222222),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                  onTap: () {

                      clickonmenuicon!();


                  },
                  child: Icon(
                    Icons.menu,
                    color: staticWhite,
                  )),
              Icon(
                Icons.menu,
                color: Colors.transparent,
              ),
           /*   Opacity(
                opacity: 0,
                child: Container(
                    child: Icon(
                  Icons.search,
                  color: staticWhite,
                )),
              ),*/
              Spacer(),

                Container(
                child: Image.asset(logoimg!, height: 51,
                ),
              ),

              Spacer(),
              Opacity(
                opacity: clickonsearchicon == null ? 0 : 1,
                child: GestureDetector(
                    onTap: clickonsearchicon ?? () {},
                    child: Icon(
                      Icons.share,
                      color: staticWhite,
                    )),
              ),
            /*  GestureDetector(
                onTap: () {
                  GetPageData();
                  Show_toast_Now("Data Refreshing", Colors.green);
                  print("refresh data");
                },
                child: Container(
                    child: Icon(
                  Icons.refresh,
                  color: staticWhite,
                )),
              ),
              SizedBox(
                width: 12,
              ),*/
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'search');
                  print("search");
                },
                child: Container(
                    child: Icon(
                  Icons.search,
                  color: staticWhite,
                )),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBarWithHeart extends StatefulWidget {
  final String? logoimg;
  final VoidCallback? clickonmenuicon;
  final VoidCallback? clickonsearchicon;
  final VoidCallback? onFav;
final VoidCallback? save;

  CustomAppBarWithHeart(
      {this.clickonmenuicon, this.clickonsearchicon, this.logoimg, this.onFav,this.save});


  @override
  _CustomAppBarWithHeartState createState() => _CustomAppBarWithHeartState();
}

class _CustomAppBarWithHeartState extends State<CustomAppBarWithHeart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  widget.clickonmenuicon!();
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: staticWhite,
                )),
            Opacity(
              opacity: 0,
              child: Icon(
                Icons.favorite_border,
                color: staticWhite,
              ),
            ),
            SizedBox(width: 10),
            Spacer(),
            /*  Container(
              child: Image.asset(widget.logoimg, height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),*/

            Spacer(),
            GestureDetector(
                onTap: widget.onFav ?? () {},
                child: Icon(
                  Global.bookMarkPosts.contains(Global.activePost)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.transparent,
                )),
            SizedBox(width: 15),
            Opacity(
              opacity: widget.clickonsearchicon == null ? 0 : 1,
              child: GestureDetector(
                  onTap: widget.clickonsearchicon ?? () {},
                  child: Icon(
                    Icons.share,
                    color: staticWhite,
                  )),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
                onTap:widget.save,
                child: Icon(
                  Icons.save,
                  color: staticWhite,
                )),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
