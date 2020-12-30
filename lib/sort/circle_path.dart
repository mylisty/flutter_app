
import 'dart:math';
import 'package:flutter/cupertino.dart';
///裁切的路径
class CirclePath extends CustomClipper<Path> {

  ///变化比率从0-1
  final double value;
  ///圆心中心点
  Offset centerOffset;
  CirclePath(this.value,{this.centerOffset});

  @override
  Path getClip(Size size) {
    var path = Path();
    ///半径的最大值并不是屏幕的宽或者高，而是屏幕的对角线长度
    double radius = value * sqrt(size.height * size.height + size.width * size.width);
    ///配置圆心
    if(centerOffset==null){
      centerOffset = Offset(size.width,size.height);
    }
    ///添加圆形路径
    path.addOval(Rect.fromCircle(center: centerOffset,radius: radius));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
     return true;
  }

}