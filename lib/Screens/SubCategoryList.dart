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
import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/advertisment.dart';
import 'package:morbimirror/newTesting.dart';
import 'package:morbimirror/testing.dart';
import 'package:morbimirror/widgets/MajorPost.dart';
import 'package:morbimirror/widgets/PageContent.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SubCategoryListPage extends StatefulWidget {
  static String route = "SubCategoryListPage";
  @override
  _SubCategoryListPageState createState() => _SubCategoryListPageState();
}

class _SubCategoryListPageState extends State<SubCategoryListPage> {

  List<Widget> myTabBars = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String apiUrl = "https://thepressofindia.com/wp-json/wp/v2/";
  // Empty list for our posts
  List? posts;
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
    getAdvertisement();
    super.initState();
//    this.getPosts();
  }


  getAdvertisement(){
    getAdvertisementData();
    getAdvertisementCustomData();
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

      setState(() {

      });


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
      setState(() {

      });


    });

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Global.myTabs!.length,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(logoimg: 'assets/images/logo.png',
                clickonmenuicon: (){

                  _scaffoldKey.currentState!.openDrawer();
                },),

              /*Image.asset('assets/images/headerad.jpg',),*/
              Global.advertisementList!=null?Html(onLinkTap: (String? url, RenderContext context, Map<String, String> attributes,  element)async{
                await launchUrlString(url!);
              },
                  data:Global.advertisementList
              ):SizedBox(),


              //Expanded(child: Testing(id: ,index: 2,catId: Global.menu[2].objectId,name: Global.menu[2].title,))
              Expanded(child: SingleChildScrollView(
                child: Column(
                  children: [
                    CategoryContent(posts: Global.selectedCat!.posts!.sublist(0,Global.selectedCat!.posts!.length>3?4:Global.selectedCat!.posts!.length)),
                    SizedBox(
                      height: 3,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: Global.selectedCat!.category!.length,
                        itemBuilder: (context, index) {
                          return Global.selectedCat!.category!.length > 2
                              ? PostForCategory(
                              postsList: Global.selectedCat!.category![index].posts,
                              categoryTitle: Global.selectedCat!.category![index].catName,
                              catId: Global.selectedCat!.category![index].catId.toString(),
                            category: MainCategory(),

                          )
                              : SizedBox();
                        }),
                  ],
                ),
              ))
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
