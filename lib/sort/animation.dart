import 'dart:math';
import 'dart:math' as math;
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
  Animation<double> _animation;
  AnimationController controller;
  int count = 3;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 2), vsync: this); // vsync 资源优化
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        print("aaa $status");
        if (status == AnimationStatus.completed) {
        }
      });
    /*  Tween<double>(begin: 150, end: 300).animate(controller) // Tween 变化值
          ..addStatusListener((status) {
            print("aaa $status");
            if (status == AnimationStatus.completed) {
              controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              controller.forward();
            }
          });*/
    /*  ..addListener(() { // 接入  AnimatedWidget 就不要了
            setState(() {});
          });*/
    _animation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    )..addStatusListener((status) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          new RaisedButton(
            onPressed: () {
//             controller.forward();
              controller.forward();
            },
            color: Colors.lightBlue,
            child: Text(
              "开始动画",
              style: new TextStyle(color: Colors.black),
            ),
          ),
          new RaisedButton(
            onPressed: () {
              count++;
            },
            color: Colors.lightBlue,
            child: Text(
              "+",
              style: new TextStyle(color: Colors.black),
            ),
          ),
          new RaisedButton(
            onPressed: () {
              count--;
              if(count == 0){
                controller.reset();
                controller.forward();
              }
            },
            color: Colors.lightBlue,
            child: Text(
              "-",
              style: new TextStyle(color: Colors.black),
            ),
          ),
          Offstage(
            offstage: count < 0,
            child: RotationTransition(
              turns: _animation,
              child: AnimatedLogo3(
                animation: animation,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*GrowTransition(
      child: FlutterLogo(),
      animation: animation,
    )*/ /*AnimatedLogo(animation: animation,)*/
/*Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );*/

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

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const GrowTransition({Key key, this.animation, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: animation.value,
            width: animation.value,
            child: child,
          ),
          child: child,
        ),
      );
}

class AnimatedLogo2 extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  AnimatedLogo2({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

class AnimatedLogo3 extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 1, end: 0);

//  static final _offset  = Tween<Offset>(begin: Offset.zero, end: Offset(1,0));
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  AnimatedLogo3({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: GestureDetector(
        onTap: () {
          print("object");
        },
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Padding(
            padding: EdgeInsets.only(left: _sizeTween.evaluate(animation)),
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addStatusListener((status) {
        print("status $status");
      });
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutQuad,
    ));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: _offsetAnimation,
        child: RotationTransition(
          turns: _animation,
          child: InkWell(
            child: FlutterLogo(size: 150.0),
            onTap: () {
              print("object");
              _controller.forward();
            },
          ),
        ),
      ),
    );
  }
}
