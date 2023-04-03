import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/6/23 2:48 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/6/23 2:48 下午
///  @UpdateRemark: 更新说明

class MaterialPageTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPageState();
  }
}

class _MaterialPageState extends State<MaterialPageTest> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // 问题出现在这里 只要不设置center 并且图片要设置大小 就没有中间的横线了 安卓只要设置了大小就没问题了
            children: childe2(),
          ),
        ),
      ),
    );
  }

  List<Widget> childe2() {
    return <Widget>[
      Container(
        color: Colors.red,
        height: 20,
      ),
      Container(
        height: 135,
        child: new Image.asset(
          'assets/images/up_version.png',
          fit: BoxFit.fill,
        ),
      ),
      GestureDetector(
        child: new ClipOval(
          child: new SizedBox(
            width: 50,
            height: 50,
            child: new Image.asset(
              'assets/images/up_version.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        onTap: () {
          UpdateDialog.showUpdateDialog(context, '1.修复已知bug\n2.优化用户体验', false);
        },
      ),
      Container(
        height: 30,
        color: Colors.red,
      ),
      Container(
        height: 30,
        color: Colors.red,
      ),
      /* new CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/qr_zhilun.jpg"),
            ),
            new Container(
              width: 72.0,
              height: 72.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/ant_installment_icon.png",
                  ),
                ),
              ),
            ),
            new ClipRRect(
              borderRadius:
              new BorderRadius.all(new Radius.circular(100)),
              child: new Image.asset(
                "assets/images/qr_zhilun.jpg",
                width: 14,
                height: 8,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(11.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                new BorderRadius.all(new Radius.circular(50.0)),
//                      shape: BoxShape.circle
              ),
              child: Text("data"),
//                    transform: new Matrix4.rotationZ(0.3),
            )*/
    ];
  }

  List<Widget> children() {
    return [
      Container(
        color: Colors.red,
        height: 20,
      ),
      new Image(
        image: AssetImage("assets/images/up_version.png"),
        fit: BoxFit.fill,
      ),
      Container(
        color: Colors.red,
        height: 20,
      ),
      Container(
        color: Colors.red,
        height: 20,
      ),
      // Image.asset("assets/images/up_version.png"),
      Container(
        color: Colors.red,
        height: 20,
      ),
      Container(
        color: Colors.red,
        height: 20,
      ),
    ];
  }
}

///created by WGH
///on 2020/7/23
///description:版本更新提示弹窗
class UpdateDialog extends Dialog {
  final String upDateContent;
  final bool isForce;

  UpdateDialog({this.upDateContent, this.isForce});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 319,
                  height: 370,
                  child: Stack(
                    children: <Widget>[

                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 110),
                              child: Text('发现新版本',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      decoration: TextDecoration.none)),
                            ),
                            Text(upDateContent,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    decoration: TextDecoration.none)),
                            Container(
                              width: 250,
                              height: 42,
                              margin: EdgeInsets.only(bottom: 15),
                              child: ElevatedButton(
                                  child: Text(
                                    '立即更新',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  onPressed: () {}),
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/up_version.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Offstage(
                    offstage: isForce,
                    child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Image.asset(
                          'assets/images/up_version.png',
                          width: 35,
                          height: 35,
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static showUpdateDialog(
      BuildContext context, String mUpdateContent, bool mIsForce) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
              child: UpdateDialog(
                  upDateContent: mUpdateContent, isForce: mIsForce),
              onWillPop: _onWillPop);
        });
  }

  static Future<bool> _onWillPop() async {
    return false;
  }
}
