import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class MinorPost extends StatelessWidget {

  Posts posts;


  MinorPost(this.posts);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      Global.activePost = posts;
      Navigator.of(context).pushNamed('Homenewspagemain');
    },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0,8,8,0),
        child: Card( /*color: Colors.pink,*/
          child:  Row(
            children: <Widget>[

              Column(
                children: <Widget>[

                  Row(
                    children: <Widget>[
                      Center(
                          child:Container(
                            height: MediaQuery.of(context).size.width*0.25,
                            width: MediaQuery.of(context).size.width*0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0.0),

                                /*bottomRight: Radius.circular(50.0)*/),
                              image: DecorationImage(
                                image: NetworkImage(posts.featuredMedia.medium),
                                fit: BoxFit.fill,
                              ),

                            ),
                          )
                      ),
                      SizedBox(width: 10,),
                      Container(width: 200,
                          child: Column(
                            children: [

                              Text(posts.title.rendered),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text(MyDate(posts.date),),

                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ],
              ),




            ],
          ),
        ),
      ),
    );
  }
}

class MajorPost extends StatelessWidget {

  Posts posts;


  MajorPost({this.posts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: GestureDetector(
        onTap: (){
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
              Spacer(flex: 2,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(

                        gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Colors.transparent,Colors.black])
                      ),

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 15,10),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 35,),
                         /*   Customtextheader(title: "Morbi",
                              titleclr: staticWhite,
                              bgcolor: Colors.black,),
                            SizedBox(height: 5,),*/
                            customtext(title: posts.title.rendered,
                              titleclr: staticWhite,),
                            SizedBox(height: 5,),
                            Text(MyDate(posts.date),
                              style: TextStyle(
                                  color: staticWhite,fontSize: 10
                              ),),
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
    );
  }
}

class PostForCategory extends StatelessWidget {

  List<Posts> postsList ;
  String categoryTitle;
  String catId;

  PostForCategory({this.postsList,this.categoryTitle,this.catId});

  @override
  Widget build(BuildContext context) {
    //postsList.sort((a, z) => a.toString().compareTo(z.toString()));
    return postsList.isEmpty?SizedBox():SafeArea(
      child: Column(
        children: [
          HeaderTitle(title:categoryTitle??"title",posts:postsList,catId: catId,),
         // MajorPostType2(posts: postsList[0],),
          postsList.length>1?
          Container(height: MediaQuery.of(context).size.width*0.8,
              child: Row(
            children: [
              HorizontalListofPost(postsList: postsList,),
            ],
          )):Padding(
            padding: const EdgeInsets.all(22.0),
            child: CircularProgressIndicator(backgroundColor: Colors.green,),
          )


        ],
      ),
    );
  }
}

class HorizontalListofPost extends StatelessWidget {

  List<Posts> postsList ;


  HorizontalListofPost({this.postsList});



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: postsList.length-1
        ,itemBuilder: (c,i){
          return
            AnimationConfiguration.staggeredList(
            position: i,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: SlideAnimation(
                  child: FadeInAnimation(duration: Duration(seconds: 5),
                    child:  MinorPostType2(posts: postsList[i+1],),
                  ),
                ),
              ),);


        }),
      ),
    );
  }
}

class MajorPostType2 extends StatelessWidget {

  Posts posts;
  MajorPostType2({this.posts});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
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
            mainAxisSize: MainAxisSize.min
            ,crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .4,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      image: new DecorationImage(
                        image: NetworkImage(posts.featuredMedia.medium),
                        fit: BoxFit.cover,
                      ))
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(posts.title.rendered,textAlign: TextAlign.justify,),
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

  Posts posts;
  MinorPostType2({this.posts});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Global.activePost = posts;
          Navigator.of(context).pushNamed('Homenewspagemain');
        },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*.4,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min
                  ,crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*.4,
                        height: MediaQuery.of(context).size.width * .4,
                        decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            image: new DecorationImage(
                              image: NetworkImage(posts.featuredMedia.medium??""),
                              fit: BoxFit.cover,
                            ))
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * .2,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: Text(posts.title.rendered,textAlign: TextAlign.justify,overflow: TextOverflow.clip,)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderTitle extends StatelessWidget {

  String title;
  List<Posts> posts ;
  String catId;

  HeaderTitle({this.title,this.posts,this.catId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
SizedBox(height: 5,),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title??"",style: TextStyle(color: staticDarkblue,fontSize: MediaQuery.of(context).size.width*0.05,fontWeight: FontWeight.w400),),
            ),
            Spacer(),
            GestureDetector(
            onTap: (){
              Global.activeCategory=posts;
              Global.selectedCategoryId=catId;
              Navigator.of(context).pushNamed('categorynews');
            }
            ,child: Container(color: staticDarkblue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('See All'??"",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width*0.04,fontWeight: FontWeight.bold),),
                ))),
            SizedBox(width: 20,),
          ],
        ),
        //Divider(color: staticDarkblue,thickness: 3,height: 0,)
        SizedBox(height: 5,),
      ],
    );
  }
}



