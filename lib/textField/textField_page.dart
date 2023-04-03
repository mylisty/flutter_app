import 'dart:collection';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/base/base_page.dart';

import '../res_colours.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/7/9 1:19 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/7/9 1:19 下午
///  @UpdateRemark: 更新说明
/*const TextField({
Key key,
this.controller,    //编辑框的控制器，跟文本框的交互一般都通过该属性完成，如果不创建的话默认会自动创建
this.focusNode,  //用于管理焦点
this.decoration = const InputDecoration(),   //输入框的装饰器，用来修改外观
TextInputType keyboardType,   //设置输入类型，不同的输入类型键盘不一样
this.textInputAction,   //用于控制键盘动作（一般位于右下角，默认是完成）// 可设置成下一项 TextInputAction.next,
this.textCapitalization = TextCapitalization.none,
this.style,    //输入的文本样式
this.textAlign = TextAlign.start,   //输入的文本位置
this.textDirection,    //输入的文字排列方向，一般不会修改这个属性
this.autofocus = false,   //是否自动获取焦点
this.obscureText = false,   //是否隐藏输入的文字，一般用在密码输入框中
this.autocorrect = true,   //是否自动校验
this.maxLines = 1,   //最大行
this.maxLength,   //能输入的最大字符个数
this.maxLengthEnforced = true,  //配合maxLength一起使用，在达到最大长度时是否阻止输入
this.onChanged,  //输入文本发生变化时的回调
this.onEditingComplete,   //点击键盘完成按钮时触发的回调，该回调没有参数，(){}
this.onSubmitted,  //同样是点击键盘完成按钮时触发的回调，该回调有参数，参数即为当前输入框中的值。(String){}
this.inputFormatters,   //对输入文本的校验
this.enabled,    //输入框是否可用
this.cursorWidth = 2.0,  //光标的宽度
this.cursorRadius,  //光标的圆角
this.cursorColor,  //光标的颜色
this.keyboardAppearance,
this.scrollPadding = const EdgeInsets.all(20.0),
this.dragStartBehavior = DragStartBehavior.down,
this.enableInteractiveSelection,
this.onTap,    //点击输入框时的回调(){}
this.buildCounter,
})*/

/*InputDecoration({
this.icon,    //位于装饰器外部和输入框前面的图片
this.labelText,  //用于描述输入框，例如这个输入框是用来输入用户名还是密码的，当输入框获取焦点时默认会浮动到上方，
this.labelStyle,  // 控制labelText的样式,接收一个TextStyle类型的值
this.helperText, //辅助文本，位于输入框下方，如果errorText为空的话，则helperText会显示
this.helperStyle, //helperText的样式
this.hintText,  //提示文本，位于输入框内部
this.hintStyle, //hintText的样式
this.hintMaxLines, //提示信息最大行数
this.errorText,  //错误信息提示
this.errorStyle, //errorText的样式
this.errorMaxLines,   //errorText最大行数
this.hasFloatingPlaceholder = true,  //labelText是否浮动，默认为true，修改为false则labelText在输入框获取焦点时不会浮动且不显示
this.isDense,   //改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小
this.contentPadding, //内间距
this.prefixIcon,  //位于输入框内部起始位置的图标。
this.prefix,   //预先填充的Widget,跟prefixText同时只能出现一个
this.prefixText,  //预填充的文本，例如手机号前面预先加上区号等
this.prefixStyle,  //prefixText的样式
this.suffixIcon, //位于输入框后面的图片,例如一般输入框后面会有个眼睛，控制输入内容是否明文
this.suffix,  //位于输入框尾部的控件，同样的不能和suffixText同时使用
this.suffixText,//位于尾部的填充文字
this.suffixStyle,  //suffixText的样式
this.counter,//位于输入框右下方的小控件，不能和counterText同时使用
this.counterText,//位于右下方显示的文本，常用于显示输入的字符数量
this.counterStyle, //counterText的样式
this.filled,  //如果为true，则输入使用fillColor指定的颜色填充
this.fillColor,  //相当于输入框的背景颜色
this.errorBorder,   //errorText不为空，输入框没有焦点时要显示的边框
this.focusedBorder,  //输入框有焦点时的边框,如果errorText不为空的话，该属性无效
this.focusedErrorBorder,  //errorText不为空时，输入框有焦点时的边框
this.disabledBorder,  //输入框禁用时显示的边框，如果errorText为空的话，该属性有效
this.enabledBorder,  //输入框可用时显示的边框， errorText为空的话，该属性有效
this.border, //正常情况下的border
this.enabled = true,  //输入框是否可用
this.semanticCounterText,
this.alignLabelWithHint,
})*/
// ignore: must_be_immutable
class TextFieldPage extends BasePage {
  var result = 'Navigator';
  String platformVersion = 'Unknown';
  TextEditingController rechargeController = TextEditingController();
  var fa = new FocusNode();
  var fa1 = new FocusNode();
  var fa2 = new FocusNode();

  TextFieldPage(String title, String subTitle) : super(title, subTitle);
// 全局key用来获取form表单组件
  String userName;
  String passWord;
  GlobalKey<FormState> loginkey = new GlobalKey<FormState>();

  static bool isLoginPassword(String input) {
    RegExp mobile = new RegExp(r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$");
    return mobile.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {


    // https://book.flutterchina.club/chapter3/input_and_form.html#_3-7-2-%E8%A1%A8%E5%8D%95form
    // checkBox flutter_sujian_select 1.0.1
    return new Scaffold(
      resizeToAvoidBottomInset: true, // 防止底部被键盘遮挡
      appBar: new AppBar(
        title: new Text('$result'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            Container(
              child: ListView(
                children: [
                  new TextField(
                    focusNode: fa,
                    controller: rechargeController,
                    //    maxLength: 30,//最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                    //最大行数
                    maxLines: 1,
                    //是否自动更正
                    autocorrect: true,
                    onSubmitted: (str) {
                      print("sub");
                    },
                    // 键盘 提交按钮监听
                    textInputAction: TextInputAction.send,
                    /*是否自动对焦
                  autofocus: false,
                  // 秘密隐藏
                  obscureText: false,*/
                    //是否是密码
                    textAlign: TextAlign.start,
                    //文本对齐方式
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    //输入文本的样式
                    onChanged: (text) {
                      //内容改变的回调
                      print('change $text');
                    },
                    cursorWidth: 2.0,
                    cursorColor: Colors.black87,
                    //光标颜色,
                    dragStartBehavior: DragStartBehavior.down,
                    // this.dragStartBehavior = DragStartBehavior.down,
                    scrollPadding: EdgeInsets.all(20),
                    inputFormatters: [
                      // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // 只允许输入样式
                      FilteringTextInputFormatter.deny(RegExp("[0-9]")),
                      // 不允许的样式
                      // 不允许输入的
                      LengthLimitingTextInputFormatter(5)
                    ],
                    decoration: new InputDecoration(
                        enabled: true,
                        labelText: "输入账户",
                        // 悬浮提示\
                        hintText: "phone",
                        hintStyle: new TextStyle(fontSize: 16),
                        // prefixIcon: Icon(Icons.phone_android),// 左侧内图标
                        // 左侧外图标
                        icon: Icon(Icons.phone_android),
                        suffixIcon: GestureDetector(
                          child: Icon(Icons.navigate_next),
                          onTap: () {
                            print("print clcik");
                          },
                        ),
                        errorText: null,
                        // 设置为null errorBorder 失效
                        /*   border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.red)
                        ),*/
//                  border: new UnderlineInputBorder( //OutlineInputBorder 边框
//                      borderSide: BorderSide(color: Colors.black87 ),
//                      borderRadius: BorderRadius.circular(7.0)
//                  ),
                        border: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)),
                        // 聚焦时
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)),
                        // 未聚焦时
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 143,
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black12, width: 1)),
                    child: TextField(
                      maxLines: 5,
                      maxLength: 200,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "输入内容",
                          counterStyle: TextStyle(color: Colors.blue),
                          border: InputBorder.none
                          /* border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))*/
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      focusNode: fa2,
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      autofillHints: <String>[AutofillHints.password],
                      scrollPadding: EdgeInsets.all(25),
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        filled: true,
                        isCollapsed: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 29, vertical: 11),
                        fillColor: CommonColors.color_99,
                        hintText: "请输入域帐号密码",
                        hintStyle: TextStyle(
                            fontSize: 14, color: CommonColors.text_33),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Container(
                    height: 56.0,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black12, width: 1)),
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: double.infinity,
                            margin: EdgeInsets.only(top: 8),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "¥",
                              style: TextStyle(
                                  fontSize: 24, color: CommonColors.text_66),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: CommonColors.text_33, fontSize: 48),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    width: 200,
                    child: TextField(
                      //    maxLength: 30,//最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                      maxLines: 1,
                      //最大行数
                      autocorrect: true,
                      //是否自动更正
                      autofocus: false,
                      //是否自动对焦
                      obscureText: false,
                      //是否是密码
                      textAlign: TextAlign.start,
                      //文本对齐方式
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      //输入文本的样式
                      //| inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
                      inputFormatters: [
                        // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // 只允许输入样式
                        FilteringTextInputFormatter.deny(RegExp("[0-9]")),
                        // 不允许输入的
                        LengthLimitingTextInputFormatter(5)
                      ],
                      onChanged: (text) {
                        //内容改变的回调
                        print('change $text');
                      },
                      cursorWidth: 2.0,
                      cursorColor: Colors.black87,
                      //光标颜色,
                      dragStartBehavior: DragStartBehavior.down,
                      // this.dragStartBehavior = DragStartBehavior.down,
                      scrollPadding: EdgeInsets.all(20),
                      decoration: new InputDecoration(
                          hintText: "搜索",
                          hintStyle: new TextStyle(fontSize: 16),
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        fa2.requestFocus();
                      },
                      child: Text("test")),
                  new Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    // padding 用法  EdgeInsets.all上下左右20
                    child: new Form(
                      key: loginkey,
                      child: new Column(
                        children: <Widget>[
                          new TextFormField(
                            decoration: new InputDecoration(labelText: "请输入用户名"),
                            onSaved: (value) {
                              userName = value;
                            },
                            onFieldSubmitted: (value) {},
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(labelText: '请输入密码'),
                            obscureText: true,
                            validator: (value) {
                              return isLoginPassword(value) ? "6~16位数字和字符组合" : null;
                              // return value.length < 6 ? "密码不够六位" : null;
                            },
                            onSaved: (value) {
                              passWord = value;
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    width: 340,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {
                        // 读取from状态
                        var loginForm = loginkey.currentState;
                        if (loginForm.validate()) {
                          loginForm.save();
                          print('username ' + userName + "password" + passWord);
                        }
                      },
                      child: Text(
                        "登录",
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(bottom: 60), //重点在这里 可以将底部的顶出来
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black12, width: 1)),
                child: TextField(
                  maxLines: 1,
                  maxLength: 200,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "输入内容",
                      counterStyle: TextStyle(color: Colors.blue),
                      border: InputBorder.none
                      /* border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0))*/
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  String title;
  String dec;

  SecondScreen({Key key, @required this.title, @required this.dec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Navigator'),
      ),
      body: new Center(
        child: new ElevatedButton(
            child: Text(title),
            onPressed: () {
              //  Navigator.pop(context,dec);
            }),
      ),
    );
  }
}


