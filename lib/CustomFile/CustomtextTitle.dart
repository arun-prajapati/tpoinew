import 'package:flutter/material.dart';

class customtext extends StatelessWidget {
  final String? title;
  final Color? titleclr;

  customtext({
    this.title,
    this.titleclr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Text(
          title!,
          textAlign: TextAlign.left,
          style: TextStyle(color: titleclr, fontSize: 16),
        ));
  }
}
