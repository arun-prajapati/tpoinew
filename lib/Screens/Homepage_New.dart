import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/Customdrawer.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:http/http.dart' as http;
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/advertisment.dart';
import 'package:morbimirror/testing.dart';
import 'package:morbimirror/widgets/PageContent.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<Widget> myTabBars = new List();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String apiUrl = "https://thepressofindia.com/wp-json/wp/v2/";
  // Empty list for our posts
  List posts;
  // Function to fetch list of posts
  Future<String> getPosts() async {
    var res = await http.get(Uri.parse(Uri.encodeFull(apiUrl + "posts?_embed")), headers: {"Accept": "application/json"});
    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });
    return "Success!";
  }
  @override
  void initState() {
    //GetPageData();
    getAdvertisementData();
    getAdvertisementCustomData();
    super.initState();
//    this.getPosts();
  }

  getAdvertisementData(){
//calling api

    http.get(Uri.parse('${BaseURL}wp-json/wp/v2/get_add?position=header'),
    ).then((res){

      print(res.body);
      print("KKKKK");
      String content;
      var advertiseList = jsonDecode(res.body);

      print(advertiseList['content']);
      Global.advertisementList = advertiseList['content'];

      print("KKKKMMMM");


    });

  }


  getAdvertisementCustomData(){
//calling api

    http.get(Uri.parse('${BaseURL}wp-json/wp/v2/get_add?position=custom_ad_1'),
    ).then((res){

      print(res.body);
      print("NNN");
      String content;
      var advertiseCustomList = jsonDecode(res.body);

      print(advertiseCustomList['content']);
      Global.advertisementCustomList = advertiseCustomList['content'];

      print("KKKKMMMM");


    });

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Global.myTabs.length,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(logoimg: 'assets/images/logo.png',
                clickonmenuicon: (){

                _scaffoldKey.currentState.openDrawer();
                },),
              SizedBox(height: 4,),
              /*Image.asset('assets/images/headerad.jpg',),*/
              Html(
                data:Global.advertisementList
              ),
              SizedBox(height: 4,),
              Expanded(child: Testing(id: int.parse(Global.menu[2].objectId),index: 2,catId: Global.menu[2].objectId,name: Global.menu[2].title,))
            ],
          ),
        ),
      ),

    );
  }


  /*GetPageData(){
    for(int i =0;i<Global.menu.length;i++){

      myTabBars.add(Testing(id: int.parse(Global.menu[i].objectId),index: i,catId: Global.menu[i].objectId,name: Global.menu[i].title,));
    }
    Testing t1 = Testing(id: int.parse(Global.menu[2].objectId),index: 2,catId: Global.menu[2].objectId,name: Global.menu[2].title,);
    print("))))))))))))))))))))))))))))))))))))))))))${Global.menu[2].title}");
  }
*/

}
