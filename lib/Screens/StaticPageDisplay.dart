import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/Customdrawer.dart';
import 'package:morbimirror/Global/Global.dart';

class StaticPageDisplay extends StatefulWidget {
  @override
  _StaticPageDisplayState createState() => _StaticPageDisplayState();
}

class _StaticPageDisplayState extends State<StaticPageDisplay> {


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(  drawer: CustomDrawer(),
      key: _scaffoldKey,
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.white,
        title:Global.activePage==null?Text("No Data"):Text("${Global.activePage!.title!.rendered!.replaceAll("&#8211; Terms &#038; Conditions", "")}",
          style: TextStyle(
            color: staticDarkRed,
            fontSize: MediaQuery.of(context).size.width*0.06,fontWeight: FontWeight.bold,),
        ),
      leading: GestureDetector(
        onTap: (){
          Navigator.of(context).pop();

        },child: Icon(Icons.arrow_back,color: Colors.black,),
      ),),
      body: Column(
        children: [
          SizedBox(height: 10,),

          SizedBox(height: 10,),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(

                  width: MediaQuery.of(context).size.width,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      new Html(data:
                      Global.activePage!.content!.rendered ??"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,\n \n and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: {
                          "p": Style(
                              textAlign: TextAlign.justify,
                              fontSize: FontSize.large

                          ),
                        },

                      ),
                    ],
                  ),
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}
