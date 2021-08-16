import 'package:animated_list_view_scroll/animated_list_view_scroll.dart';
import 'package:flutter/material.dart';



class HomeA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedListViewScroll Demo"),
      ),
      body: AnimatedListViewScroll(
        itemCount: 1000,
        itemHeight: 60,
        animationOnReverse: true,
        animationDuration: Duration(milliseconds:400),
        itemBuilder: (context, index) {
          return AnimatedListViewItem(
            key: GlobalKey(),
            index: index,
            animationBuilder: (context, index, controller) {
              Animation<Offset> animation =
              Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
                  .animate(controller);
              return SlideTransition(
                position: animation,
                child: Card(
                  child: Text(index.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
