import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
            // 问题出现在这里 只要不设置center 就没有中间的横线了
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
        width: 255, // 需要设置图片大小才能 把子view 之间的横线去掉
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
          //  show(context);
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
