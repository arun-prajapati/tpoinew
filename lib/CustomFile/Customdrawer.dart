import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Common.dart';

class CustomDrawer extends StatelessWidget {
  VoidCallback refresh;

  CustomDrawer({this.refresh});


  static const _urlfacebook = 'https://www.facebook.com/thepressofindia/';
  static const _urlinsta = 'https://www.instagram.com/thepressofindia/';
  static const _urltwitter = 'https://twitter.com/thepressofindia';
  static const _urlyoutube = 'https://www.youtube.com/channel/UCGtMZRCb2Mf86kZPcbBaFPA';
  static const _urlweb = 'https://thepressofindia.com/';


  void _launchURLFb() async =>
      await canLaunch(_urlfacebook) ? await launch(_urlfacebook) : throw 'Could not launch $_urlfacebook';

  void _launchURLInsta() async =>
      await canLaunch(_urlinsta) ? await launch(_urlinsta) : throw 'Could not launch $_urlinsta';

  void _launchURLTwitter() async =>
      await canLaunch(_urltwitter) ? await launch(_urltwitter) : throw 'Could not launch $_urltwitter';

  void _launchURLYoutube() async =>
      await canLaunch(_urlyoutube) ? await launch(_urlyoutube) : throw 'Could not launch $_urlyoutube';


  void _launchURLWeb() async =>
      await canLaunch(_urlweb) ? await launch(_urlweb) : throw 'Could not launch $_urlweb';


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: SafeArea(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                onTap: () {
                  Global.currentPageIndex = 1;

                  refresh();
                },
                contentPadding:
                    EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                title: Column(
                  children: [
                    Container(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                  image:
                                      new AssetImage("assets/images/logo.png"),
                                  fit: BoxFit.contain,
                                ))),
                            Text(
                              "The Press Of India",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('home');
                      },
                      child: ListTile(
                        leading: Icon(Icons.home),
                        title: Text("Home"),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.bookmark),
                      title: Text("Bookmark"),
                      onTap: () {
                        Navigator.of(context).pushNamed('bookmark');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.category),
                      title: Text("Category"),
                      onTap: () {
                        Navigator.of(context).pushNamed('drawer_category');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.outlined_flag),
                      title: Text("About Us"),
                      onTap: () {
                        Global.activePage = Global.aboutUsPage;
                        Navigator.of(context).pushNamed('staticPage');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.security),
                      title: Text("Privacy Policy"),
                      onTap: () {
                        Global.activePage = Global.privacyPolicPage;
                        Navigator.of(context).pushNamed('staticPage');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.announcement,),
                      title: Text("Faq"),
                      onTap: () {
                        Global.activePage = Global.faqPage;
                        Navigator.of(context).pushNamed('staticPage');
                      },
                    ),

                    Divider(height:3, color: Colors.grey.withOpacity(0.3)),

                    GestureDetector(onTap: (){
                      _launchURLFb();
                    },
                      child: ListTile(
                        leading: Image.asset('assets/images/fbdrawer.png',height: 30,width: 30,),
                        title: Text("Facebook"),
                      ),
                    ),

                    GestureDetector(onTap: (){
                      _launchURLTwitter();
                    },
                      child: ListTile(
                        leading: Image.asset('assets/images/twidrawer.png',height: 30,width: 30,),
                        title: Text("Twitter"),
                      ),
                    ),

                    GestureDetector(onTap: (){
                      _launchURLInsta();
                    },
                      child: ListTile(
                        leading: Image.asset('assets/images/instadrawer.png',height: 30,width: 30,),
                        title: Text("Instagram"),
                      ),
                    ),



                    GestureDetector(onTap: (){

                      _launchURLYoutube();
                    },
                      child: ListTile(
                        leading: Image.asset('assets/images/youtubedrawer.png',height: 30,width: 30,),
                        title: Text("Youtube"),
                      ),
                    ),

                    GestureDetector(onTap: (){

                      _launchURLWeb();
                    },
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(
                            left: 8
                          ),
                          child: Image.asset('assets/images/globe.png',height: 17,width: 17,),
                        ),
                        title: Text("WebPage"),
                      ),
                    ),

                    Divider(height:3, color: Colors.grey.withOpacity(0.3)),
                    ListTile(
                      leading: Icon(Icons.share),
                      title: Text("Share This App"),
                      onTap: () {
                        Share.share('check out my App https://example.com');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
