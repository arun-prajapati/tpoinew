/*
import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Posts.dart';

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
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, position) {
            return Container(
              width: 400,
              height: 200,
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: new DecorationImage(
                    image: posts.featuredMedia.medium!=null?NetworkImage(posts.featuredMedia.medium):Text("No data"),
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
                                */
/*   Customtextheader(title: "Morbi",
                              titleclr: staticWhite,
                              bgcolor: Colors.black,),
                            SizedBox(height: 5,),*/ /*

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
            );
          },
        ),
      ),
    );
  }
}*/



import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker_saver/image_picker_saver.dart';


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // In order to use RepaintBoundary, RenderRepaintBoundary

import 'dart:ui' as ui;
import 'dart:typed_data';

// This package is used to save screenshots to the gallery
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:morbimirror/test_model.dart';
import 'package:http/http.dart' as http;
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This key is used for the RepaintBoundary widget
  final GlobalKey _key = GlobalKey();

  String _message = 'Press the button to take a screenshot';

  // This function will be triggered when the button is pressed
  void _takeScreenshot() async {
    RenderRepaintBoundary boundary =
    _key.currentContext.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      Uint8List pngBytes = byteData.buffer.asUint8List();

      // Saving the screenshot to the gallery
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(pngBytes),
          quality: 90,
          name: 'screenshot-${DateTime.now()}.png');
      print(result);
      setState(() {
        _message = 'New screenshot successfully saved!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _key,
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text('Kindacode.com'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: _takeScreenshot, child: Text('Take Screenshot')),
              SizedBox(
                height: 20,
              ),
              Text(_message)
            ],
          ),
        ),
      ),
    );
  }
}*/


/*class Testapi extends StatefulWidget {


  @override
  _TestapiState createState() => _TestapiState();
}

class _TestapiState extends State<Testapi> {


  Future<void> _showMyDialog() async {

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
       elevation: 0,
       child: Column(mainAxisAlignment: MainAxisAlignment.center,
         mainAxisSize: MainAxisSize.min,
         children: [
           Card(
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator()),
             ),
           ),
         ],
       ),

        );
      },
    );
  }


  List<User> getList = [];
  
  getuserData() async {

    http.Response response =
    await http.post(Uri.parse('http://ocx.quiz99.online/api/register'),
        body: {
      "username":"vrunda",
      "phone_no":"123456789",
      "country_code":"+91",
      "image":"jhgj.png",
      "email":"vrunda@ocx.com",
      "firebase_id":"11"
    });

                                       

    var parsedData = jsonDecode(response.body);

    getList = (parsedData['data'] as List).map((e) => User.fromJson(parsedData)).toList();
    print(getList.length);
    
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserData();
  }
  
  @override
  Widget build(BuildContext context) {
     *//* getList.length!=null?  Expanded(
             child: ListView.builder(
               itemCount: getList.length,
               itemBuilder: (context, i) {
                 return Text(getList[i].username);
               },
             ),
           ):*//*_showMyDialog();
    setState(() {

    });
    return Scaffold(

     body: Center(
       child: Column(mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [

           Center(
             child: ElevatedButton(onPressed: (){
             }, child: Text("Hit Button")),
           ),


         ],
       ),
     ),
    );

  }
}*/

import 'package:flutter/material.dart';





class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key key,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  initState() {
    initialTimer();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  GlobalKey _keyRed = GlobalKey();

  var gotPosition = false;
  var redPositionX;
  var redPositionY;
  var redWidth;
  var redHeight;

  _afterLayout(_) {
    _getPositions();
    _getSizes();
    setState(() {
      gotPosition = true;
    });
  }

  _getSizes() {
    final RenderBox renderBoxRed = _keyRed.currentContext.findRenderObject();
    final sizeRed = renderBoxRed.size;
    print("SIZE of Red: $sizeRed");
    redWidth = sizeRed.width;
    redHeight = sizeRed.height;
  }

  _getPositions() {
    print("beer");
    final RenderBox renderBoxRed = _keyRed.currentContext.findRenderObject();
    print(renderBoxRed);
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    print("POSITION of Red: $positionRed ");
    redPositionY = positionRed.dy;
    redPositionX = positionRed.dx;
  }

  var startAnimation = false;
  initialTimer() async {
    await new Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      startAnimation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    print('width/height $screenWidth / $screenHeight');

    return Container(
      color: Colors.blue,
      child: Center(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.3),
                  key: _keyRed,
                  color: Colors.red,
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: Colors.yellow,
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.05,
                      ),
                      Container(
                        color: Colors.yellow,
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.05,
                      )
                    ],
                  ),
                ),
                // ),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              top: startAnimation
                  ? ((redPositionY / 2) - (redHeight / 2))
                  : redPositionY,
              curve: Curves.easeInCubic,
              left: 0.3 * screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.green,
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
