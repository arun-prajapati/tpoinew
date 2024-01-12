import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_html/style.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:icons_plus/icons_plus.dart';
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/ApiCall/Post_api.dart';
import 'package:morbimirror/BookMark/bookMark.dart';
import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/widgets/MajorPost.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Newsmainpage extends StatefulWidget {
  @override
  _NewsmainpageState createState() => _NewsmainpageState();
}

class _NewsmainpageState extends State<Newsmainpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScreenshotController screenshotController = ScreenshotController();

  String urlLink = "https://thepressofindia.com/wp-json/wp/v2/posts";

  List<Posts>? posts;

  bool isLoading = true;

  List<Posts> myPostsList1 = [];

  getCategories() async {
    await http
        .get(
      Uri.parse(urlForTopBarCategories),
    )
        .then((res) {
      //print(res.body);
      var Storedataoflist = jsonDecode(res.body);
      // print(Storedataoflist);
      Global.CategoryList = (Storedataoflist as List).map((data) => Category.fromJson(data)).toList();
      print(Global.CategoryList!.length);
      print("///////");
      // print(jsonEncode(Listofdata).toString());
    });
  }

  getPost() async {
    List<Posts> myPostsListAdd = [];
    print("|||||||||| GETTING POSTS FOR ID |||||||||||   ${Global.idFor10Posts}");

    myPostsListAdd = await getPosts(url: "https://thepressofindia.com/wp-json/wp/v2/get_cat_posts/?category=${Global.idFor10Posts}");

    if (myPostsListAdd != null) {
      myPostsList1 = myPostsList1 + myPostsListAdd;
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getPost();
    //getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Share.share(
              /*   ${Global.activePost.excerpt.rendered}\n*/
              //put upper code above of Global.activePost.link for share whole post in generated link
              "${Global.activePost!.link}\n\nhttps://play.google.com/store/apps/details?id=com.thepressofindia",
              subject: "Check Out Latest News");
          print("share work");
        },
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  color: Color(0xff4267B2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesome.square_facebook,
                      color: Colors.white,
                      size: 24,
                    ),
                  )),
            ),
            Expanded(
              child: Container(
                  color: Color(0xff1DA1F2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesome.twitter,
                      color: Colors.white,
                      size: 24,
                    ),
                  )),
            ),
            Expanded(
              child: Container(
                  color: Color(0xff26D367),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesome.whatsapp,
                      color: Colors.white,
                      size: 24,
                    ),
                  )),
            ),

            //Expanded(child: Image.asset('assets/images/shareT.png'))
          ],
        ),
      ),
      //drawer: CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 250.0,
                floating: false,
                pinned: false,
                actions: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 6),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomAppBarWithHeart(
                          save: () {
                            /*screenshotController
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
                                */ /*GallerySaver.saveImage(kompresimg.path)
                                    .then((bool success) {
                                  Fluttertoast.showToast(
                                      msg: "Post Saved in picture folder",
                                      fontSize: 15,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.green);
                                  setState(() {
                                    print("SAVED");
                                  });
                                });*/ /*

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

                            setState(() {});*/
                          },
                          onFav: () {
                            if (Global.bookMarkPosts.contains(Global.activePost)) {
                              removeBookMark(Global.activePost!);
                            } else {
                              SaveBookMark(Global.activePost!);
                            }

                            setState(() {});
                          },
                          logoimg: 'assets/images/logo.png',
                          clickonmenuicon: () {
                            Navigator.of(context).pop();
                          },
                          clickonsearchicon: () {
                            Share.share("${Global.activePost!.postName}\n${Global.activePost!.link}\n\nhttps://play.google.com/store/apps/details?id=com.vgotweb.thepressofindia");
                          },
                        ),
                      ),
                    ),
                  ),
                ],
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Global.activePost!.featuredMedia!.medium == null
                        ? Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            Global.activePost!.featuredMedia!.medium!,
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
                          SizedBox(
                            height: 5,
                          ),

                          //after image part
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        Global.activePost!.postTitle!.replaceAll("&#8211", ""),
                                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Color(0xff696969), fontFamily: 'Montserrat-Black'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "By",
                                            style: TextStyle(color: Color(0xffA0A0A0), fontWeight: FontWeight.normal, fontSize: 10),
                                          ),
                                          Text(
                                            " The Press Of India",
                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
                                          ),
                                          Text(
                                            " - ${Global.activePost!.postDate!}",
                                            style: TextStyle(color: Color(0xffA0A0A0), fontWeight: FontWeight.normal, fontSize: 10),
                                          ),

                                          /*Text(
                                           // MyDate(Global.activePost!.postDate!),
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),*/
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: Colors.grey.shade300, height: 1, thickness: 1, indent: 8, endIndent: 8),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  //color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // new Html(
                                      //   onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, element) async {
                                      //     await launchUrlString(url!);
                                      //   },
                                      //   data: Global.activePost!.postContent ??
                                      //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,\n \n and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                      //   style: {
                                      //     "p": Style(textAlign: TextAlign.left, fontSize: FontSize.large),
                                      //     "img": Style(
                                      //       alignment: Alignment.center,
                                      //       width: Width(MediaQuery.of(context).size.width - 16),
                                      //       textAlign: TextAlign.center,
                                      //       display: Display.block,
                                      //       padding: HtmlPaddings.only(bottom: 10, top: 10),
                                      //     ),
                                      //     "a": Style(color: Color(0xffD41912)),
                                      //     "h3": Style(
                                      //         color: Color(0xff111111),
                                      //         fontSize: FontSize.xLarge,
                                      //         padding: HtmlPaddings.symmetric(horizontal: 25),
                                      //         textAlign: TextAlign.left,
                                      //         fontWeight: FontWeight.w100)
                                      //   },
                                      // ),
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
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    "You Might Also Like",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 283,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                //physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: myPostsList1.length != null ? (myPostsList1.length > 10 ? 10 : myPostsList1.length) : myPostsList1.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Global.activeCategory = posts;
                                      Navigator.of(context).pushNamed('Homenewspagemain');
                                    },
                                    child: MinorPostType2(
                                      posts: myPostsList1[index],
                                      catId: Global.idFor10Posts,
                                      id: Global.idFor10Posts,
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
