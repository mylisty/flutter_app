/// @ProjectName: flutter_app
/// @Description: 
/// @Author: maoShengTao
/// @CreateDate: 2021/7/8 9:59 上午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/7/8 9:59 上午
///  @UpdateRemark: 更新说明
import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaveLoadingWidget extends StatefulWidget {
  final String text;

  final double fontSize;

  final Color backgroundColor;

  final Color foregroundColor;

  final Color waveColor;

  WaveLoadingWidget(
      {@required this.text,
        @required this.fontSize,
        @required this.backgroundColor,
        @required this.foregroundColor,
        @required this.waveColor}) {
    assert(text != null && text.length == 1);
    assert(fontSize != null && fontSize > 0);
  }

  @override
  _WaveLoadingWidgetState createState() => _WaveLoadingWidgetState(
    text: text,
    fontSize: fontSize,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    waveColor: waveColor,
  );
}

class _WaveLoadingWidgetState extends State<WaveLoadingWidget>
    with SingleTickerProviderStateMixin {
  final String text;

  final double fontSize;

  final Color backgroundColor;

  final Color foregroundColor;

  final Color waveColor;

  AnimationController controller;

  Animation<double> animation;

  _WaveLoadingWidgetState(
      {@required this.text,
        @required this.fontSize,
        @required this.backgroundColor,
        @required this.foregroundColor,
        @required this.waveColor});

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
          print("dismissed");
          break;
        case AnimationStatus.forward:
          print("forward");
          break;
        case AnimationStatus.reverse:
          print("reverse");
          break;
        case AnimationStatus.completed:
          print("completed");
          break;
      }
    });

    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller)
      ..addListener(() {
        setState(() => {});
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WaveLoadingPainter(
        text: text,
        fontSize: fontSize,
        animatedValue: animation.value,
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

  //要显示的文本
  final String text;

  //字体大小
  final double fontSize;

  final double animatedValue;

  final Color backgroundColor;

  final Color foregroundColor;

  final Color waveColor;

  WaveLoadingPainter(
      {this.text,
        this.fontSize,
        this.animatedValue,
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

    _drawText(canvas: canvas, side: side, colors: backgroundColor);

    _circlePath.reset();
    _circlePath.addArc(Rect.fromLTWH(0, 0, side, side), 0, 2 * pi);

    double waveWidth = side * 0.8;
    double waveHeight = side / 6;
    _wavePath.reset();
    _wavePath.moveTo((animatedValue - 1) * waveWidth, radius);
    for (double i = -waveWidth; i < side; i += waveWidth) {
      _wavePath.relativeQuadraticBezierTo(
          waveWidth / 4, -waveHeight, waveWidth / 2, 0);
      _wavePath.relativeQuadraticBezierTo(
          waveWidth / 4, waveHeight, waveWidth / 2, 0);
    }
    _wavePath.relativeLineTo(0, radius);
    _wavePath.lineTo(-waveWidth, side);
    _wavePath.close();

    var combine = Path.combine(PathOperation.intersect, _circlePath, _wavePath);
    canvas.drawPath(combine, _paint);

    canvas.clipPath(combine);
    _drawText(canvas: canvas, side: side, colors: foregroundColor);
  }

  void _drawText({Canvas canvas, double side, Color colors}) {
    ParagraphBuilder pb = ParagraphBuilder(ParagraphStyle(
      textAlign: TextAlign.center,
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 0,
    ));
    pb.pushStyle(ui.TextStyle(color: colors ?? defaultColor));
    pb.addText(text);
    ParagraphConstraints pc = ParagraphConstraints(width: fontSize ?? 0);
    Paragraph paragraph = pb.build()..layout(pc);
    canvas.drawParagraph(
        paragraph,
        Offset(
            (side - paragraph.width) / 2.0, (side - paragraph.height) / 2.0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}