import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';

class customtext extends StatelessWidget {

  final String title;
  final Color titleclr;



  customtext({this.title, this.titleclr,});

  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width*0.8,
        child: Text(title,textAlign: TextAlign.justify,style:TextStyle(
          color: titleclr,fontSize: 16,fontWeight: FontWeight.w700
        ),));
  }
}
