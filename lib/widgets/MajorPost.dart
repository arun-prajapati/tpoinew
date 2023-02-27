import 'dart:convert';

import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/Screens/SubCategoryList.dart';

class MinorPost extends StatelessWidget {
  Posts? posts;

  MinorPost(this.posts);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Global.activePost = posts;
        Navigator.of(context).pushNamed('Homenewspagemain');
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 0,
                    ),
                    Container(
                        width: 230,
                        child: Column(
                          children: [

                            Text(posts!.postTitle!,
                                style: TextStyle(
                                    color: Color(0xff707070),
                                    fontWeight: FontWeight.normal)),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 20,
                                  width: 6,
                                  decoration: BoxDecoration(
                                      color: Color(0xffD41912),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2))),
                                ),
                              ],
                            ),
                            /* Row(
                              children: [
                                Text(
                                  MyDate(posts.date),
                                ),
                              ],
                            ),*/
                          ],
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                        child: Container(
                      height: MediaQuery.of(context).size.width * 0.25,
                      width: MediaQuery.of(context).size.width * 0.34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image:posts!.featuredMedia!.medium != null ?  DecorationImage(
                          image:NetworkImage(posts!.featuredMedia!.medium!) ,
                          fit: BoxFit.cover,
                        ): DecorationImage(
                        image:AssetImage('assets/images/logo.png'),
        fit: BoxFit.cover,
      ),
                      ),
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width-18,
                  margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 0.2,
                  color: Color(0xff707070),
                ),
                /*       Icon(Icons.ac_unit_sharp)*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//After See All click -- Single container
class MajorPost extends StatelessWidget {
  Posts? posts;
  //List<Posts> posts;
  MajorPost({this.posts});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Global.activePost = posts;
        Navigator.of(context).pushNamed('Homenewspagemain');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .3,
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            /*borderRadius: BorderRadius.all(Radius.circular(10)),*/
            image: new DecorationImage(
              image: NetworkImage(posts!.featuredMedia!.medium!),
              fit: BoxFit.cover,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Spacer(
              flex: 2,
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
                          Container(
                            height: 20,
                            width: 5,
                            decoration: BoxDecoration(
                                color: Color(0xffD41912),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2))),
                          ),

                          /*   Customtextheader(title: "Morbi",
                            titleclr: staticWhite,
                            bgcolor: Colors.black,),*/
                          SizedBox(
                            height: 5,
                          ),
                          customtext(
                            title: posts!.postTitle!,
                            titleclr: staticWhite,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          /* Text(
                            MyDate(posts.date),
                            style:
                            TextStyle(color: staticWhite, fontSize: 10),
                          ),*/
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
  }
}
//After See All click -- Single container End

//Slider
/*class MajorPost extends StatefulWidget {
  //Posts posts;
  List<Posts> posts;
  MajorPost({this.posts});

  @override
  _MajorPostState createState() => _MajorPostState();
}

class _MajorPostState extends State<MajorPost> {
  List<Posts> myPosts = [];
  int _current = 0;

  @override
  void initState() {
    // TODO: implement initState
    print("//////////////");
    print(widget.posts.length);
    print(widget.posts.length-16);
    print("===================");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Stack(
              children: [
                CarouselSlider(
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
                    height: 280.0,
                  ),
                  items: widget.posts.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(onTap: (){
                          Global.activePost = i;
                          Navigator.of(context).pushNamed('Homenewspagemain');
                        },
                          child: Container(
                            width: MediaQuery.of(context).size.width,

                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.3),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    i.featuredMedia.medium,
                                  )),
                            ),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(height: 130,
                                    width: MediaQuery.of(context).size.width,
                                    // color: Colors.black.withOpacity(0.4),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(height: 30,  width: 5,
                                            decoration: BoxDecoration(color: Colors.deepOrange,
                                                borderRadius: BorderRadius.all(Radius.circular(5))
                                            ),),
                                          Text(
                                            i.title.rendered,overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,fontSize: 22),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
       Text(
                                        MyDate(i.date),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                        ],
                                      ),
                                    ))),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned( top:0.0,
                  right: 10.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.posts.map((image) {
                      int index=widget.posts.indexOf(image);
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
              ]),
          SizedBox(height: 5,),
          Container(height: 50,width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/headerad.jpg'))
          ,SizedBox(height: 5,),  ],
      );
     */ /* Padding
(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: GestureDetector(
        onTap: () {
          Global.activePost = posts;
          Navigator.of(context).pushNamed('Homenewspagemain');
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .3,
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: new DecorationImage(
                image: NetworkImage(posts.featuredMedia.medium),
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
                              title: posts!.postTitle!,
                              titleclr: staticWhite,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              MyDate(posts.date),
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

      ),
    )
;*/ /*
  }
}*/
//Slider

class PostForCategory extends StatelessWidget {
  List<Posts>? postsList;
  MainCategory? category;
  String? categoryTitle;
  String? catId;


  PostForCategory({this.postsList, this.categoryTitle, this.catId,this.category});

  @override
  Widget build(BuildContext context) {



    //postsList.sort((a, z) => a.toString().compareTo(z.toString()));
    return postsList!.isEmpty
        ? SizedBox()
        : SafeArea(
            child: Column(
              children: [
                HeaderTitle(
                  title: categoryTitle ?? "title",
                  posts: postsList!,
                  catId: catId!,
                  category: category!,
                ),
                // MajorPostType2(posts: postsList[0],),
                postsList!.length > 1
                    ? Container(
                        height: MediaQuery.of(context).size.width * 0.66,
                        child: Row(
                          children: [
                            HorizontalListofPost(
                              postsList: postsList!,
                              id: catId,

                            ),
                          ],
                        ))
                    : Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.green,
                        ),
                      )
              ],
            ),
          );
  }
}

class HorizontalListofPost extends StatelessWidget {
  List<Posts>? postsList;
  String? id;

  HorizontalListofPost({this.postsList,this.id});

  final options = LiveOptions(
    // Start animation after (default zero)
    delay: Duration(seconds: 1),

    showItemInterval: Duration(milliseconds: 100),

    showItemDuration: Duration(milliseconds: 80),

    visibleFraction: 0.03,
    reAnimateOnVisibility: true,
  );

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -1),
            end: Offset.zero,
          ).animate(animation),
          // Paste you Widget
          child: MinorPostType2(
            posts: postsList![index + 1],
            id: id!,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LiveList.options(
        options: options,
        itemBuilder: buildAnimatedItem,
        scrollDirection: Axis.horizontal,
        itemCount: postsList!.length - 1,
      ),
    );
  }
}

//

class MajorPostType2 extends StatelessWidget {
  Posts? posts;

  MajorPostType2({this.posts});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Global.activePost = posts;
        Navigator.of(context).pushNamed('Homenewspagemain');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .4,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      image: new DecorationImage(
                        image: NetworkImage(posts!.featuredMedia!.medium!),
                        fit: BoxFit.cover,
                      ))),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      posts!.postTitle!,
                      textAlign: TextAlign.justify,
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

class MinorPostType2 extends StatelessWidget {
  Posts? posts;
  String? id;

  MinorPostType2({this.posts,this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Global.activePost = posts;
        Global.selectedCategoryId=id??"1";
        print(Global.selectedCategoryId);
        print("ssssss");
        Navigator.of(context)
            .pushNamed('Homenewspagemain');

      },
      child: Column(
        children: [
          Container(
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
                          image:posts!.featuredMedia!.medium==null? new DecorationImage(
                            image:AssetImage('assets/images/logo.png'),
                            fit: BoxFit.contain,
                          ): new DecorationImage(
                            image:CachedNetworkImageProvider(posts!.featuredMedia!.medium!),
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
                              child: Text(
                            posts!.postTitle!,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.3,
                              color: Color(0xff696969),

                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderTitle extends StatelessWidget {
  String? title;
  List<Posts>? posts;
  MainCategory? category;

  String? catId;

  HeaderTitle({this.title, this.posts, this.catId,this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 0),
                child: Text(
                  title ?? "",
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 15, /*fontWeight: FontWeight.w400*/
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(

                  onTap: () {
print(jsonEncode(category));
                   if(category!=null && category!.category!=null && category!.category!.isNotEmpty){
                      Global.selectedCat = category;
                     Navigator.of(context).pushNamed(SubCategoryListPage.route);
                    }else {
                      Global.activeCategory = posts;
                      Global.selectedCategoryId = catId;
                      print("<<<<<");
                      print(Global.selectedCategoryId);
                      Navigator.of(context).pushNamed('categorynews');
                    }
                  },
                  child: Container(
                      color: staticBlack,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 13, right: 13),
                        child: Text(
                          'SEE ALL' ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                      ))),
              SizedBox(
                width: 4,
              ),
            ],
          ),
        ),
        //Divider(color: staticDarkblue,thickness: 3,height: 0,)

      ],
    );
  }
}
