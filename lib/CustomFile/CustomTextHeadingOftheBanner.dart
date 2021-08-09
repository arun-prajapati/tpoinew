import 'package:flutter/material.dart';

class Customtextheader extends StatelessWidget {
  final String title;
  final Color titleclr;
  final Color bgcolor;


  Customtextheader({this.title, this.titleclr, this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(color: bgcolor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,textAlign: TextAlign.justify,style: TextStyle(
            color: titleclr,
          ),),
        ));
  }
}
