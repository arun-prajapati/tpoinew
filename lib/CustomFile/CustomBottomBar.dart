import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:url_launcher/url_launcher.dart';


import 'CustomTextHeadingOftheBanner.dart';



class customBottombar extends StatelessWidget {


  final String img;
  final String title;
  final Color titleclr;
  customBottombar({this.img, this.title, this.titleclr});


  static const _urlfacebook = 'https://www.facebook.com/thepressofindia/';
  static const _urlinsta = 'https://www.instagram.com/thepressofindia/';
  static const _urltwitter = 'https://twitter.com/thepressofindia';
  static const _urlyoutube = 'https://www.youtube.com/channel/UCGtMZRCb2Mf86kZPcbBaFPA';

  void _launchURLFb() async =>
      await canLaunch(_urlfacebook) ? await launch(_urlfacebook) : throw 'Could not launch $_urlfacebook';

  void _launchURLInsta() async =>
      await canLaunch(_urlinsta) ? await launch(_urlinsta) : throw 'Could not launch $_urlinsta';

  void _launchURLTwitter() async =>
      await canLaunch(_urltwitter) ? await launch(_urltwitter) : throw 'Could not launch $_urltwitter';

  void _launchURLYoutube() async =>
      await canLaunch(_urlyoutube) ? await launch(_urlyoutube) : throw 'Could not launch $_urlyoutube';


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          children: [
            /*Image.asset(img,width: 200,height: 150,),
            SizedBox(height: 20,),
            Text(title,textAlign: TextAlign.justify,style: TextStyle(
              color: titleclr,fontWeight: FontWeight.w600,

            ),),*/
            SizedBox(height: 6,),
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Customtextheader(title: "Stay Connected",titleclr: staticWhite,bgcolor: staticDarkblue,),
                  ],
                ),
                Divider(height: 1,color: staticDarkblue,thickness: 2,)
              ],
            ),
         /*   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [



                SocialMediaButton.youtube(url: 'https://www.youtube.com/channel/UCSjQi-WHNOoW5XrPLAM30LQ',color: staticBlue,size: 30,),
                SocialMediaButton.facebook(url: 'https://www.facebook.com/Morbi-Mirror-101701831652004',color: staticBlue,size: 30,),
                SocialMediaButton.instagram(url: 'https://www.instagram.com/morbimirror/',color: staticBlue,size: 30,),
                SocialMediaButton.twitter(url: 'https://twitter.com/MorbiMirror',color: staticBlue,size: 30,),
              ],
            ),*/

            SizedBox(height: 10,),
          /*  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(onTap: (){
                  _launchURLFb();
                },
                    child: Image.asset('assets/icon/fb.png',width: 50,height: 50,)),

                GestureDetector(onTap: (){
                  _launchURLInsta();
                },
                    child: Image.asset('assets/icon/insta.png',width: 50,height: 50)),

                GestureDetector(onTap: (){
                  _launchURLTwitter();
                },
                    child: Image.asset('assets/icon/twittor.png',width: 50,height: 50)),

                GestureDetector(onTap: (){
                  _launchURLYoutube();
                },
                    child: Image.asset('assets/icon/youtube.png',width: 50,height: 50))

              ],
            ),*/

            SizedBox(height: 10,),
            Text("© ${DateTime.now().year} The Press of INDIA . All rights reserved.")

          ],
        ),
      ),
    );
  }
}
