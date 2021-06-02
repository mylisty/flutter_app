import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/base/base_page.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/24 9:19 上午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/24 9:19 上午
///  @UpdateRemark: 更新说明

class ButtonPage extends BasePage {
  ButtonPage(String title) : super(title);

  /*
      textStyle        //字体
      backgroundColor  //背景色
      foregroundColor  //字体颜色
      overlayColor      // 高亮色，按钮处于focused, hovered, or pressed时的颜色
      shadowColor     // 阴影颜色
      elevation        // 阴影值
      padding         // padding
      minimumSize    //最小尺寸
      side            //边框
      shape          //形状
      mouseCursor   //鼠标指针的光标进入或悬停在此按钮的[InkWell]上时
      visualDensity    // 按钮布局的紧凑程度
      tapTargetSize   // 响应触摸的区域
      animationDuration//[shape]和[elevation]的动画更改的持续时间。
      enableFeedback // 检测到的手势是否应提供声音和/或触觉反馈。例如，在Android上，点击会产生咔哒声，启用反馈后，长按会产生短暂的振动。通常，组件默认值为true。
   */
  @override
  Widget buildWidget(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              TextButton(
                clipBehavior: Clip.hardEdge,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(30)),
                  overlayColor: MaterialStateProperty.all(Color(0xff31C27C)),
                  // 点击的颜色
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  // 背景颜色
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  // 字体颜色
                  // side: MaterialStateProperty.all(BorderSide(width: 1,color: Colors.blue)),//边框
                  // 阴影
                  shadowColor: MaterialStateProperty.all(Colors.amberAccent),
                  // 阴影高度
                  elevation: MaterialStateProperty.all(10),
                  // shape: MaterialStateProperty.all(
                  //   const RoundedRectangleBorder(
                  //       side: BorderSide.none,
                  //       borderRadius: BorderRadius.all(Radius.circular(20))),
                  // ),
                /*  shape: MaterialStateProperty.all(CircleBorder(
                      side: BorderSide(
                    //设置 界面效果
                    color: Colors.green,
                    width: 280.0,
                    style: BorderStyle.none,
                  ))),*/
                  //菱角
                  shape: MaterialStateProperty.all(BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),

                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 44)), //字体大小
                ),
                /*ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffFFF8E5)),
                  //背景颜色
                  foregroundColor: MaterialStateProperty.all(Color(0xffB85F23)),
                  //字体颜色
                  overlayColor: MaterialStateProperty.all(Color(0xffFFF8E5)),
                  // 高亮色
                  shadowColor: MaterialStateProperty.all(Color(0xffffffff)),
                  //阴影颜色
                  elevation: MaterialStateProperty.all(0),
                  //阴影值
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 12)),
                  //字体
                  side: MaterialStateProperty.all(
                      BorderSide(width: 1, color: Color(0xffffffff))),

                  //边框 半圆
                        shape: MaterialStateProperty.all(
                            StadiumBorder(
                                side: BorderSide(
                                  //设置 界面效果
                                  style: BorderStyle.solid,
                                  color: Color(0xffFF7F24),
                                )
                            )
                        ),
                ),*/
                onPressed: () {},
                child: Text("textButton"),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text("outLineButton"),
              ),
              ElevatedButton(
                onPressed: () {
                  print("输出${116 * 2000}");
                },
                child: Text("elevatedButton"),
              ),
              IconButton(icon: Icon(Icons.add), onPressed: () {}),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text("test"),
          )
        ],
      ),
    );
  }
/*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("button"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("data"),
          ),
        ],
      ),
    );
  }*/
}
