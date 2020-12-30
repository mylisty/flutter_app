import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

//  https://flutter.cn/docs/development/ui/animations/tutorial 学习
class _AnimationState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          new RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogApp(),
                ),
              );
            },
            color: Colors.lightBlue,
            child: Text(
              "CurvedAnimation",
              style: new TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// 基本用法
class LogApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogAppState();
  }
}

class _LogAppState extends State<LogApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 2), vsync: this); // vsync 资源优化
    animation =
        Tween<double>(begin: 0, end: 300).animate(controller) // Tween 变化值
          ..addListener(() {
            setState(() {});
          });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class ShakeCurve extends Curve {
  // 曲线
  @override
  double transform(double t) {
    return sin(t * pi * 2);
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
