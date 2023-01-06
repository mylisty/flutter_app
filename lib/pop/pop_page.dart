
import 'package:flutter/material.dart';
import 'package:flutter_app/base/base_page.dart';
import 'package:flutter_app/dialog.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/6/3 2:07 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/6/3 2:07 下午
///  @UpdateRemark: 更新说明
class PopPage extends BasePage {
  PopPage(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => PopPageBody();
}
class PopPageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PopStaepage();
  }
}

class _PopStaepage extends State<PopPageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: PopupMenuButton<String>(
              offset: Offset(-100, -20),
              onSelected: (item) {

              },
              itemBuilder: (builder) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      child: Text("data"), /*SizedBox(
                        child: ListView.builder(itemBuilder: (BuildContext context, int index){
                          return Text("data");
                        }),
                      )*/
                      value: "a",
                    ),
                    const PopupMenuItem(
                      child: Text("锁定会议"),
                      value: "c",
                    ),
                    const PopupMenuItem(
                      child: Text("修改布局"),
                      value: "c",
                    ),
                const PopupMenuItem(
                  child: Text("修改布局"),
                  value: "c",
                ),
                const PopupMenuItem(
                  child: SizedBox(child: Text(("data"),),height: 200,),
                  value: "c",
                ),
                const PopupMenuItem(
                  child: Text("修改布局"),
                  value: "c",
                ),
                  ]),
        ),
      ),
    );
  }

  ///构建用户头像按钮
  ///点击头像弹出退出按钮
  Widget _buildUserIcon() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 22, 0, 0),
      child: GestureDetector(
        child: Container(
            child: Icon(Icons.eleven_mp),
            width: 32,
            height: 32,
            alignment: AlignmentDirectional.bottomStart),
        onTap: _showExit,
      ),
    );
  }

  ///构建退出按钮
  Widget _buildExit() {
    return Container(
      width: 91,
      height: 36,
      child: Stack(
        children: <Widget>[
          Icon(Icons.eleven_mp),
          Center(
            child: Text(
              "",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  ///弹出退出按钮
  ///点击退出调用onClick
  void _showExit() {
    Navigator.push(
      context,
      PopRoute(
        child: Popup(
          child: _buildExit(),
          left: 64,
          top: 22,
          onClick: () {
            print("exit");
          },
        ),
      ),
    );
  }
}

class Popup extends StatelessWidget {
  final Widget child;
  final Function onClick; //点击child事件
  final double left; //距离左边位置
  final double top; //距离上面位置
  final GlobalKey anchorKey;

  Popup({
    @required this.child,
    this.onClick,
    this.left,
    this.top,
    this.anchorKey,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
            ),
            Positioned(
              child: GestureDetector(
                  child: child,
                  onTap: () {
                    //点击子child
                    /*if (onClick != null) {
                      Navigator.of(context).pop();
                      onClick();
                    }*/
                    show(context);
                  }),
              left: left,
              top: top,
            ),
          ],
        ),
        onTap: () {
          //点击空白处
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
