import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showListDialog(context) async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = new Material(
        child: Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () {
                    print("index");
                  },
                );
              },
            )),
          ],
        ),
      );
      //使用AlertDialog会报错
      //return AlertDialog(content: child);
      return Dialog(child: child);
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}

Future<void> showPictureBg(context) async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = new Material(
        type: MaterialType.transparency, //透明类型
        child: Text("sfljdfsjd"),
      );
      return Dialog(child: child);
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}

class Loading {
  static void show(BuildContext context, {bool mateStyle}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
            child: LoadingDialog(),
            onWillPop: () async {
              return Future.value(true);
            });
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class LoadingDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: Container(
        //保证控件居中效果
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 69,
              child: new Image.asset(
                'assets/images/by_tyre_point.png',
                width: 203,
                height: 202,
              ), /*new Image.asset(
                'assets/images/by_tyre_point.png',
                width: 203,
                height: 202,
              )*/
            ),
            Positioned(
              left: 140,
              bottom: 222,
              child: GestureDetector(
                onTap: () {
                  Loading.hide(context);
                },
                child: Container(
                  width: 96,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(4)), //弧度
                  ),
                  child: Text(
                    "我知道了",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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

Future<void> show(context) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("AlerDialog"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('You will never be satisfied.'),
              Text('You\’re like me. I’m never satisfied.'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Regret'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
