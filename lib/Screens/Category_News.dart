import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/ApiCall/Post_api.dart';
import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/Customdrawer.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/widgets/MajorPost.dart';
import 'package:morbimirror/widgets/PageContent.dart';

class CategoryNews extends StatefulWidget {
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  bool isLoading = true;
  int CurrentPage=1;

  List<Posts> myPostsList = [];

  getPost() async {
    List<Posts> myPostsListAdd = new List();
    print("|||||||||| GETTING POSTS FOR ID |||||||||||   ${Global.selectedCategoryId}");
 
    myPostsListAdd = await getPosts(
        url: "${BaseURL}wp-json/wp/v2/posts?status=publish&order=desc&per_page=20&page=$CurrentPage&categories=${Global.selectedCategoryId}");

    if(myPostsListAdd!=null) {
      myPostsList = myPostsList + myPostsListAdd;
    }
    isLoading = false;
    CurrentPage++;
    setState(() {
    });
  }
  Posts posts;
  int _current = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost();
    print(myPostsList.length);
    print("Length isssss");
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(  drawer: CustomDrawer(),
      key: _scaffoldKey,
      body: isLoading?
      Center(child: SizedBox(width: 100,height: 100,child: CircularProgressIndicator(),)):Column(
        children: [
          SafeArea(
            child: CustomAppBar(logoimg: 'assets/images/logo.png',
              clickonmenuicon: (){
                _scaffoldKey.currentState.openDrawer();
              },),
          ),
          Expanded(child: NotificationListener<ScrollEndNotification>(
              onNotification: (notification) {

                getPost();

            return false;
          },child: SingleChildScrollView(
            child: Column(
              children: [

                Stack(children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(autoPlay: true,
                      autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 300),
                      viewportFraction: 1.0,
                      //enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      height: 250.0,
                    ),
                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
    MajorPost(posts: myPostsList[itemIndex]),
                    itemCount: myPostsList.length !=null ?(myPostsList.length > 4 ? 4 : myPostsList.length):myPostsList.length,
                 /*   items: myPostsList.sublist(0,4).map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              print("<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>");
                              Global.activePost = posts;
                              Global.activePost.date = i.date;
                              print("///////////>>>>>>>>>>>>>>>>>>");
                              print(i.date);
                             // Navigator.of(context).pushNamed('Homenewspagemain');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  // borderRadius: BorderRadius.all(Radius.circular(10)),
                                  image: new DecorationImage(
                                    image: NetworkImage(i.featuredMedia.medium),
                                    fit: BoxFit.cover,
                                  )),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Spacer(
                                    flex:2,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [Colors.transparent, Colors.black])),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(10, 5, 15, 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 35,
                                                ),
                                                Customtextheader(title: "Morbi",
                                                  titleclr: staticWhite,
                                                  bgcolor: Colors.black,),
                                                SizedBox(height: 5,),
                                                customtext(
                                                  title: i.title.rendered,
                                                  titleclr: staticWhite,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  MyDate(i.date),
                                                  style:
                                                  TextStyle(color: staticWhite, fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          );
                        },
                      );
                    }).toList(),*/
                  ),
                  Positioned( top:10.0,
                    right: 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: myPostsList.sublist(0,4).map((image) {
                        int index=myPostsList.indexOf(image);
                        return Container(
                          width: 6.0,
                          height: 6.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(

                              border:  _current == index?Border.all(color: Colors.transparent):
                              Border.all(color: Colors.white),
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Colors.white
                                  : Colors.transparent
                          ),
                        );
                      },
                      ).toList(), // this was the part the I had to add
                    ),
                  ),
                ],
                ),
                ListView.builder(shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

    itemCount: myPostsList.length ,
                    itemBuilder: (context,index){
                  return MinorPost(myPostsList[index]);
                }),
              ],
            ),
          )

          ))
        ],
      ),
    );
  }
}
