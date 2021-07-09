import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/7/6 11:10 上午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/7/6 11:10 上午
///  @UpdateRemark: 更新说明
// https://www.jianshu.com/p/5982e2322f3b 贝塞尔曲线 学习
// https://juejin.cn/post/6981110738584600607
class CanvasPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CanvasPageState2();
  }
}

// https://blog.csdn.net/tianzhilan0/article/details/107692508
class _CanvasPageState2 extends State<CanvasPage2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var winH = MediaQuery.of(context).size.height;
    var winW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: CustomPaint(
        size: Size(winW, winH),
        painter: M(),
      ),
    );
  }
}

class M extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
/*    Paint paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.pink
      ..blendMode = BLENDMODE.colorDodge
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;*/
    // isAntiAlias: 是否抗锯齿
    // color: 画笔颜色
    // strokeWidth: 画笔宽度 - style: 样式
    // PaintingStyle.fill 默认 填充
    // PaintingStyle.stroke 线
    // strokeCap: 定义画笔端点形状
    // StrokeCap.butt 无形状(默认)
    // StrokeCap.round 圆形
    // StrokeCap.square 正方形
    // strokeJoin: 定义线段交接时的形状
    Paint paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    Path generatePath(double x, double y) {
      Path path = new Path();
      path.moveTo(x, y);
      path.lineTo(x + 100, y + 100);
      path.lineTo(x + 150, y + 80);
      path.lineTo(x + 100, y + 200);
      path.lineTo(x, y + 100);
      return path;
    }

    // canvas.drawPath(generatePath(100, 100), paint);
    // canvas.rotate(10 * 1 / 180);
    // canvas.drawPath(generatePath(100, 150), paint);
    // canvas.drawPath(generatePath(100, 500), paint);
    // canvas.drawLine(Offset(30.0, 30.0), Offset(200 - 30.0, 30.0), paint);
    // canvas.drawCircle(Offset(30.0, 30.0),40, paint);
    // canvas.drawColor(Colors.orange, BlendMode.srcIn);
    /*canvas.drawPath(
        Path()
          ..arcTo(Rect.fromCircle(center: Offset(70, 270), radius: 50), 0.0, 23,
              false),
        Paint()
          ..color = Colors.red
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);*/

/*    canvas.drawPath(
        Path()
          ..arcTo(Rect.fromCircle(center: Offset(100, -20), radius: 500), 0.0, 2,
              true),
        Paint()
          ..color = Colors.red
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(150.0, 50.0), radius: 50.0),
        0.0,
        5.8,
        false,
        Paint()
          ..color = Colors.green
          ..strokeWidth = 6.0
          ..style = PaintingStyle.fill);*/
    /*canvas.drawPath(
        Path()
          ..moveTo(0, 55.0)
          ..addOval(Rect.fromLTWH(55.0, 0, 15, 55.0)),
        Paint()
          ..color = Colors.red
          ..strokeWidth = 3.0
          ..style = PaintingStyle.fill);*/

    /*Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
    paint.color = Colors.white;*/
    // 1度 = pi / 180，所以起始度数 = 度数 * pi / 180。
    int pi = 3;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius:50),
        -30 * (pi / 180),
        -130 * (pi / 180),
        false,
        paint);
    // /*paint.strokeWidth = 2;
    // canvas.drawArc(
    //     Rect.fromCircle(
    //         center: Offset(size.width / 2, size.height / 2), radius: 65),
    //     -240 * (pi / 180), // 开始弧度位置
    //     300 * (pi / 180),// 弧度大小
    //     false,
    //     paint);
    // paint.strokeWidth = 1;
    // canvas.drawArc(
    //     Rect.fromCircle(
    //         center: Offset(size.width / 2, size.height / 2), radius: 60),
    //     -240 * (pi / 180),
    //     300 * (pi / 180),
    //     false,
    //     paint);*/
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LCTabbarController2 extends StatefulWidget {
  LCTabbarController2({Key key}) : super(key: key);

  @override
  _LCTabbarControllerState2 createState() => _LCTabbarControllerState2();
}

class _LCTabbarControllerState2 extends State<LCTabbarController2> {
  int currentIndex;
  final pages = [MyApp3(), MyApp3(), MyApp3(), MyApp3()];
  List titles = ["首页", "发现", "消息", "我的"];

  List normalImgUrls = [
   "https://flutter.github.io/assets-for-api-docs/assets/widgets/container_b.png",
   "https://flutter.github.io/assets-for-api-docs/assets/widgets/container_b.png",
   "https://flutter.github.io/assets-for-api-docs/assets/widgets/container_b.png",
   "https://flutter.github.io/assets-for-api-docs/assets/widgets/container_b.png",

  ];
  List selectedImgUrls = [
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/container_b.png",
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/container_b.png",
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/container_b.png",
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/container_b.png",
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double /**/itemWidth = MediaQuery.of(context).size.width / 5;

    return Scaffold(
      appBar: AppBar(
        title: Text("底部导航栏"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        children: [
          Container(
            width: 120,
            height: 120,
            child: WaveLoadingWidget(
              backgroundColor:  Colors.white,
              foregroundColor: Colors.white,
              waveColor:  Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 45,left: 3),
            alignment: Alignment.center,
            width: 120,
            height: 120,
            child: Container(
              width: 49,
              height: 49,
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  print("你点击了ADD");
                  //调整进入Addpage()
                },
                elevation: 5,
                backgroundColor: Colors.yellow,
              ),
            ),
          )
        ],
      ) ,
      bottomNavigationBar: BottomAppBar(
        child: Row(children: <Widget>[
          SizedBox(height: 49, width: itemWidth, child: tabbar(0)),
          SizedBox(height: 49, width: itemWidth, child: tabbar(1)),
          SizedBox(
            height: 49,
            width: itemWidth,
          ),
          SizedBox(height: 49, width: itemWidth, child: tabbar(2)),
          SizedBox(height: 49, width: itemWidth, child: tabbar(3)),
        ]),
      ),
      body: pages[currentIndex],
    );
  }

  // 自定义BottomAppBar
  Widget tabbar(int index) {
    //设置默认未选中的状态
    TextStyle style = TextStyle(fontSize: 12, color: Colors.black);
    String imgUrl = normalImgUrls[index];
    if (currentIndex == index) {
      //选中的话
      style = TextStyle(fontSize: 13, color: Colors.blue);
      imgUrl = selectedImgUrls[index];
    }
    //构造返回的Widget
    Widget item = Container(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(imgUrl, width: 25, height: 25),
            Text(
              titles[index],
              style: style,
            )
          ],
        ),
        onTap: () {
          if (currentIndex != index) {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
    );
    return item;
  }
}

class WaveLoadingWidget extends StatefulWidget {
  final Color backgroundColor;

  final Color foregroundColor;

  final Color waveColor;

  WaveLoadingWidget({@required this.backgroundColor,
    @required this.foregroundColor,
    @required this.waveColor});

  @override
  _WaveLoadingWidgetState createState() =>
      _WaveLoadingWidgetState(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        waveColor: waveColor,
      );
}
class _WaveLoadingWidgetState extends State<WaveLoadingWidget>
    with SingleTickerProviderStateMixin {

  final Color backgroundColor;

  final Color foregroundColor;

  final Color waveColor;

  AnimationController controller;


  _WaveLoadingWidgetState(
      {
        @required this.backgroundColor,
        @required this.foregroundColor,
        @required this.waveColor});


  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WaveLoadingPainter(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        waveColor: waveColor,
      ),
    );
  }
}

class WaveLoadingPainter extends CustomPainter {
  //如果外部没有指定颜色值，则使用此默认颜色值
  static final Color defaultColor = Colors.lightBlue;

  //画笔对象
  var _paint = Paint();

  //圆形路径
  Path _circlePath = Path();

  //波浪路径
  Path _wavePath = Path();

  final Color backgroundColor;
  final Color foregroundColor;
  final Color waveColor;
  WaveLoadingPainter(
      {
        this.backgroundColor,
        this.foregroundColor,
        this.waveColor}) {
    _paint
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..strokeWidth = 3
      ..color = waveColor ?? defaultColor;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double side = min(size.width, size.height);
    double radius = side / 2.0;
    _circlePath.reset();
    _circlePath.addArc(Rect.fromLTWH(0, 0, side, side), 0, 4 * pi);
    double waveWidth = side * 0.8;
    double waveHeight = side / 6;
    _wavePath.reset();
    _wavePath.moveTo((-0.61) * waveWidth, radius+3);
    for (double i = -waveWidth; i < side; i += waveWidth) {
      _wavePath.relativeQuadraticBezierTo(
          waveWidth / 4, -waveHeight, waveWidth / 2, 0);
      _wavePath.relativeQuadraticBezierTo(
          waveWidth / 4, waveHeight, waveWidth / 2, 0);
    }
    _wavePath.relativeLineTo(0, radius+3);
    _wavePath.lineTo(-waveWidth, side);
    _wavePath.close();

    var combine = Path.combine(PathOperation.intersect, _circlePath, _wavePath);
    canvas.drawPath(combine, _paint);
    // canvas.clipPath(combine);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

