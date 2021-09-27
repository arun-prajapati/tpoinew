import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'package:morbimirror/BookMark/bookMark.dart';
import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/Customdrawer.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/widgets/MajorPost.dart';
import 'package:morbimirror/widgets/PageContent.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Newsmainpage extends StatefulWidget {
  @override
  _NewsmainpageState createState() => _NewsmainpageState();
}

class _NewsmainpageState extends State<Newsmainpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List _imageFile;
  List<Posts> postsList;
  String urlLink = "https://thepressofindia.com/wp-json/wp/v2/posts";
  List<List<Posts>> myPostsList = new List();
  List<Category> myCategories = new List();
  List<Posts> myPosts = new List();

  List<Posts> posts;

  String catId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Share.share(
              "${Global.activePost.excerpt.rendered}\n${Global.activePost.link}\n\nhttps://play.google.com/store/apps/details?id=com.thepressofindia",
              subject: "Check Out Latest News");
          print("share work");
        },
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Image.asset('assets/images/shareF.png',
                    fit: BoxFit.contain)),
            Expanded(
                child: Image.asset('assets/images/shareW.png',
                    fit: BoxFit.contain)),
            Expanded(
                child: Image.asset('assets/images/shareT.png',
                    fit: BoxFit.contain)),
            //Expanded(child: Image.asset('assets/images/shareT.png'))
          ],
        ),
      ),
      //drawer: CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                actions: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 6),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomAppBarWithHeart(
                          save: () {
                            screenshotController
                                .capture()
                                .then((Uint8List image) async {
                              DateTime ketF = new DateTime.now();
                              String baru =
                                  "${ketF.year}${ketF.month}${ketF.day}";

                              int rand = new Random().nextInt(100000);

                              print("sdadad");
                              if (image != null) {
                                final directory =
                                    await getExternalStorageDirectory();
                                final imagePath =
                                    await File('${directory.path}/image.png')
                                        .create();
                                await imagePath.writeAsBytes(image);

                                final myImagePath =
                                    '${directory.path}/MyImages';
                                final myImgDir =
                                    await new Directory(myImagePath).create();
                                var kompresimg = new File(
                                    "$myImagePath/image_$baru$rand.jpg")
                                  ..writeAsBytesSync(image);

                                print(kompresimg);
                                print(myImgDir);
                                print(imagePath);
                                GallerySaver.saveImage(kompresimg.path)
                                    .then((bool success) {
                                  Fluttertoast.showToast(
                                      msg: "Post Saved in picture folder",
                                      fontSize: 15,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.green);
                                  setState(() {
                                    print("SAVED");
                                  });
                                });

                                /// Share Plugin
                                //await Share.shareFiles([imagePath.path]);

                              }
                              setState(() {
                                _imageFile = image;
                                print(_imageFile);
                              });
                            }).catchError((onError) {
                              print(onError);
                            });

                            setState(() {});
                          },
                          onFav: () {
                            if (Global.bookMarkPosts
                                .contains(Global.activePost)) {
                              removeBookMark(Global.activePost);
                            } else {
                              SaveBookMark(Global.activePost);
                            }

                            setState(() {});
                          },
                          logoimg: 'assets/images/logo.png',
                          clickonmenuicon: () {
                            Navigator.of(context).pop();
                          },
                          clickonsearchicon: () {
                            Share.share(
                                "${Global.activePost.excerpt.rendered}\n${Global.activePost.link}\n\nhttps://play.google.com/store/apps/details?id=com.vgotweb.thepressofindia");
                          },
                        ),
                      ),
                    ),
                  ),
                ],
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Image.network(
                      Global.activePost.featuredMedia.medium,
                      fit: BoxFit.cover,
                    ))),
          ];
        },
        body: SingleChildScrollView(
          child: Screenshot(
            controller: screenshotController,
            child: Container(
              color: staticWhite,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          /* Stack(children: [


                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .3,
                            decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(0)),
                                image: new DecorationImage(
                                  image: NetworkImage(
                                      Global.activePost.featuredMedia.medium),
                                  fit: BoxFit.cover,
                                )),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Spacer(
                                  flex: 2,
                                ),
                              ],
                            ),
                          ),

                        ],

                        ),*/

                          SizedBox(
                            height: 5,
                          ),

                          //after image part
                          Padding(
                            padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Posted on -",
                                      style:
                                          TextStyle(color: Color(0xff696969)),
                                    ),
                                    Text(
                                      MyDate(Global.activePost.date),
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "- by Admin",
                                      style:
                                          TextStyle(color: Color(0xff696969)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  Global.activePost.title.rendered
                                      .replaceAll("&#8211", ""),
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xff696969),
                                      fontFamily: 'Montserrat-Black'),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  color: Colors.black,
                                  height: 0.5,
                                  thickness: 0.3,
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                /*  Row(
                              children: [
                                Text(
                                  "The Press of INDIA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: staticBlue),
                                ),
                                Spacer(),

                              ],
                            ),*/
                                /* SizedBox(
                              height: 10,
                            ),*/
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      new Html(
                                        onLinkTap: (String url,
                                            RenderContext context,
                                            Map<String, String> attributes,
                                            element) async {
                                          await launch(url);
                                        },
                                        data: Global
                                                .activePost.content.rendered ??
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,\n \n and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                        style: {
                                          "p": Style(
                                              textAlign: TextAlign.left,
                                              fontSize: FontSize.large),
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "You might also like",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              )
                          ),
                        SizedBox(height: 20,),
                      /*  Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,

                          child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                //physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: Global.categoryPosts.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(onTap: (){
                                    Global.activeCategory = posts;
                                    Navigator.of(context).pushNamed('Homenewspagemain');
                                  },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * .4,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context).size.width * .4,
                                                height: MediaQuery.of(context).size.width * .4,
                                                decoration: new BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius: BorderRadius.circular(3),
                                                    image: new DecorationImage(
                                                      image: Global.activeCategory[index].featuredMedia.medium != null ?NetworkImage(
                                                        Global.activeCategory[index].featuredMedia.medium):Text("No Data"),
                                                      fit: BoxFit.cover,
                                                    ))),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Container(
                                                height: MediaQuery.of(context).size.width * .2,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                        child:  Global.activeCategory[index].title.rendered != null ?Text(
                                                        Global.activeCategory[index].title.rendered,
                                                          textAlign: TextAlign.left,
                                                          overflow: TextOverflow.clip,
                                                          style: TextStyle(height: 1.3,
                                                            color:Color(0xff696969),
                                                          ),
                                                        ):Text("No Data")),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );

                                }),
                        ),*/
                        ],
                      ),

                      /*  Container(width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.2),
                                Colors.black12.withOpacity(0.2),
                                Colors.black26.withOpacity(0.1),
                                Colors.white.withOpacity(0.2)
                              ]
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 6),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomAppBarWithHeart(

                            save: (){

                              screenshotController.capture().then((Uint8List image) async{
                                DateTime ketF = new DateTime.now();
                                String baru = "${ketF.year}${ketF.month}${ketF.day}";

                                int rand = new Random().nextInt(100000);

                                print("sdadad");
                                if (image != null) {
                                  final directory = await getExternalStorageDirectory();
                                  final imagePath = await File('${directory.path}/image.png').create();
                                  await imagePath.writeAsBytes(image);

                                  final myImagePath = '${directory.path}/MyImages' ;
                                  final myImgDir = await new Directory(myImagePath).create();
                                  var kompresimg = new File("$myImagePath/image_$baru$rand.jpg")
                                    ..writeAsBytesSync(image);

                                  print(kompresimg);
                                  print(myImgDir);
                                  print(imagePath);
                                  GallerySaver.saveImage(kompresimg.path).then((bool success) {
                                    Fluttertoast.showToast(msg: "Post Saved in picture folder",
                                        fontSize: 15,textColor: Colors.white,backgroundColor: Colors.green);
                                    setState(() {
                                      print("SAVED");
                                    });
                                  });
                                  /// Share Plugin
                                  //await Share.shareFiles([imagePath.path]);

                                }
                                setState(() {
                                  _imageFile = image;
                                  print(_imageFile);
                                });
                              }).catchError((onError) {
                                print(onError);
                              });

                              setState(() {

                              });

                            },

                            onFav: () {

                              if (Global.bookMarkPosts.contains(Global.activePost)) {
                                removeBookMark(Global.activePost);
                              } else {
                                SaveBookMark(Global.activePost);
                              }

                              setState(() {});
                            },
                            logoimg: 'assets/images/logo.png',
                            clickonmenuicon: () {
                              Navigator.of(context).pop();
                            },
                            clickonsearchicon: () {
                              Share.share(
                                  "${Global.activePost.excerpt.rendered}\n${Global.activePost.link}\n\nhttps://play.google.com/store/apps/details?id=com.vgotweb.thepressofindia");
                            },
                          ),
                        ),
                      ),
                    ),*/
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /*  customBottombar(
                    img: 'assets/images/logo.png',
                    title:
                    "મોરબીવાસીઓ તમામ વિસ્તારોમની સચોટ અને તટસ્થ માહિતી હર પળ ઘરે બેઠા મળી રહે એ માટે મોરબીવાસીઓનું પોતાનું THE PRESS OF INDIA શરૂ કરવાનો અમારો ધ્યેય છે જે ધ્યેય આપ સૌ મિત્રોના સાથ સહકારથી શ્રેષ્ઠતા સાથે કામયાબીના શિખરો સર કરશે જેના માટે મોરબી ગૌરવ અનુભવશે.",
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
