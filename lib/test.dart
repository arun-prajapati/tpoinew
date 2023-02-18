import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class animation extends StatefulWidget {
  @override
  animationState createState() => new animationState();
}

class animationState extends State<animation> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  bool upDown = true;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );

    _animation = new CurvedAnimation(
      parent: _controller!,
      curve: new Interval(0.0, 1.0, curve: Curves.linear),
    );

 
  }

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _width = logicalSize.width;
    final double _height = logicalSize.height;


    void _up(){
      setState((){
        if(upDown) {
          upDown = false;
          _controller!.forward(from: 0.0);
        } else {
          upDown = true;
          _controller!.reverse(from: 1.0);
        }
      });
    }

    return new Scaffold(
        body: new Stack(
            children: <Widget>[
              new Positioned(
                bottom: 0.0,
                child: new AnimatedBuilder(
                  animation: _animation!,
                  builder: (BuildContext? context, Widget? child) {
                    return new Container(
                      height: _height,
                      child: new CustomPaint(
                        painter: new Sky(_width, _height * _animation!.value),
                      ),
                    );
                  },
                ),
              ),
              new Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: new FloatingActionButton(
                    backgroundColor: new Color(0xFFE57373),
                    child: new Icon(Icons.add),
                    onPressed: (){
                      _up();
                    },
                  )
              )
            ]
        )
    );
  }
}

class Sky extends CustomPainter {
  final double _width;
  double _rectHeight;

  Sky(this._width, this._rectHeight);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      new Rect.fromLTRB(
          0.0, size.height - _rectHeight, this._width, size.height
      ),
      new Paint()..color = new Color(0xFF0099FF),
    );
  }

  @override
  bool shouldRepaint(Sky oldDelegate) {
    return _width != oldDelegate._width || _rectHeight != oldDelegate._rectHeight;
  }
}