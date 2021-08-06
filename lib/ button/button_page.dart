import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/base/base_page.dart';
import 'package:flutter_app/watermark/workmark_page.dart';
import 'package:get/get.dart';

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
                onPressed: () {
                /*  Get.toNamed("/water",arguments: {"a":12},).then((value) => {
                    print("aaaa back ${value.toString()}"),
                  });*/

                 /* Navigator.of(context).pushNamed("/water",
                      arguments: {"aaaa": "1123"}).then((value) {
                    print("aaaaa ${value.toString()}");
                  });*/
                  // 删除一个路由。
                  // Get.removeRoute()

//反复返回，直到表达式返回真。
//                   Get.until()

// 转到下一条路由，并删除所有之前的路由，直到表达式返回true。
//                   Get.offUntil()

// 转到下一个命名的路由，并删除所有之前的路由，直到表达式返回true。
//                   Get.offNamedUntil()*/
                },
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
              /*  Container(
                width: 280,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(
                      Color(0xFF64EDAC),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF00D1CD),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(48))),
                    ),
                  ),
                  onPressed: () {
                    _logIn();
                  },
                  child: Text(
                    "登录",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),*/
              /*    new Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xff25D1D1),
                        Color(0xff3BE6AD),
                        Color(0xff20DDAA)
                      ],
                    ),
                    // 渐变色
                    borderRadius: BorderRadius.circular(25)),
                child: new Material(
                  //INK可以实现装饰容器
                  child: new Ink(
                    //用ink圆角矩形
                    // color: Colors.red,
                    decoration: new BoxDecoration(
                      //不能同时”使用Ink的变量color属性以及decoration属性，两个只能存在一个
                      color: Colors.purple,
                      //设置圆角
                      borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
                    ),
                    child: new InkWell(
                      //圆角设置,给水波纹也设置同样的圆角
                      //如果这里不设置就会出现矩形的水波纹效果
                      borderRadius: new BorderRadius.circular(25.0),
                      //设置点击事件回调
                      onTap: () {

                      },
                      child: new Container(
                        width: 300.0,
                        height: 50.0,
                        //设置child 居中
                        alignment: Alignment(0, 0),
                        child: Text("登录",style: TextStyle(color: Colors.white,fontSize: 16.0),),
                      ),
                    ),
                  ),
                ),
              ),*/
              Container(
                width: 280,
                height: 48,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xff25D1D1),
                        Color(0xff3BE6AD),
                        Color(0xff20DDAA)
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff3BE6AD),
                        spreadRadius: 1.0,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                    // 渐变色
                    borderRadius: BorderRadius.circular(25)),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: Colors.transparent,
                  // 设为透明色
                  elevation: 0,
                  // 正常时阴影隐藏
                  highlightElevation: 0,
                  // 点击时阴影隐藏
                  onPressed: () {},
                  child: Text(
                    '登 录',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Container(
                width: 280,
                height: 48,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xff25D1D1),
                        Color(0xff3BE6AD),
                        Color(0xff20DDAA)
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff3BE6AD),
                        spreadRadius: 1.0,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                    // 渐变色
                    borderRadius: BorderRadius.circular(25)),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                    shadowColor: MaterialStateProperty.all(
                      Color(0xff3BE6AD),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                  ),
                  // 点击时阴影隐藏
                  onPressed: () {},
                  child: Text(
                    '登 录',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              /*RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22.0))),
                padding: const EdgeInsets.all(0.0),
                child: Material(
                  child: InkWell(
                    child: Container(
                      width: 260,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xff25D1D1),
                            Color(0xff3BE6AD),
                            Color(0xff20DDAA)
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child:Text(
                        '登录',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                splashColor: Color(0xff20DDAA),
              ),*/
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
