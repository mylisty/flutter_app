import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/7/6 11:10 上午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/7/6 11:10 上午
///  @UpdateRemark: 更新说明
// https://www.jianshu.com/p/5982e2322f3b 贝塞尔曲线 学习
class CanvasPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CanvasPageState();
  }
}

// https://blog.csdn.net/tianzhilan0/article/details/107692508
class _CanvasPageState extends State<CanvasPage> {
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
      ..style = PaintingStyle.stroke
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
        -270 * (pi / 180),
        90 * (pi / 180),
        false,
        paint);
    paint.strokeWidth = 2;
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: 65),
        -240 * (pi / 180), // 开始弧度位置
        300 * (pi / 180),// 弧度大小
        false,
        paint);
    paint.strokeWidth = 1;
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: 60),
        -240 * (pi / 180),
        300 * (pi / 180),
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
