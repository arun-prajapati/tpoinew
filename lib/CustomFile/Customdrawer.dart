import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  VoidCallback? refresh;

  CustomDrawer({this.refresh});

  static const _urlfacebook = 'https://www.facebook.com/thepressofindia/';
  static const _urlinsta = 'https://www.instagram.com/thepressofindia/';
  static const _urltwitter = 'https://twitter.com/thepressofindia';
  static const _urlyoutube =
      'https://www.youtube.com/channel/UCGtMZRCb2Mf86kZPcbBaFPA';
  static const _urlweb = 'https://thepressofindia.com/';

  void _launchURLFb() async => await canLaunch(_urlfacebook)
      ? await launch(_urlfacebook)
      : throw 'Could not launch $_urlfacebook';

  void _launchURLInsta() async => await canLaunch(_urlinsta)
      ? await launch(_urlinsta)
      : throw 'Could not launch $_urlinsta';

  void _launchURLTwitter() async => await canLaunch(_urltwitter)
      ? await launch(_urltwitter)
      : throw 'Could not launch $_urltwitter';

  void _launchURLYoutube() async => await canLaunch(_urlyoutube)
      ? await launch(_urlyoutube)
      : throw 'Could not launch $_urlyoutube';

  void _launchURLWeb() async => await canLaunch(_urlweb)
      ? await launch(_urlweb)
      : throw 'Could not launch $_urlweb';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(

                color: Color(0xff222222),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 3, horizontal: 10),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/logo.png',
                              height: 50, width: 60),
                          Text(
                            "The Press Of India",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
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
                leading: Icon(Icons.outlined_flag),
                title: Text("About Us"),
                onTap: () {
                  Global.activePage = Global.aboutUsPage;
                  Navigator.of(context).pushNamed('staticPage');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.contact_phone,
                ),
                title: Text("Contact Us"),
                onTap: () {
                  //  Global.activePage = Global.faqPage;
                  //   Navigator.of(context).pushNamed('staticPage');
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
                leading: Icon(Bootstrap.facebook,color: Color(0xff3b5998) ,),
                title: Text("Facebook",style: TextStyle(color: Color(0xff3b5998)),),
                onTap: () {
                  launchUrl(Uri.parse("https://www.facebook.com/thepressofindia/"));
                },
              ),
              ListTile(
                leading: Icon(Bootstrap.youtube,color: Colors.red ,),
                title: Text("Youtube",style: TextStyle(color: Colors.red),),
                onTap: () {
                  launchUrl(Uri.parse("https://www.youtube.com/channel/UCGtMZRCb2Mf86kZPcbBaFPA"));
                },
              ),
              ListTile(
                leading: Icon(Bootstrap.instagram,color: Color(0xff962fbf) ,),
                title: Text("Instagram",style: TextStyle(color: Color(0xff962fbf)),),
                onTap: () {
                  launchUrl(Uri.parse("https://www.instagram.com/thepressofindia/"));
                },
              ),
              ListTile(
                leading: Icon(Bootstrap.twitter,color: Color(0xff00ACEE) ,),
                title: Text("Twitter",style: TextStyle(color: Color(0xff00ACEE)),),
                onTap: () {
                  launchUrl(Uri.parse("https://twitter.com/thepressofindia"));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
