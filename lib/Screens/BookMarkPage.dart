import 'package:flutter/material.dart';
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

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {


  int CurrentPage=1;

  List<Posts> myPostsList = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myPostsList = Global.bookMarkPosts.reversed.toList();

  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(  drawer: CustomDrawer(),
      key: _scaffoldKey,
      body:
      SafeArea(
        child: Column(
          children: [
           // SizedBox(height: 55,),
            CustomAppBar(logoimg: 'assets/images/logo.png',
              clickonmenuicon: (){
                _scaffoldKey.currentState?.openDrawer();
              },),
            Expanded(child:  myPostsList.isEmpty?Center(child: Text("No Post"),):ListView.builder(

            itemCount: myPostsList.length
            ,itemBuilder: (context,index){
              return index==0?MajorPost(posts: myPostsList[index],):MinorPost(myPostsList[index]);
            }))
          ],
        ),
      ),
    );
  }
}
