import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

class CustomPainterPage extends StatefulWidget {
  @override
  _CustomPainterPageState createState() => _CustomPainterPageState();
}

class _CustomPainterPageState extends State<CustomPainterPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Snowflake> snowflakes = List.generate(100, (index) => Snowflake());

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: "CustomPainter",
      body: Center(
        child: Container(
          // constraints: BoxConstraints.expand(),//铺满全屏 BoxConstraints.expand()的内部实现就是double.infinity。
          width: double.infinity,
          //跟上面的一样，也是铺满全屏的意思。
          height: double.infinity,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              snowflakes.forEach((snowflakes) {
                snowflakes.fall();
              });
              return CustomPaint(
                painter: MyPainter(snowflakes),
              );
            },
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.lightBlue,
                Colors.white,
              ],
              stops: [0.0, 0.7, 0.95],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  List<Snowflake> snowflakes;

  MyPainter(this.snowflakes);

  var whitePaint = Paint()..color = Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(size.center(Offset(0, 140)), 60, whitePaint);
    canvas.drawOval(Rect.fromCenter(center: size.center(Offset(0, 300)), width: 200, height: 240), whitePaint);
    snowflakes.forEach((snowflake) {
      canvas.drawCircle(Offset(snowflake.x, snowflake.y), snowflake.radius, whitePaint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 用来处理是否需要重绘，重绘返回true，否则返回false。
    return true;
  }
}

class Snowflake {
  double x = Random().nextDouble() * 400;
  double y = Random().nextDouble() * 800;
  double radius = Random().nextDouble() * 2 + 2;
  double velocity = Random().nextDouble() * 2 + 2;

  fall() {
    y += velocity;
    if (y > 800) {
      y = 0;
      x = Random().nextDouble() * 400;
      radius = Random().nextDouble() * 2 + 2;
      velocity = Random().nextDouble() * 2 + 2;
    }
  }
}
