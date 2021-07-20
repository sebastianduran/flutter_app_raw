import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'dart:typed_data';

class DrawScreen extends StatefulWidget {
  DrawScreen({Key? key}) : super(key: key);

  @override
  State<DrawScreen> createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  //List<TouchPoints> points = List();
  List<double> _xs = [];
  List<double> _ys = [];
  List<Offset> _position = [];

  _onTapDown(TapDownDetails details) {
    var dx = details.globalPosition.dx;
    var dy = details.globalPosition.dy;

    setState(() {
      _xs.add(dx);
      _ys.add(dy);
      _position.add(new Offset(dx, dy));
    });
    print(_position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey,
            child: GestureDetector(
              onTapDown: (TapDownDetails details) {
                print("object");
                _onTapDown(details);
              },
              child: Row(
                children: [
                  CustomPaint(
                    size: const Size(200, 400),
                    painter: PolygonDrawer(
                      _position,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _position.add(_position[0]);
                  });
                },
                child: Text("Complete"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _position = [];
                  });
                },
                child: Text("Erase"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PolygonDrawer extends CustomPainter {
  List<Offset> position;
  PolygonDrawer(this.position);

  @override
  void paint(Canvas canvas, Size size) {
    final pointMode = ui.PointMode.polygon;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, position, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TouchPoints {
  //Paint paint;
  //Offset points;
  //TouchPoints({this.points, this.paint});
}
