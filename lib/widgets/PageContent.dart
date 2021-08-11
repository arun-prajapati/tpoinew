import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/widgets/MajorPost.dart';

class CategoryContent extends StatefulWidget {
   List<Posts> posts;

  CategoryContent({this.posts});

  @override
  _CategoryContentState createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(autoPlay: true,
            autoPlayInterval: Duration(seconds: 1),
            autoPlayAnimationDuration: Duration(milliseconds: 400),
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            height: 250.0,
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
                        child: Container(height: 100,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black.withOpacity(0.4),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    i.title.rendered,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
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
      ]);


    /*ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.posts.length
    ,itemBuilder: (context,index){


     // return index==0?MajorPost(posts: widget.posts[index],):MinorPost(widget.posts[index]);
    });*/
  }
}

/*

SingleChildScrollView(
child: Column(
children: [

SizedBox(height: 20,),
//header card
Padding(
padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
child: Column(
children: [
Row(mainAxisAlignment: MainAxisAlignment.start,
children: [
Customtextheader(title: "Latest News",titleclr: staticWhite,bgcolor: staticDarkblue,),
],
),
Divider(height: 1,color: staticDarkblue,thickness: 2,)
],
),
),
Padding(
padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
child: GestureDetector(
onTap: (){

Navigator.of(context).pushNamed('Homenewspagemain');
},
child: Container(
width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height * .4,
decoration: new BoxDecoration(
shape: BoxShape.rectangle,
borderRadius: BorderRadius.all(Radius.circular(10)),
image: new DecorationImage(
image: AssetImage('assets/images/bg.jpg'),
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
Padding(
padding: const EdgeInsets.fromLTRB(10, 5, 15,10),
child: Column(crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.start,
children: <Widget>[
Customtextheader(title: "Morbi",
titleclr: staticWhite,
bgcolor: Colors.black,),

SizedBox(height: 5,),

customtext(title: "મોરબીમાં કન્યા છાત્રાલય રોડ પર ભરાતા પાણીનો નિકાલ કરવા ચીફ ઓફિસરને રજુઆત",
titleclr: staticWhite,),

SizedBox(height: 5,),


Text("Morbi Update  - Sepetember 7,2020 8:09 pm",
style: TextStyle(
color: staticWhite,fontSize: 10
),),
],
),
),
],
),


],
),
),
),
),

SizedBox(height: 20,),
//slider
CarouselSlider(items: [
Padding(
padding: const EdgeInsets.all(8.0),
child: GestureDetector(onTap: (){

Navigator.of(context).pushNamed('Homenewspagemain');
},
child: Container(
width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height * .4,
decoration: new BoxDecoration(
shape: BoxShape.rectangle,
borderRadius: BorderRadius.all(Radius.circular(10)),
image: new DecorationImage(
image: AssetImage('assets/images/bg.jpg'),
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
Padding(
padding: const EdgeInsets.fromLTRB(10, 5, 15,10),
child: Column(crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.start,
children: <Widget>[
Customtextheader(title: "Morbi",
titleclr: staticWhite,
bgcolor: Colors.black,),

SizedBox(height: 5,),

Container(width: 240,
child: customtext(title: "મોરબીમાં કન્યા છાત્રાલય રોડ પર ભરાતા પાણીનો નિકાલ કરવા ચીફ ઓફિસરને રજુઆત",
titleclr: staticWhite,),
),

SizedBox(height: 5,),

],
),
),
],
),


],
),
),
),
),
],
options: CarouselOptions(
autoPlay: false,
//enlargeCenterPage: true,
initialPage: 2,
//height: MediaQuery.of(context).size.height*0.2,

),
),

//morbi news

SizedBox( height: 40,),
Padding(
padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
child: Column(
children: [
Row(mainAxisAlignment: MainAxisAlignment.start,
children: [
Customtextheader(title: "Morbi News",titleclr: staticWhite,bgcolor: staticDarkblue,),
],
),
Divider(height: 1,color: staticDarkblue,thickness: 2,)
],
),
),

//  listview of morbinews

Container(
width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height * .5,
child: new ListView.builder(
itemCount: 4,
itemBuilder: (BuildContext ctxt, int index) {
//wp.Post post = snapshot.data[index];
return Padding(
padding: const EdgeInsets.all(8.0),
child: Column(
children: <Widget>[
SizedBox(height: 10,),
GestureDetector(onTap: (){
Navigator.of(context).pushNamed('Homenewspagemain');
},
child: Card(
child: Row(
children: <Widget>[
Column(
children: <Widget>[
Row(
children: <Widget>[
Center(
child:Container(
height: MediaQuery.of(context).size.height*0.2,
width: MediaQuery.of(context).size.height*0.18,
decoration: BoxDecoration(borderRadius: BorderRadius.only(
topRight: Radius.circular(0.0),
*/
/*bottomRight: Radius.circular(50.0)*/ /*
),
image: DecorationImage(
image: AssetImage('assets/images/bg.jpg'),
fit: BoxFit.fill,
),

),
)
),
SizedBox(width: 10,),
Container(width: 200,
child: Column(
children: [
Text("મોરબીમાં જુદા જુદા ચાર બનાવોમાં ચાર વ્યક્તિઓ સારવાર હેઠળ : બે ના અપમૃત્યુ"),
SizedBox(height: 10,),
Row(
children: [
Text("3rd sep"),
Spacer(),
Text("11:45 pm"),
SizedBox(width: 10,)
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

],
),
);
}),
),


//popular news

SizedBox( height: 40,),
Padding(
padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
child: Column(
children: [
Row(mainAxisAlignment: MainAxisAlignment.start,
children: [
Customtextheader(title: "Popular News",titleclr: staticWhite,bgcolor: staticDarkblue,),
],
),
Divider(height: 1,color: staticDarkblue,thickness: 2,)
],
),
),


//  listview of popularnews

*/
/*Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .5,
        child: new ListView.builder(
            itemCount:  posts == null ? 0 : posts.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    GestureDetector(onTap: (){
                      Navigator.of(context).pushNamed('Homenewspagemain');
                    },
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Center(
                                        child:Container(
                                          height: MediaQuery.of(context).size.height*0.2,
                                          width: MediaQuery.of(context).size.height*0.18,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(0.0),
                                            */ /*
*/
/*bottomRight: Radius.circular(50.0)*/ /*
*/
/*),
                                            image: DecorationImage(
                                              image:NetworkImage(posts[index]["_embedded"]["wp:featuredmedia"][0]["source_url"]),
                                              fit: BoxFit.fill,
                                            ),

                                          ),
                                        )
                                    ),
                                    SizedBox(width: 10,),
                                    Container(width: 200,
                                        child: Column(
                                          children: [
                                            Text(posts[index]["title"]["rendered"],maxLines: 4,),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Customtextheader(bgcolor: staticBlack,
                                                    titleclr: staticWhite,title: posts[index]["categories"].toString()),
                                                Spacer(),
                                                Text(posts[index]["date"].toString().split(' ')[0],
                                                  style: TextStyle(
                                                      fontSize: 12
                                                  ),)
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

                  ],
                ),
              );
            }),
      ),*/ /*


customBottombar(
img: 'assets/images/logo.png',
title: "મોરબીવાસીઓ તમામ વિસ્તારોમની સચોટ અને તટસ્થ માહિતી હર પળ ઘરે બેઠા મળી રહે એ માટે મોરબીવાસીઓનું પોતાનું મોરબી મિરર શરૂ કરવાનો અમારો ધ્યેય છે જે ધ્યેય આપ સૌ મિત્રોના સાથ સહકારથી શ્રેષ્ઠતા સાથે કામયાબીના શિખરો સર કરશે જેના માટે મોરબી ગૌરવ અનુભવશે.",

)],
),
)*/
