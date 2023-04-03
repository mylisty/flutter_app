import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'circle_path.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

//  https://flutter.cn/docs/development/ui/animations/tutorial 学习
// 跨页面切换的动效  https://flutter.cn/docs/cookbook/navigation/hero-animations 可以用hero
// https://medium.com/flutterdevs/cliprrect-clippath-in-flutter-4c41abe4e8 clipdemo
class _AnimationState extends State<AnimationPage> {
  GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          new ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogApp(),
                ),
              );
            },
            child: Text(
              "动画1",
              style: new TextStyle(color: Colors.white),
            ),
          ),
          new ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
            child: Text(
              "隐式动画",
              style: new TextStyle(color: Colors.white),
            ),
          ),
          new ElevatedButton(
            key: key,
            onPressed: () {
              Navigator.of(context).push(_createRoute(key));
            },
            child: Text(
              "page 切换动画",
              style: new TextStyle(color: Colors.white),
            ),
          ),
          new ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroApp(),
                ),
              );
            },
            child: Text(
              "hero Page change ",
              style: new TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen();
          }));
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0); // 0 x轴方向  1 y轴方向
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRoute(GlobalKey key) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1, 0); // 0 x轴方向  1 y轴方向
      var end = Offset.zero;
      var curve = Curves.ease;
      Offset offset1 = Offset.zero;
      if (key != null &&
          key.currentContext != null &&
          key.currentContext.findRenderObject() != null) {
        //获取position
        RenderBox renderBox = key.currentContext.findRenderObject();

        ///获取 Offset
        offset1 = renderBox.localToGlobal(Offset.zero);
      }
      var _sizeTween = Tween<double>(begin: 300, end: 0);
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: AnimatedContainer( // 无效待优化
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_sizeTween.evaluate(animation)),
          ),
          duration: _duration,
          child: child,
        ),
      );
    },
  );
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text('Page 2'),
        ),
      ),
    );
  }
}

const _duration = Duration(milliseconds: 2000);

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedContainerDemo extends StatefulWidget {
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  Color color;
  double borderRadius;
  double margin;

  @override
  void initState() {
    super.initState();
    color = Colors.deepPurple;
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: AnimatedContainer(
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                duration: _duration,
              ),
            ),
            ElevatedButton(
              child: Text('change'),
              onPressed: () => change(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerDemo(),
    );
  }
}

void main() {
  runApp(
    MyApp(),
  );
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
        if (status == AnimationStatus.completed) {}
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
          new ElevatedButton(
            onPressed: () {
//             controller.forward();
              controller.forward();
            },
            child: Text(
              "开始动画",
              style: new TextStyle(color: Colors.black),
            ),
          ),
          new ElevatedButton(
            onPressed: () {
              count++;
            },
            child: Text(
              "+",
              style: new TextStyle(color: Colors.black),
            ),
          ),
          new ElevatedButton(
            onPressed: () {
              count--;
              if (count == 0) {
                controller.reset();
                controller.forward();
              }
            },
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
