import 'dart:convert';
import 'dart:math';
// ignore: avoid_web_libraries_in_flutter
import 'dart:ui' as prefix0;
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/PopRoute.dart';
import 'package:flutter_picker/flutter_picker.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:popup_window/popup_window.dart';
//import 'package:transparent_image/transparent_image.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'PickerData.dart';
import 'Test.dart';
import 'dialog.dart';

void main() {
  runApp(
      /*  new MyApp1(
        item: new List<String>.generate(300, (i)=> "item$i"),
      )*/
//      new ListViewController()
//     new MyApp29()
      /*  new MaterialApp(
      title: '',
      home: new  OverlayPage(),
    ),*/
      new MaterialApp(
    title: '',
    home: new MyApp29(),
  ));
}

/*
 引导图标
 */
class OverlayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new OverlayPageState();
  }
}

class OverlayPageState extends State<OverlayPage> {
  //首次运行中间文字显示点击效果
  String _bodyText = '点击效果';
  GlobalKey anchorKey = GlobalKey();
  double dx = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox renderBox = anchorKey.currentContext.findRenderObject();
      var offset = renderBox.localToGlobal(Offset.zero);
      dx = offset.dx + renderBox.size.width;
      var dy = offset.dy;
      Future.delayed(Duration.zero, () {
        Loading.show(context, left: dx);
        LogUtil.e("aaaaaaaaaaaa " + dx.toString());
        LogUtil.e("aaaaaaaaaaaa " + dy.toString());
        LogUtil.e("aaaaaaaaaaaa " + renderBox.size.height.toString());
        LogUtil.e("aaaaaaaaaaaa " + renderBox.size.width.toString());
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('悬浮演示'),
      ),
      //这是屏幕主体包含一个中央空间，里面是一个文本内容以及字体大小
      body: new Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                OverlayDialog._cancelToast();
              },
              child: Text("data"),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: RaisedButton(
                onPressed: () {
                  Loading.show(context, left: dx);
                },
                key: anchorKey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OverlayDialog {
  static OverlayEntry _overlayEntry; // 浮层，Toast显示全靠它
  static void show(
    BuildContext context, {
    String message, // 文本内容
    Color color = Colors.black,
    Color textColor = Colors.white, // 文本颜色
    double textSize = 14.0, // 文字大小
    int seconds = 2, // 显示时长，单位：秒
    double left,
    double bottom,
  }) async {
    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
          //top值，可以改变这个值来改变toast在屏幕中的位置
          bottom: bottom,
          left: left,
          child: Material(
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
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(4)), //弧度
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
          )),
    );
    WidgetsBinding.instance
        .addPostFrameCallback((_) => overlayState.insert(_overlayEntry));
  }

  // 移除Toast
  static _cancelToast() async {
    if (_overlayEntry != null) {
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }
}

class TabbarBgColorTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabbarBgColorTesttate();
  }
}

class _TabbarBgColorTesttate extends State<TabbarBgColorTest>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final List<String> _tabs = ["新闻", "历史", "图片"];
  TabController _tabController;

  // PageController _pageController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      _tabController.previousIndex;
      print("selected tabBar ${_tabController.previousIndex}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
            title: Text("ScaffoldTest"),
            //TabBar布置
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Material(
                color: Colors.cyan,
                child: TabBar(
                  // indicator: ColorTabIndicator(Colors.black),//选中标签颜色
                  indicatorColor: Colors.black, //选中下划线颜色,如果使用了indicator这里设置无效
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.yellow,
                  indicatorPadding: EdgeInsets.all(10),
                  tabs: _tabs
                      .map((item) => Tab(
                            child: Container(child: Text(item)),
                          ))
                      .toList(),
                ),
              ),
            )),
        body: TabBarView(
          controller: _tabController,
          children: _tabs
              .map((item) => Container(
                    color: Colors.blueGrey,
                    alignment: AlignmentDirectional.center,
                    child: Text(item),
                  ))
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text("Home"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text("Business"), icon: Icon(Icons.business)),
            BottomNavigationBarItem(
                title: Text("School"), icon: Icon(Icons.school))
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.green,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            print(_selectedIndex);
          },
        ));
  }
}

class MyApp104 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '弹出菜单演示',
      home: new MenuHomePage(),
    );
  }
}

/*
首页是带一个根据点击弹出菜单而改变中间文字的可变状态控件
 */
class MenuHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MenuHomePageState();
  }
}

class MenuHomePageState extends State<MenuHomePage> {
  //首次运行中间文字显示点击效果
  String _bodyText = '点击效果';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('弹出菜单演示'),
        actions: <Widget>[
          /*
          下面是一个弹出菜单按钮，包含两个属性点击属性和弹出菜单子项的建立
          其中<String>是表示这个弹出菜单的value内容是String类型
           */
          new PopupMenuButton<String>(
              //这是点击弹出菜单的操作，点击对应菜单后，改变屏幕中间文本状态，将点击的菜单值赋予屏幕中间文本
              onSelected: (String value) {
                setState(() {
                  _bodyText = value;
                });
              },
              //这是弹出菜单的建立，包含了两个子项，分别是增加和删除以及他们对应的值
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text('增加'),
                          new Icon(Icons.add_circle)
                        ],
                      ),
                      value: '这是增加',
                    ),
                    PopupMenuItem(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text('增加'),
                          new Icon(Icons.remove_circle)
                        ],
                      ),
                      value: '这是删除',
                    )
                  ])
        ],
      ),
      //这是屏幕主体包含一个中央空间，里面是一个文本内容以及字体大小
      body: new Center(
        child: new Text(
          _bodyText,
          style: new TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class MyApp103 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _testLiandongState3();
  }
}

enum Position {
  TOP,
  CENTER,
  BOTTOM,
}

class Toast {
  static OverlayEntry _overlayEntry; // 浮层，Toast显示全靠它
  static Position _toastPosition; // 显示位置

  static void show(
    BuildContext context, {
    String message, // 文本内容
    Color color = Colors.black,
    Color textColor = Colors.white, // 文本颜色
    double textSize = 14.0, // 文字大小
    int seconds = 2, // 显示时长，单位：秒
    Position position = Position.BOTTOM, // 显示位置
  }) async {
    assert(message != null);
    _toastPosition = position;

    //显示之前先把之前的浮层清空
    _cancelToast();
    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
          //top值，可以改变这个值来改变toast在屏幕中的位置
          top: _getToastPosition(context),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Center(
                child: Card(
                  color: color, //背景色
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: textSize,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
    WidgetsBinding.instance
        .addPostFrameCallback((_) => overlayState.insert(_overlayEntry));
    new Future.delayed(Duration(seconds: 2)).then((value) {
      _overlayEntry.remove();
    });
  }

  // 移除Toast
  static _cancelToast() async {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // 设置toast位置
  static double _getToastPosition(context) {
    double position;
    if (_toastPosition == Position.TOP) {
      position = MediaQuery.of(context).size.height * 1 / 6;
    } else if (_toastPosition == Position.CENTER) {
      position = MediaQuery.of(context).size.height * 3 / 6;
    } else {
      position = MediaQuery.of(context).size.height * 5 / 6;
    }
    return position;
  }
}

class Toast2 {
  static void show({@required BuildContext context, @required String message}) {
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return new Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          child: new Material(
            child: new Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: new Center(
                child: new Card(
                  child: new Padding(
                    padding: EdgeInsets.all(8),
                    child: new Text(message),
                  ),
                  color: Colors.grey,
                ),
              ),
            ),
          ));
    });
    //往Overlay中插入插入OverlayEntry
    WidgetsBinding.instance
        .addPostFrameCallback((_) => Overlay.of(context).insert(overlayEntry));

    //两秒后，移除Toast
    /*new Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });*/
  }
}

// ignore: camel_case_types
class _testLiandongState3 extends State<MyApp103> {
  // ignore: non_constant_identifier_names
  List<TestBean> list = new List();
  final List<FixedExtentScrollController> scrollController = [];
  final List<GlobalKey<_StateViewState>> _keys = [];
  bool firstIn = true;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 7; i++) {
      var testBean = new TestBean();
      testBean.value = i;
      testBean.label = "类目一" + i.toString();
      List<sendoBean> children = new List();
      for (int j = 0; j < 5; j++) {
        var sendoBean2 = new sendoBean();
        sendoBean2.value = 23 + j + i;
        sendoBean2.label = "服务项" + j.toString() + i.toString();
        children.add(sendoBean2);
      }

      testBean.children = children;
      list.add(testBean);
    }

    if (scrollController.length == 0) {
      scrollController
          .add(FixedExtentScrollController(initialItem: list.length));
      _keys.add(GlobalKey(debugLabel: 0.toString()));

      scrollController.add(FixedExtentScrollController(
          initialItem: list[position].children.length));
      _keys.add(GlobalKey(debugLabel: 1.toString()));
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  int position = 0;
  List<OverlayEntry> overlayEntryList = List<OverlayEntry>();
  OverlayEntry weixinOverlayEntry;
  void showWeixinButtonView() {
    weixinOverlayEntry = new OverlayEntry(builder: (context) {
      return new Positioned(
          top: kToolbarHeight,
          right: 20,
          width: 200,
          height: 320,
          child: new SafeArea(
              child: new Material(
            child: new Container(
              color: Colors.black,
              child: new Column(
                children: <Widget>[
                  Expanded(
                    child: new ListTile(
                      leading: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      title: new Text(
                        "发起群聊",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("添加朋友",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("扫一扫",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("首付款",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("帮助与反馈",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          )));
    });
    Overlay.of(context).insert(weixinOverlayEntry);
  }

  void showOverlay(BuildContext context) async {
    final OverlayState overlayState = Overlay.of(context);
    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
          left: 0.0,
          right: 0,
          bottom: 90.0,
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: Colors.blueAccent)),
            child: Text('Focus, lighting and contrast help',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 18.0,
                    decoration: TextDecoration.none)),
          )),
    );
    WidgetsBinding.instance
        .addPostFrameCallback((_) => overlayState.insert(overlayEntry));
//    await Future<dynamic>.delayed(Duration(seconds: 2));
//    overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "pageView",
        home: new Scaffold(
          appBar: AppBar(
            title: Text('pageView Image'),
          ),
          body: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  //获取OverlayState
                  OverlayState overlayState = Overlay.of(context);
//创建OverlayEntry
                  OverlayEntry _overlayEntry = OverlayEntry(
                      builder: (BuildContext context) => Positioned(
                            child: Icon(Icons.check_circle),
                          ));
//显示到屏幕上
                  WidgetsBinding.instance.addPostFrameCallback(
                      (_) => overlayState.insert(_overlayEntry));
//                overlayState.insert(_overlayEntry);
//移除屏幕
//                overlayState.remove();

//                这样就可以在屏幕上显示一个icon
//                可以通过修改Positioned的left、top
//                、right、bottom等值来修改在屏幕中的位置;
//                最后通过overlayState.remove();来移除
//
//                作者：哎呀啊噢
//                链接：https://www.jianshu.com/p/cc8aab935e11
//                来源：简书
//                著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
                },
                child: Text("click"),
              ),
              /*GestureDetector(
                child: Text("clic",style: TextStyle(fontSize: 44),),
                onTap: () {
//                  showOverlay(context);
//                Toast2.show(context: context,message: "sljfjsf");
//                  showWeixinButtonView();
                },
              ),*/
              Container(
                height: 241,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: CupertinoPicker.builder(
                        scrollController: scrollController[0],
                        magnification: 1.0,
                        childCount: list.length,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            child: Text(
                              list[index].label,
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          );
                        },
                        onSelectedItemChanged: (int value) {
                          position = value;
                          setState(() {});
                        },
                        itemExtent: 47,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CupertinoPicker.builder(
//                          scrollController: scrollController[1],
                        magnification: 1.0,
                        childCount: list[position].children.length,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            child: Text(list[position].children[index].label),
                          );
                        },
                        onSelectedItemChanged: (int value) {
                          LogUtil.e("aaaaaaaaa " + "aaa" + value.toString());
                        },
                        itemExtent: 47,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border(bottom: BorderSide(width: 1, color: Colors.red)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          child: Text(
                            "取消",
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                          margin: EdgeInsets.only(left: 16),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "服务项目",
                        style: TextStyle(fontSize: 14, color: Colors.red),
                      ),
                      GestureDetector(
                        child: Container(
                          child: Text(
                            "确认",
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                          margin: EdgeInsets.only(right: 16),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 241,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: CupertinoPicker.builder(
//                         scrollController: scrollController[0],
                          magnification: 1.0,
                          childCount: list.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(
                                list[index].label,
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red),
                              ),
                            );
                          },
                          onSelectedItemChanged: (int value) {
                            position = value;
                            setState(() {});
                          },
                          itemExtent: 47,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CupertinoPicker.builder(
//                          scrollController: scrollController[1],
                          magnification: 1.0,
                          childCount: list[position].children.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(list[position].children[index].label),
                            );
                          },
                          onSelectedItemChanged: (int value) {
                            LogUtil.e("aaaaaaaaa " + "aaa" + value.toString());
                          },
                          itemExtent: 47,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildListFirst(bool firstIn) {
    return CupertinoPicker.builder(
//      scrollController: scrollController[0],
      magnification: 1.0,
      childCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            list[index].label,
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
        );
      },
      onSelectedItemChanged: (int value) {
        setState(() {
          position = value;
        });
      },
      itemExtent: 47,
    );
  }

  Widget buildListSecond(bool firstIn) {
    return CupertinoPicker.builder(
//      scrollController: scrollController[1],
      magnification: 1.0,
      childCount: list[position].children.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          child: Text(list[position].children[index].label),
        );
      },
      onSelectedItemChanged: (int value) {
        LogUtil.e("aaaaaaaaa " + "aaa" + value.toString());
      },
      itemExtent: 47,
    );
  }
}

class _StateView extends StatefulWidget {
  final WidgetBuilder builder;
  const _StateView({Key key, this.builder}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateViewState();
}

class _StateViewState extends State<_StateView> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  update() {
    setState(() {});
  }
}

class MyApp102 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _testLiandongState2();
  }
}

// ignore: camel_case_types
class _testLiandongState2 extends State<MyApp102> {
  // ignore: non_constant_identifier_names
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "pageView",
        home: new Scaffold(
          appBar: AppBar(
            title: Text('pageView Image'),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                width: 64,
                height: 64,
                color: Colors.red,
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Offstage(
                    offstage: false,
                    child: Container(
                      width: 64,
                      height: 18,
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: Text(
                        "网红轮胎店",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

class MyApp101 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _testLiandongState();
  }
}

// ignore: camel_case_types
class _testLiandongState extends State<MyApp101> {
  // ignore: non_constant_identifier_names
  List _CourseNameList = ["bbb", "sdfsdf", "ldjfsjdf"];
  String isCourseValue = "bbb";
  String isChapterValue = "bbb";
  Map _ChapterNameList = {"bbb": "1", "sdfsdf": "2", "ldjfsjdf": "3"};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "pageView",
        home: new Scaffold(
          appBar: AppBar(
            title: Text('pageView Image'),
          ),
          body: Container(
            child: DropdownButton(
              isExpanded: true,
              value: isCourseValue,
              items: _CourseNameList.map((item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  isCourseValue = value; //一级
                  isChapterValue = _ChapterNameList[isCourseValue]; //二级
                  LogUtil.e(
                      "aaaaaaaaaaaaaaaaa isChapterValuev " + isChapterValue);
                  LogUtil.e(
                      "aaaaaaaaaaaaaaaaa  isCourseValue " + isCourseValue);
                });
              },
            ),
          ),
        ));
  }
}

class MyApp100 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp100> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          PickerLocalizationsDelegate.delegate, // 如果要使用本地化，请添加此行，则可以显示中文按钮
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('zh', 'CH'),
          const Locale('ko', 'KO'),
          const Locale('it', 'IT'),
          const Locale('ar', 'AR'),
          const Locale('tr', 'TR')
        ],
        home: new MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage> {
  final double listSpec = 4.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String stateText;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "PickState",
        home: new Scaffold(
          appBar: AppBar(
            title: Text('PickState '),
          ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: ListView(
              children: <Widget>[
                (stateText != null) ? Text(stateText) : Container(),
                RaisedButton(
                  child: Text('Picker Show'),
                  onPressed: () {
                    showPicker(context);
                  },
                ),
                SizedBox(height: listSpec),
                RaisedButton(
                  child: Text('Picker Show Modal'),
                  onPressed: () {
                    showPickerModal(context);
                  },
                ),
                SizedBox(height: listSpec),
                RaisedButton(
                  child: Text('Picker Show Icons'),
                  onPressed: () {
                    showPickerIcons(context);
                  },
                ),
                SizedBox(height: listSpec),
                RaisedButton(
                  child: Text('Picker Show (Array)'),
                  onPressed: () {
                    showPickerArray(context);
                  },
                ),
                SizedBox(height: listSpec),
                RaisedButton(
                  child: Text('Picker Show Number'),
                  onPressed: () {
                    showPickerNumber(context);
                  },
                ),
                SizedBox(height: listSpec),
                RaisedButton(
                  child: Text('Picker Show Number FormatValue'),
                  onPressed: () {
                    showPickerNumberFormatValue(context);
                  },
                ),
                SizedBox(height: listSpec),
                RaisedButton(
                  child: Text('Picker Show Date'),
                  onPressed: () {
                    showPickerDate(context);
                  },
                ),
                SizedBox(height: listSpec),
                RaisedButton(
                  child: Text('Picker Show Datetime'),
                  onPressed: () {
                    showPickerDateTime(context);
                  },
                ),
                SizedBox(height: listSpec),
                RaisedButton(
                  child: Text('Picker Show Date (Custom)'),
                  onPressed: () {
                    showPickerDateCustom(context);
                  },
                ),
                SizedBox(height: listSpec),
                RaisedButton(
                  child: Text('Picker Show Datetime (24)'),
                  onPressed: () {
                    showPickerDateTime24(context);
                  },
                ),
                SizedBox(height: listSpec),
                RaisedButton(
                  child: Text('Picker Show Datetime (Round background)'),
                  onPressed: () {
                    showPickerDateTimeRoundBg(context);
                  },
                ),
                SizedBox(height: listSpec),
                RaisedButton(
                  child: Text('Picker Show Date Range'),
                  onPressed: () {
                    showPickerDateRange(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  showPicker(BuildContext context) {
    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(PickerData)),
        changeToFirst: false,
        textAlign: TextAlign.left,
        textStyle: const TextStyle(color: Colors.blue),
        selectedTextStyle: TextStyle(color: Colors.red),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        });
    picker.show(_scaffoldKey.currentState);
  }

  showPickerModal(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        hideHeader: false,
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.adapter.text);
        }).showModal(this.context); //_scaffoldKey.currentState);
  }

  showPickerIcons(BuildContext context) {
    Picker(
      adapter: PickerDataAdapter(data: [
        PickerItem(text: Icon(Icons.add), value: Icons.add, children: [
          PickerItem(text: Icon(Icons.more)),
          PickerItem(text: Icon(Icons.aspect_ratio)),
          PickerItem(text: Icon(Icons.android)),
          PickerItem(text: Icon(Icons.menu)),
        ]),
        PickerItem(text: Icon(Icons.title), value: Icons.title, children: [
          PickerItem(text: Icon(Icons.more_vert)),
          PickerItem(text: Icon(Icons.ac_unit)),
          PickerItem(text: Icon(Icons.access_alarm)),
          PickerItem(text: Icon(Icons.account_balance)),
        ]),
        PickerItem(text: Icon(Icons.face), value: Icons.face, children: [
          PickerItem(text: Icon(Icons.add_circle_outline)),
          PickerItem(text: Icon(Icons.add_a_photo)),
          PickerItem(text: Icon(Icons.access_time)),
          PickerItem(text: Icon(Icons.adjust)),
        ]),
        PickerItem(
            text: Icon(Icons.linear_scale),
            value: Icons.linear_scale,
            children: [
              PickerItem(text: Icon(Icons.assistant_photo)),
              PickerItem(text: Icon(Icons.account_balance)),
              PickerItem(text: Icon(Icons.airline_seat_legroom_extra)),
              PickerItem(text: Icon(Icons.airport_shuttle)),
              PickerItem(text: Icon(Icons.settings_bluetooth)),
            ]),
        PickerItem(text: Icon(Icons.close), value: Icons.close),
      ]),
      title: Text("Select Icon"),
      selectedTextStyle: TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues());
      },
    ).show(_scaffoldKey.currentState);
  }

  showPickerDialog(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(PickerData)),
        hideHeader: true,
        title: new Text("Select Data"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  showPickerArray(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter<String>(
          pickerdata: JsonDecoder().convert(PickerData2),
          isArray: true,
        ),
        hideHeader: true,
        selecteds: [3, 0, 2],
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        cancel: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.child_care)),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  showPickerNumber(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(
              begin: 0,
              end: 999,
              postfix: Text("\$"),
              suffix: Icon(Icons.insert_emoticon)),
          NumberPickerColumn(begin: 200, end: 100, jump: -10),
        ]),
        delimiter: [
          PickerDelimiter(
              child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ))
        ],
        hideHeader: true,
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  showPickerNumberFormatValue(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(
              begin: 0,
              end: 999,
              onFormatValue: (v) {
                return v < 10 ? "0$v" : "$v";
              }),
          NumberPickerColumn(begin: 100, end: 200),
        ]),
        delimiter: [
          PickerDelimiter(
              child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ))
        ],
        hideHeader: true,
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  showPickerDate(BuildContext context) {
    Picker(
        hideHeader: true,
        adapter: DateTimePickerAdapter(),
        title: Text("Select Data"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
        }).showDialog(context);
  }

  showPickerDateCustom(BuildContext context) {
    new Picker(
        hideHeader: true,
        adapter: new DateTimePickerAdapter(
          customColumnType: [2, 1, 0, 3, 4],
        ),
        title: new Text("Select Data"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
        }).showDialog(context);
  }

  showPickerDateTime(BuildContext context) {
    new Picker(
        adapter: new DateTimePickerAdapter(
          type: PickerDateTimeType.kYMD_AP_HM,
          isNumberMonth: true,
          //strAMPM: const["上午", "下午"],
          yearSuffix: "年",
          monthSuffix: "月",
          daySuffix: "日",
          minValue: DateTime.now(),
          minuteInterval: 30,
          // twoDigitYear: true,
        ),
        title: new Text("Select DateTime"),
        textAlign: TextAlign.right,
        selectedTextStyle: TextStyle(color: Colors.blue),
        delimiter: [
          PickerDelimiter(
              column: 5,
              child: Container(
                width: 16.0,
                alignment: Alignment.center,
                child: Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                color: Colors.white,
              ))
        ],
        footer: Container(
          height: 50.0,
          alignment: Alignment.center,
          child: Text('Footer'),
        ),
        onConfirm: (Picker picker, List value) {
          print(picker.adapter.text);
        },
        onSelect: (Picker picker, int index, List<int> selecteds) {
          this.setState(() {
            stateText = picker.adapter.toString();
          });
        }).show(_scaffoldKey.currentState);
  }

  showPickerDateRange(BuildContext context) {
    print("canceltext: ${PickerLocalizations.of(context).cancelText}");

    Picker ps = new Picker(
        hideHeader: true,
        adapter: new DateTimePickerAdapter(
            type: PickerDateTimeType.kYMD, isNumberMonth: true),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
        });

    Picker pe = new Picker(
        hideHeader: true,
        adapter: new DateTimePickerAdapter(type: PickerDateTimeType.kYMD),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
        });

    List<Widget> actions = [
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text(PickerLocalizations.of(context).cancelText)),
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
            ps.onConfirm(ps, ps.selecteds);
            pe.onConfirm(pe, pe.selecteds);
          },
          child: new Text(PickerLocalizations.of(context).confirmText))
    ];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text("Select Date Range"),
            actions: actions,
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Begin:"),
                  ps.makePicker(),
                  Text("End:"),
                  pe.makePicker()
                ],
              ),
            ),
          );
        });
  }

  showPickerDateTime24(BuildContext context) {
    new Picker(
        adapter: new DateTimePickerAdapter(
            type: PickerDateTimeType.kMDYHM,
            isNumberMonth: true,
            yearSuffix: "年",
            monthSuffix: "月",
            daySuffix: "日"),
        title: new Text("Select DateTime"),
        onConfirm: (Picker picker, List value) {
          print(picker.adapter.text);
        },
        onSelect: (Picker picker, int index, List<int> selecteds) {
          this.setState(() {
            stateText = picker.adapter.toString();
          });
        }).show(_scaffoldKey.currentState);
  }

  /// 圆角背景
  showPickerDateTimeRoundBg(BuildContext context) {
    var picker = Picker(
        backgroundColor: Colors.transparent,
        headerDecoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
        adapter: new DateTimePickerAdapter(
            type: PickerDateTimeType.kMDYHM,
            isNumberMonth: true,
            yearSuffix: "年",
            monthSuffix: "月",
            daySuffix: "日"),
        delimiter: [
          PickerDelimiter(
              column: 3,
              child: Container(
                width: 8.0,
                alignment: Alignment.center,
              )),
          PickerDelimiter(
              column: 5,
              child: Container(
                width: 12.0,
                alignment: Alignment.center,
                child: Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                color: Colors.white,
              )),
        ],
        title: new Text("Select DateTime"),
        onConfirm: (Picker picker, List value) {
          print(picker.adapter.text);
        },
        onSelect: (Picker picker, int index, List<int> selecteds) {
          this.setState(() {
            stateText = picker.adapter.toString();
          });
        });

    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Material(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Container(
                padding: const EdgeInsets.only(top: 4),
                child: picker.makePicker(null, true),
              ));
        });
  }
}

//const Scaffold({
//Key key,
//this.appBar, // 标题栏
//this.body,  // 用于显示当前界面主要内容的Widget
//this.floatingActionButton, // 一个悬浮在body上的按钮，默认显示在右下角
//this.floatingActionButtonLocation, // 用于设置floatingActionButton显示的位置
//this.floatingActionButtonAnimator, // floatingActionButton移动到一个新的位置时的动画
//this.persistentFooterButtons, // 多状态按钮
//this.drawer, // 左侧的抽屉菜单
//this.endDrawer, //  右'侧的抽屉菜单
//this.bottomNavigationBar,// 底部导航栏。
//this.bottomSheet, // 显示在底部的工具栏
//this.backgroundColor,// 内容的背景颜色
//this.resizeToAvoidBottomPadding = true, // 控制界面内容 body 是否重新布局来避免底部被覆盖，比如当键盘显示的时候，重新布局避免被键盘盖住内容。
//this.primary = true,// Scaffold是否显示在页面的顶部
//})
/*MaterialApp({
Key key,
this.title = '', // 设备用于为用户识别应用程序的单行描述
this.home, // 应用程序默认路由的小部件,用来定义当前应用打开的时候，所显示的界面
this.color, // 在操作系统界面中应用程序使用的主色。
this.theme, // 应用程序小部件使用的颜色。
this.routes = const <String, WidgetBuilder>{}, // 应用程序的顶级路由表
this.navigatorKey, // 在构建导航器时使用的键。
this.initialRoute, // 如果构建了导航器，则显示的第一个路由的名称
this.onGenerateRoute, // 应用程序导航到指定路由时使用的路由生成器回调
this.onUnknownRoute, // 当 onGenerateRoute 无法生成路由(initialRoute除外)时调用
this.navigatorObservers = const <NavigatorObserver>[], // 为该应用程序创建的导航器的观察者列表
this.builder, // 用于在导航器上面插入小部件，但在由WidgetsApp小部件创建的其他小部件下面插入小部件，或用于完全替换导航器
this.onGenerateTitle, // 如果非空，则调用此回调函数来生成应用程序的标题字符串，否则使用标题。
this.locale, // 此应用程序本地化小部件的初始区域设置基于此值。
this.localizationsDelegates, // 这个应用程序本地化小部件的委托。
this.localeListResolutionCallback, // 这个回调负责在应用程序启动时以及用户更改设备的区域设置时选择应用程序的区域设置。
this.localeResolutionCallback, //
this.supportedLocales = const <Locale>[Locale('en', 'US')], // 此应用程序已本地化的地区列表
this.debugShowMaterialGrid = false, // 打开绘制基线网格材质应用程序的网格纸覆盖
this.showPerformanceOverlay = false, // 打开性能叠加
this.checkerboardRasterCacheImages = false, // 打开栅格缓存图像的棋盘格
this.checkerboardOffscreenLayers = false, // 打开渲染到屏幕外位图的图层的棋盘格
this.showSemanticsDebugger = false, // 打开显示框架报告的可访问性信息的覆盖
this.debugShowCheckedModeBanner = true, // 在选中模式下打开一个小的“DEBUG”横幅，表示应用程序处于选中模式
})*/
/*class MyApp33 extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}
class _MyAppState extends State<MyApp33> {

  String url = "";
  double progress = 0;
//  var _streamSubscription;
  @override
  void initState() {
    super.initState();
//    _streamSubscription = Fluttertoast.eventPlugin.receiveBroadcastStream()
//        .listen(_onData, onError: _onError, onDone: _onDone, cancelOnError: true);

  }

  void _onData(Object event) {
    // 接收数据
    LogUtil.e("aaaaaaaaaaa       "+ event.toString());
    setState(() {

    });
  }

  void _onError(Object error) {
    // 发生错误时被回调
    setState((){

    });
  }

  void _onDone() {
    //结束时调用
  }

  @override
  void dispose() {
    super.dispose();
  */ /*  if(_streamSubscription != null) {
      _streamSubscription.cancel();
    }*/ /*
  }
  void _request(String phone) async{
    try {
      Response response = await Dio().post("http://motanni.com:7000/api/auth/sms_code/",data:{'mobile':phone});
      print('response:${response.statusCode}');
      print(response.data.toString());
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InAppWebView Example'),
        ),
        body: Container(
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: progress < 1.0
                      ? LinearProgressIndicator(value: progress)
                      : Container()),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: InAppWebView(
                    initialUrl:   "https://wx.jfx.qdfaw.com/qqWeChatOfficialRelease2/web/car-buyCars-zl/buyCars.html?token=&token_type=&userId=&updateTokenTime=&user_mobile=&refresh_token=&userAgent=Android&appVersionCode=126&latitude=30.31044&longitude=120.250965",
                    initialHeaders: {},
                    initialOptions: InAppWebViewWidgetOptions(
                        inAppWebViewOptions: InAppWebViewOptions(
                          debuggingEnabled: true,
                        )
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;
                    },
                    onLoadStart: (InAppWebViewController controller, String url) {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onLoadStop: (InAppWebViewController controller, String url) async {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onProgressChanged: (InAppWebViewController controller, int progress) {
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                  ),
                ),


              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Icon(Icons.arrow_back),
                    onPressed: () async {
                      Fluttertoast.showToast(msg: "lsjflsjdfjdsjf");
                      _request("19967341993");
                    */ /*  Response response;
                      Dio dio = new Dio();
                      response = await dio.post("http://motanni.com:7000/api/auth/sms_code/", data: {"mobile":
                      "19967341993"
                      });
                      print(response.data.toString());*/ /*
                      */ /*if (webView != null) {
                        webView.goBack();
                      }*/ /*
                    },
                  ),
                  RaisedButton(
                    child: Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (webView != null) {
                        webView.goForward();
                      }
                    },
                  ),
                  RaisedButton(
                    child: Icon(Icons.refresh),
                    onPressed: () {
                      if (webView != null) {
                        webView.reload();
                      }
                    },
                  ),
                ],
              ),
            ])),
      ),
    );
  }
}*/

class MyApp32 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LinearGradientState2();
  }
}

class LinearGradientState2 extends State<MyApp32> {
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {});
    });
  }

  //这是个key吧，机制问题
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: new Scaffold(
        body: new WebView(
          initialUrl: "https://sh.zhilun.com/defect",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

class MyApp31 extends StatelessWidget {
  final List<String> item;

  MyApp31({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "列表",
        home: new Scaffold(
          appBar: AppBar(
            title: Text('居中布局示例'),
          ),
          /**
        Wrap({
        Key key,
        this.direction = Axis.horizontal,//主轴（mainAxis）的方向，默认为水平。
        this.alignment = WrapAlignment.start,//主轴方向上的对齐方式，默认为start。
        this.spacing = 0.0,//主轴方向上的间距。
        this.runAlignment = WrapAlignment.start,//run的对齐方式。run可以理解为新的行或者列，如果是水平方向布局的话，run可以理解为新的一行。
        this.runSpacing = 0.0,//run的间距。
        this.crossAxisAlignment = WrapCrossAlignment.start,//交叉轴（crossAxis）方向上的对齐方式。
        this.textDirection,//文本方向。
        this.verticalDirection = VerticalDirection.down,//定义了children摆放顺序，默认是down，见Flex相关属性介绍。
        List<Widget> children = const <Widget>[],//
        })
      */
          body: Wrap(children: <Widget>[
//              for (String item in tags) TagItem(item)
          ]) /*Column(
              // start ，沿着主轴方向(垂直方向)顶部对齐；
              //end，沿着主轴方向(垂直方向)底部对齐；
              //center，沿着主轴方向(垂直方向)居中对齐；
              //spaceBetween ，沿着主轴方向(垂直方向)平分剩余空间；
              //spaceAround，把剩余空间平分成n份，n是子widget的数量，然后把其中一份空间分成2份，放在第一个child的前面，和最后一个child的后面；
              //6.spaceEvenly，把剩余空间平分n+1份，然后平分所有的空间，请注意和spaceAround的区别；
              //
              //作者：liu_520
              //链接：https://www.jianshu.com/p/1d003ab6c278
            */ /*  mainAxisAlignment: MainAxisAlignment.center,*/ /*
              //
              mainAxisAlignment:  MainAxisAlignment.center,

              //start ，垂直主轴方向(水平方向)左侧对齐；
              //end，垂直主轴方向(水平方向)右侧对齐；
              //center，垂直主轴方向(水平方向)居中对齐；
              //stretch ，垂直主轴方向(水平方向)拉伸子child；
              //baseline，这个要和textBaseline一起使用，；
              //
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  Text("aljdflsjf"),
                  Text("aljdflsjf"),
                Row(
                  children: <Widget>[
                    Text("aaaa")
                  ],
                )
              ],
            )*/
          ,
        ));
  }
}

class TagItem extends StatelessWidget {
  final String text;

  TagItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          border:
              Border.all(color: Colors.blueAccent.withAlpha(60), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Text(text),
      ),
    );
  }
}

const List<String> tags = [
  "肯德基",
  "小哥哥你的东西掉了",
  "小姐姐好漂亮啊",
  "这个东西是啥",
  "哈哈哈",
  "好困啊",
  "今天好运",
  "明天好运来",
  "今年快结束了",
  "我累啊",
  "你写的什么代码",
  "多多多"
];

class MyApp30 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LinearGradientState();
  }
}

class LinearGradientState extends State<MyApp30> {
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {});
    });
  }

  //这是个key吧，机制问题
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: new LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.cyan, Colors.white, Colors.blue])),
          ),
          RefreshIndicator(
            child: Column(
              children: <Widget>[
                Text("a"),
                RaisedButton(
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                  child: Text("button"),
                )
              ],
            ),
            onRefresh: _onRefresh,
          ),
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            Text("aaa"),
            Text("aaa"),
            Text("aaa"),
            Text("aaa"),
            Text("aaa"),
            Text("aaa"),
          ],
        ),
      ),
    );
  }
}

class MyApp29 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TextFieldState();
  }
}

class TextFieldState extends State<MyApp29>
    with SingleTickerProviderStateMixin {
  var controller;
  AnimationController animationController;
  Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();

    ///原文链接：https://blog.csdn.net/zl18603543572/article/details/95259555
    animationController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    //begin: Offset.zero, end: Offset(1, 0) 以左下角为参考点，相对于左下角坐标 x轴方向向右 平移执行动画的view 的1倍 宽度，y轴方向不动，也就是水平向右平移
    //begin: Offset.zero, end: Offset(1, 1) 以左下角为参考点，相对于左下角坐标 x轴方向向右 平移执行动画的view 的1倍 宽度，y轴方向 向下 平衡执行动画view 的1倍的高度，也就是向右下角平移了
    animation = Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOutQuad,
      ),
    );
    Future.delayed(Duration(milliseconds: 1000), () {
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("textField button"),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                new Container(
                  width: 200,
                  child: TextField(
                    controller: controller,
                    //    maxLength: 30,//最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                    maxLines: 1, //最大行数
                    autocorrect: true, //是否自动更正
                    autofocus: false, //是否自动对焦
                    obscureText: false, //是否是密码
                    textAlign: TextAlign.start, //文本对齐方式
                    style: TextStyle(
                        fontSize: 16, color: Colors.black87), //输入文本的样式
                    //| inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
                    inputFormatters: [
                      BlacklistingTextInputFormatter(RegExp("[a-z]")),
                      LengthLimitingTextInputFormatter(5)
                    ],
                    onChanged: (text) {
                      //内容改变的回调
                      print('change $text');
                    },
                    cursorWidth: 2.0,
                    cursorColor: Colors.black87, //光标颜色,
                    dragStartBehavior: DragStartBehavior.down,
                    // this.dragStartBehavior = DragStartBehavior.down,
                    scrollPadding: EdgeInsets.all(20),
                    decoration: new InputDecoration(
                      hintText: "phone",
                      hintStyle: new TextStyle(fontSize: 16),
                      prefixIcon: Image.asset(
                        "assets/images/qr_zhilun.jpg",
                        width: 5,
                        height: 5,
                      ),
                      /*   border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.red)
                  ),*/
//                  border: new UnderlineInputBorder( //OutlineInputBorder 边框
//                      borderSide: BorderSide(color: Colors.black87 ),
//                      borderRadius: BorderRadius.circular(7.0)
//                  ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                    ),
                  ),
                ),
                OutlineButton(
                    textTheme: ButtonTextTheme.normal,
                    onPressed: () {},
                    /*   focusColor: Colors.lime,
              hoverColor: Colors.red  ,*/
                    //   color: Colors.greenAccent,
                    //   borderSide: BorderSide(color: Colors.lightBlue,style: BorderStyle.solid),
                    child: Text(
                      "outline",
                      style: new TextStyle(fontSize: 10),
                    ),
                    disabledBorderColor: Colors.amberAccent,
                    highlightedBorderColor: Colors.red,
                    color: Colors.green,
                    hoverColor: Colors.black87,
                    // splashColor: Colors.green,//点击后的颜色
                    /* shape: ShapeBorder.lerp(),*/
                    // highlightColor: Colors.amberAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                FlatButton(
                  onPressed: () {},
                  child: new Text("FlatButton"),
                  color: Colors.green,
                  clipBehavior: Clip.antiAlias,
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // highlightColor: Colors.red,
                  hoverColor: Colors.amberAccent,
                ),
                Container(
                  width: 160,
                  height: 48,
                  decoration: new BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFFFF9224),
                      Color(0xFFFF9224),
                      Color(0xFFFF3D10)
                    ]),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: FlatButton.icon(
                    onPressed: () {},
                    clipBehavior: Clip.antiAlias,
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    // highlightColor: Colors.red,
                    hoverColor: Colors.amberAccent,
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 24,
                    ),
                    label: Text(
                      "联系管理员",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("RaiseButton"),
                  color: Colors.green,
                  shape: new StadiumBorder(
                    side: new BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.greenAccent,
                    ),
                  ),
//              highlightColor: Colors.amber,
                  splashColor: Colors.amber,
                  //    colorBrightness:Brightness.light ,
                ),
                Container(
                  width: 160,
                  height: 48,
                  decoration: new BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFFFF9224),
                      Color(0xFFFF9224),
                      Color(0xFFFF3D10)
                    ]),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:RaisedButton(
                    onPressed: () {},
                    child: Text("RaiseButton"),
                    shape: new StadiumBorder(
                      side: new BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.greenAccent,
                      ),
                    ),
//              highlightColor: Colors.amber,
                    splashColor:  Color(0xff20DDAA),
                    //    colorBrightness:Brightness.light ,
                  ) ,
                ),
                RaisedButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  clipBehavior: Clip.hardEdge,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22.0))),
                  padding: const EdgeInsets.all(0.0),
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
                    child: Text('立即申请',textAlign: TextAlign.center,),
                  ),
                  splashColor:  Color(0xff20DDAA),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Offstage(
                offstage: false,
                child: IntrinsicHeight( // // 自适应高度
                  child: SlideTransition(
                    position: animation,
                    child: Container(
                      height: 162,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "等待车队管理员审批....",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFEA421B),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 3, left: 40, right: 40),
                            child: Text(
                              "订单将在车队管理员审批后发布给周边服务车，请及时联系管理员审批。",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF333333),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            width: 160,
                            height: 48,
                            decoration: new BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color(0xFFFF9224),
                                Color(0xFFFF9224),
                                Color(0xFFFF3D10)
                              ]),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: FlatButton.icon(
                              onPressed: () {},
                              clipBehavior: Clip.antiAlias,
                              shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              // highlightColor: Colors.red,
                              hoverColor: Colors.amberAccent,
                              icon: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 24,
                              ),
                              label: Text(
                                "联系管理员",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
/*const TextField({
Key key,
this.controller,    //编辑框的控制器，跟文本框的交互一般都通过该属性完成，如果不创建的话默认会自动创建
this.focusNode,  //用于管理焦点
this.decoration = const InputDecoration(),   //输入框的装饰器，用来修改外观
TextInputType keyboardType,   //设置输入类型，不同的输入类型键盘不一样
this.textInputAction,   //用于控制键盘动作（一般位于右下角，默认是完成）
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
this.helperText, //辅助文本，位于输入框下方，如果errorText不为空的话，则helperText不会显示
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
this.disabledBorder,  //输入框禁用时显示的边框，如果errorText不为空的话，该属性无效
this.enabledBorder,  //输入框可用时显示的边框，如果errorText不为空的话，该属性无效
this.border, //正常情况下的border
this.enabled = true,  //输入框是否可用
this.semanticCounterText,
this.alignLabelWithHint,
})*/

class MyApp28 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DialogState();
  }
}

class DialogState extends State<MyApp28> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
//      showPictureBg(context);
      Loading.show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("dialog"),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 100,
              child: Text("圣诞节"),
            ),
          ],
        ), /*Positioned(,
          bottom: 0,
          left: 100,
          child: Text("圣诞节"),
        )*/
      ),
    );
  }
}

class MyApp27 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ViewPageState();
  }
}

class ViewPageState extends State<MyApp27> {
  _onPageChnge(index) {
    print("aaaaaaaaaaaaaaa " + index.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "pageView",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('pageView Image'),
            ),
            body: new PageView(
              children: <Widget>[
                new Container(
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/card_package_icon.png",
                    image: 'https://p0.ssl.qhimg.com/t0183421f63f84fccaf.gif',
                  ),
                  width: 100,
                  height: 100,
                ),
                Image.network(
                    'https://ws1.sinaimg.cn/large/0065oQSqly1fw8wzdua6rj30sg0yc7gp.jpg'),
                Image.network(
                    'https://ws1.sinaimg.cn/large/0065oQSqly1fw0vdlg6xcj30j60mzdk7.jpg'),
                Image.network(
                    'https://ws1.sinaimg.cn/large/0065oQSqly1fuo54a6p0uj30sg0zdqnf.jpg'),
                new Container(
                  child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/card_package_icon.png",
                      image:
                          'https://ws1.sinaime/0065oQSqly1fw8wzdua6rj30sg0yc7gp.jpg'),
                )
              ],
              onPageChanged: _onPageChnge,
              scrollDirection: Axis.horizontal,
              reverse: false,
            )));
  }
}
/*

class ViewPagerDemo extends StatelessWidget {
  final List<String> arr = [
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554462012322&di=987630d5759673ef2b8b3b48f8112f78&imgtype=0&src=http%3A%2F%2Fwww.jituwang.com%2Fuploads%2Fallimg%2F121005%2F219049-1210051Q43054.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=100023636,3868399025&fm=26&gp=0.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554462109653&di=fc9a56f0410fbc71aa78a87994d77681&imgtype=0&src=http%3A%2F%2Fimg.boqiicdn.com%2FData%2FBK%2FA%2F1408%2F7%2Fimg88561407405003.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554462109652&di=81eab7bc76410abc2ffdb7ba0bd63049&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1303%2F03%2Fc9%2F18591026_18591026_1362320235218.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554462109652&di=40a8a6f283e19dbd52f7c454b13c8e2b&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1303%2F03%2Fc9%2F18591026_18591026_1362320204968.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554462208642&di=9c36cc656acfa0009863cefd1e09ae80&imgtype=0&src=http%3A%2F%2Fa4.att.hudong.com%2F74%2F46%2F300000764046131105469835325.jpg'
  ];
*/

/*  List<Widget> _createViewPager() {
    List<Widget> list = [];
    list.add(ViewPager(arr, (imgUrl){}));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _createViewPager(),
    );
  }*/
/*
}
typedef void OnTapViewPagerItem(String data);
class ViewPager extends StatefulWidget {
  final List<String> viewPagerData;
  final OnTapViewPagerItem onTap;

  ViewPager(this.viewPagerData, this.onTap, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePagerState();
  }
}

class _HomePagerState extends State<ViewPager> {
  int virtualIndex = 0;
  int realIndex = 1;

  PageController controller;
  Timer timer;
  PageController  _transController ;
  var _currentPageValue = 0.0;

  PageController _entryController ;
  var _entryPageValue = 0.0;

  @override
  void initState() {
    super.initState();

    controller = new PageController(initialPage: realIndex);
    _transController = new PageController();
    _entryController = new PageController();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      //实现自动滚动
      controller.animateToPage(realIndex + 1,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });

    _transController.addListener(() {
      setState(() {
        _currentPageValue = _transController.page;
      });
    });

    _entryController.addListener(() {
      setState(() {
        _entryPageValue = _entryController.page;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //默认构造函数的ViewPager
        Container(
          height: 200,
          child: PageView(
            controller: controller,
            onPageChanged: _onPageChanged,
            children: _buildItems(), //滚动的view
          ),
        ),
        Container(height: 30, child: _buildIndicator()), //滚动的小点
        //使用PageView.builder
        //添加transformation
        Container(
          height: 200,
          child: PageView.builder(
              controller: _transController,
              itemCount: widget.viewPagerData.length,
              physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
              itemBuilder: (BuildContext context, int index) {
                if (index == _currentPageValue.floor()) {
                  //将要出去的item
                  return Transform(
                    transform: Matrix4.identity()
                      ..rotateX(_currentPageValue - index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      child: Image.network(
                        widget.viewPagerData[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else if (index == _currentPageValue.floor() + 1) {
                  //将要进来的item
                  return Transform(
                    transform: Matrix4.identity()
                      ..rotateX(_currentPageValue - index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      child: Image.network(
                        widget.viewPagerData[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else {
                  //其他，不在屏幕显示的item
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    child: Image.network(
                      widget.viewPagerData[index],
                      fit: BoxFit.cover,
                    ),
                  );
                }
              }),
        ),
        Container(
          height: 200,
          child: PageView.custom(
            controller: _entryController,
            childrenDelegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              if (index == _entryPageValue.floor()) {
                //出去的item
                return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.004)
                      ..rotateY(_entryPageValue - index)
                      ..rotateZ(_entryPageValue - index),
                    child: Image.network(
                      widget.viewPagerData[index],
                      fit: BoxFit.fill,
                    ));
              } else if (index == _entryPageValue.floor() + 1) {
                //进来的item
                return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.004)
                      ..rotateY(_entryPageValue - index)
                      ..rotateZ(_entryPageValue - index),
                    child: Image.network(
                      widget.viewPagerData[index],
                      fit: BoxFit.fill,
                    ));
              } else {
                return Image.network(
                  widget.viewPagerData[index],
                  fit: BoxFit.fill,
                );
              }
            }, childCount: widget.viewPagerData.length),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildItems() {
    //轮播图
    List<Widget> items = [];
    if (widget.viewPagerData.length > 0) {
      //头部添加一个尾部item，模拟循环
      items.add(
          _buildItem(widget.viewPagerData[widget.viewPagerData.length - 1]));
      //添加正常item
      items.addAll(widget.viewPagerData
          .map((imgUrl) => _buildItem(imgUrl))
          .toList(growable: false));
      //尾部
      items.add(_buildItem(widget.viewPagerData[0]));
    }
    return items;
  }

  Widget _buildItem(String imgUrl) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap(imgUrl);
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  //创建轮播图点
  Widget _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < widget.viewPagerData.length; i++) {
      indicators.add(Container(
        //当有装饰组件作为子组件的时候，是一个装饰容器
        width: 6,
        height: 6,
        margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 10),
        decoration: BoxDecoration(
          //装饰组件，对装饰容器进行装饰用，添加颜色、图片、边框、圆角、阴影、渐变、背景混合、形状
            shape: BoxShape.circle,
            color: i == virtualIndex ? Colors.white : Colors.grey),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  _onPageChanged(int index) {
    realIndex = index;
    int count = widget.viewPagerData.length;
    if (index == 0) {
      virtualIndex = count - 1;
      controller.jumpToPage(count);
    } else if (index == count + 1) {
      virtualIndex = 0;
      controller.jumpToPage(1);
    } else {
      virtualIndex = index - 1;
    }
    setState(() {});
  }
}

*/

class MyApp26 extends StatelessWidget {
  final List<String> item;

  MyApp26({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "列表",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('居中布局示例'),
            ),
            body: new Center(
              child: new Column(
                children: <Widget>[
                  GestureDetector(
                    child: new ClipOval(
                      child: new SizedBox(
                        width: 50,
                        height: 50,
                        child: new Image.asset(
                          'assets/images/qr_zhilun.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    onTap: () {
                      //  show(context);
                    },
                  ),
                  new CircleAvatar(
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
                ],
              ),
            )));
  }
}

class MyApp25 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Table",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('Table'),
            ),
            body: new Center(
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(100.0),
                  1: FixedColumnWidth(57.0),
                  2: FixedColumnWidth(90.0),
                },
                border: TableBorder.all(
                    color: Colors.black, width: 2.0, style: BorderStyle.solid),
                children: const <TableRow>[
                  TableRow(children: <Widget>[
                    Text('q'),
                    Text('1'),
                    Text('3'),
                  ])
                ],
              ),
            )));
  }
}

class FirstScreen extends StatelessWidget {
  final list = new List.generate(
      30, (i) => new SecondScreen(title: '商品id$i', dec: '商品详情$i'));
  var result = 'Navigator';
  String platformVersion = 'Unknown';
  var demoPlugin = const MethodChannel('demo.plugin');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('$result'),
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        return new ListTile(
          title: new TextField(
            //    maxLength: 30,//最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
            maxLines: 1, //最大行数
            autocorrect: true, //是否自动更正
            autofocus: false, //是否自动对焦
            obscureText: false, //是否是密码
            textAlign: TextAlign.start, //文本对齐方式
            style: TextStyle(fontSize: 16, color: Colors.black87), //输入文本的样式
            //| inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
            inputFormatters: [
              BlacklistingTextInputFormatter(RegExp("[a-z]")),
              LengthLimitingTextInputFormatter(5)
            ],
            onChanged: (text) {
              //内容改变的回调
              print('change $text');
            },
            cursorWidth: 2.0,
            cursorColor: Colors.black87, //光标颜色,
            dragStartBehavior: DragStartBehavior.down,
            // this.dragStartBehavior = DragStartBehavior.down,
            scrollPadding: EdgeInsets.all(20),
            decoration: new InputDecoration(
              hintText: "phone",
              hintStyle: new TextStyle(fontSize: 16),
              prefixIcon: Image.asset(
                "assets/images/qr_zhilun.jpg",
                width: 5,
                height: 5,
              ),
              /*   border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.red)
                  ),*/
//                  border: new UnderlineInputBorder( //OutlineInputBorder 边框
//                      borderSide: BorderSide(color: Colors.black87 ),
//                      borderRadius: BorderRadius.circular(7.0)
//                  ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87)),
            ),
          ),
        )

            /* new ListTile(
          title:  new Text(list[index].title),
          onTap: ()  async {
            Fluttertoast.showToast(msg: "aaaa");
            // Platform messages may fail, so we use a try/catch PlatformException.
            //demoPlugin.invokeMethod('interaction');
        */ /*  result =   await Navigator.push(context, new MaterialPageRoute(builder: (context) =>
            new SecondScreen(list[index].title, list[index].dec)));
           print('reslut $result');*/ /*
//            Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){
//              return  new SecondScreen(title: list[index].title,dec: list[index].dec,);
//            })).then( (Object result){
//              //处理代码
//              this.result  = result;
//              print('aaa '+ this.result);
//            });
          },
        )*/
            ;
      }),
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
        child: new RaisedButton(
            child: Text(title),
            onPressed: () {
              showListDialog(context);
              //  Navigator.pop(context,dec);
            }),
      ),
    );
  }
}

class ListViewController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyApp23();
  }
}

// ignore: slash_for_doc_comments
/**
 * 继承SliverChildBuilderDelegate  可以对列表的监听
 */
class _SaltedValueKey extends ValueKey<Key> {
  const _SaltedValueKey(Key key)
      : assert(key != null),
        super(key);
}

class MyChildrenDelegate extends SliverChildBuilderDelegate {
  MyChildrenDelegate(
    Widget Function(BuildContext, int) builder, {
    int childCount,
    bool addAutomaticKeepAlive = true,
    bool addRepaintBoundaries = true,
  }) : super(builder,
            childCount: childCount,
            addAutomaticKeepAlives: addAutomaticKeepAlive,
            addRepaintBoundaries: addRepaintBoundaries);
  // Return a Widget for the given Exception
  Widget _createErrorWidget(dynamic exception, StackTrace stackTrace) {
    final FlutterErrorDetails details = FlutterErrorDetails(
      exception: exception,
      stack: stackTrace,
      library: 'widgets library',
      context: ErrorDescription('building'),
    );
    FlutterError.reportError(details);
    return ErrorWidget.builder(details);
  }

  @override
  Widget build(BuildContext context, int index) {
    assert(builder != null);
    if (index < 0 || (childCount != null && index >= childCount)) return null;
    Widget child;
    try {
      child = builder(context, index);
    } catch (exception, stackTrace) {
      child = _createErrorWidget(exception, stackTrace);
    }
    if (child == null) return null;
    final Key key = child.key != null ? _SaltedValueKey(child.key) : null;
    if (addRepaintBoundaries) child = RepaintBoundary(child: child);
    if (addSemanticIndexes) {
      final int semanticIndex = semanticIndexCallback(child, index);
      if (semanticIndex != null)
        child = IndexedSemantics(
            index: semanticIndex + semanticIndexOffset, child: child);
    }
    if (addAutomaticKeepAlives) child = AutomaticKeepAlive(child: child);
    return KeyedSubtree(child: child, key: key);
  }

  ///监听 在可见的列表中 显示的第一个位置和最后一个位置
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    // TODO: implement didFinishLayout
    super.didFinishLayout(firstIndex, lastIndex);
  }

  @override
  double estimateMaxScrollOffset(int firstIndex, int lastIndex,
      double leadingScrollOffset, double trailingScrollOffset) {
    print(
        'firstIndex sss : $firstIndex, lastIndex ssss : $lastIndex, leadingScrollOffset ssss : $leadingScrollOffset,'
        'trailingScrollOffset ssss : $trailingScrollOffset  ');
    return super.estimateMaxScrollOffset(
        firstIndex, lastIndex, leadingScrollOffset, trailingScrollOffset);
  }
}

class MyApp23 extends State<ListViewController> {
  ScrollController controller;
  var list = new List<String>.generate(100, (i) => "item $i");
  @override
  void initState() {
    // TODO: implement initState
    controller = new ScrollController();
    controller.addListener(() {
      var position = controller.position;
      var offset = controller.initialScrollOffset;
      var maxScrollExtent2 = controller.position.maxScrollExtent;
      var minScrollExtent = controller.position.minScrollExtent;
//      LogUtil.e("aaaaaaaaaaaaa position  "+ position.toString());
//      LogUtil.e("aaaaaaaaaaaaa offset"+ offset .toStr/*ing());
//      LogUtil.e("aaaaaaaaaaaaa maxScrollExtent2"+ maxScrollExtent2.toString());
//      LogUtil.e("aaaaaaaaaaaaa minScrollExtent"+ minSc*/rollExtent.toString());
//      controller.childrenDelegate;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Transform",
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Transform'),
        ),
        body: buildListView(),
      ),
    );
  }

  Widget buildListView() {
    var listView = Container(
      child: new ListView.custom(
        controller: controller,
        cacheExtent: 1.0, // 只有设置了1.0 才能够准确的标记position 位置
        childrenDelegate: MyChildrenDelegate(
          (BuildContext context, int index) {
            return new Dismissible(
                key: new Key(list[index]),
                onDismissed: (direction) {
                  //被移除回掉
                  list.removeAt(index);
                  var item = list[index];
                  Scaffold.of(context)
                      .showSnackBar(new SnackBar(content: new Text("$item")));
                },
                child: new ListTile(
                  title: new Text(list[index]),
                ));
          },
          childCount: list.length,
        ),
        /*itemBuilder: (context, index) {
        return new Dismissible(
            key: new Key(list[index]),
            onDismissed: (direction) {
              //被移除回掉
              list.removeAt(index);
              var item = list[index];
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("$item")));
            },
            child: new ListTile(
              title: new Text(list[index]),
            ));
      },*/
      ),
    );
    return listView;
  }
}

class MyApp22 extends StatelessWidget {
  GestureDetector buildButton(IconData icon, String label) {
    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center, //水平方向居中对齐
        children: <Widget>[
          //Icon(icon,color: Colors.lightGreen[600],),
          Icon(icon, color: Colors.lightGreen[600]),
          Container(
            margin: const EdgeInsets.only(top: 7.0),
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "风景",
        theme: new ThemeData(
            brightness: Brightness.light, //整体主题亮度
            primaryColor: Colors.lightBlue, //背景颜色
            accentColor: Colors.cyan // 文本 等颜色
            ),
        home: new Scaffold(
            appBar: AppBar(
              title: Text('风景'),
            ),
            body: ListView(
              children: <Widget>[
                new Image.network(
                  'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1573178989&di=5467e073272b5a414945e3365016db56&src=http://hbimg.b0.upaiyun.com/b8a2f3cb90ebfdcc8f432e55137d8008d8e0b53c656d-LYlEC1_fw658',
                  fit: BoxFit.fill, //填满
                  height: 240,
                ),
                new Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, //左边对齐,
                          children: <Widget>[Text("为哦十分out"), Text("了升级附加赛")],
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Text('99')
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // 水平方向均匀排列每个元素
                    children: <Widget>[
                      buildButton(Icons.call, '打电话'),
                      buildButton(Icons.near_me, '导航'),
                      buildButton(Icons.share, '分享')
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text('''
                  la焦恩俊爱神的箭发放埃及法老江东父老防腐剂啊
                  立法发来的积分了啊啦佛罗里达立法局
                  乐山大佛拉萨解放 老夫就爱上邓丽君发拉萨酱豆腐
                  了捡垃圾的法律骄傲了发我欸认为
                     垃圾地方了东父啊
                     塑料袋放进了世界东方爱劳动纠纷’
                     事件的浪费精力啊垃圾地方啦
                     啊就打算几点了房价  
                     按劳动法加拉加斯的法律
                     沙发是垃圾地方
                     啊撒旦解放了
                  '''),
                )
              ],
            )));
  }
}

class MyApp21 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Wrap",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('Wrap'),
            ),
            body: Wrap(
              spacing: 8.0,
              runSpacing: 4.0, //行间距
              children: <Widget>[
                Chip(
                    //添加头像
                    avatar: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: new Text(
                        'a',
                        style: new TextStyle(fontSize: 10.0),
                      ),
                    ),
                    label: new Text('西门催收')),
                Chip(
                    //添加头像
                    avatar: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: new Text(
                        'a',
                        style: new TextStyle(fontSize: 10.0),
                      ),
                    ),
                    label: new Text('西门催收')),
                Chip(
                  //添加头像
                  avatar: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Text(
                      'b',
                      style: new TextStyle(fontSize: 10.0),
                    ),
                  ),
                  label: new Text('西门催收2'),
                ),
                Chip(
                    //添加头像
                    avatar: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: new Text(
                        'c',
                        style: new TextStyle(fontSize: 10.0),
                      ),
                    ),
                    label: new RaisedButton(onPressed: () {
                      print('顺利交付的计算机');
                    }))
              ],
            )));
  }
}

class MyApp20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Baseline",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('Baseline'),
            ),
            body: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 与css3 just,
              children: <Widget>[
                new Baseline(
                  baseline: 45,
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    'AbGSLJFJLSdjlsj',
                    style: new TextStyle(fontSize: 23, color: Colors.black),
                  ),
                ),
                new Baseline(
                  baseline: 45,
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    '789+P',
                    style: new TextStyle(fontSize: 45, color: Colors.black),
                  ),
                )
              ],
            )));
  }
}

class MyApp19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Transform",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('Transform'),
            ),
            body: new Center(
              child: Container(
                color: Colors.greenAccent,
                child: Transform(
                  transform: Matrix4.rotationZ(0.4),
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.lightBlue,
                    child: Text('睡了多久放假'),
                  ),
                ),
              ),
            )));
  }
}

class MyApp18 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Table",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('Table'),
            ),
            body: new Center(
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(100.0),
                  1: FixedColumnWidth(57.0),
                  2: FixedColumnWidth(90.0),
                },
                border: TableBorder.all(
                    color: Colors.black, width: 2.0, style: BorderStyle.solid),
                children: const <TableRow>[
                  TableRow(children: <Widget>[
                    Text('q'),
                    Text('1'),
                    Text('3'),
                  ])
                ],
              ),
            )));
  }
}

class MyApp17 extends StatelessWidget {
  List<String> list = ["a", "c", "c"];
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "AspectRatio",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('AspectRatio'),
            ),
            body: new Container(
                height: 200,
                child: gridViewDefaultCount(
                    list) /*new AspectRatio(
                aspectRatio: 2, //宽高比例
                child: new Container(
                  color: Colors.greenAccent,
                  child:gridViewDefaultCount(list) */ /*new GridView.extent(
                    maxCrossAxisExtent: 150,
                    children: <Widget>[
                      Text('ajj'),
                      Text('ajj'),
                      Text('ajj'),
                      Text('ajj'),
                      Text('ajj'),
                      Text('ajj'),
                      Text('ajj'),
                      Text('ajj'),
                      Text('ajj'),
                      Text('ajj'),
                    ],
                  )*/ /*,
                ),
              ),*/
                )));
  }

  Widget gridViewDefaultCount(List<String> list) {
    return GridView.count(
//      padding: EdgeInsets.all(5.0),
      //一行多少个
      crossAxisCount: 2,
      //滚动方向
      scrollDirection: Axis.vertical,
      // 左右间隔
      crossAxisSpacing: 10.0,
      // 上下间隔
      mainAxisSpacing: 10.0,
      //宽高比
      childAspectRatio: 1 / 1,

      children: initListWidget(list),
    );
  }

  List<Widget> initListWidget(List<String> list) {
    List<Widget> lists = [];
    for (var item in list) {
      lists.add(new Container(
        height: 50.0,
        width: 50.0,
        color: Colors.yellow,
        child: new Center(child: Text('a')),
      ));
    }
    return lists;
  }
}

class MyApp16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "ConstrainedBox",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('ConstrainedBox'),
            ),
            body: new ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 200),
              child: Text('a'),
            )));
  }
}

class MyApp15 extends StatelessWidget {
  final List<String> item;

  MyApp15({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "stack/positioned",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('stack/positioned'),
            ),
            body: new Center(
              child: new Stack(
                children: <Widget>[
                  new Image.network(
                    'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1573178989&di=5467e073272b5a414945e3365016db56&src=http://hbimg.b0.upaiyun.com/b8a2f3cb90ebfdcc8f432e55137d8008d8e0b53c656d-LYlEC1_fw658',
                    fit: BoxFit.fill,
                  ),
                  new Positioned(
                    top: 1.0,
                    left: 1.0,
                    child: Text(
                      'flutter',
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  new Offstage(
                      offstage: false,
                      child: new Container(
                        child: Text(
                          'visiable',
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 67,
                          ),
                        ),
                      ))
                ],
              ),
            )));
  }
}

class MyApp14 extends StatelessWidget {
  final List<String> item;

  MyApp14({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "FittedBox",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('缩放布局'),
            ),
            body: new Container(
              width: 400.0,
              height: 400.0,
              color: Colors.black,
              child: new FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.topLeft,
                child: new Container(
                  color: Colors.greenAccent,
                  child: Text(
                    '缩放布局',
                    style: new TextStyle(
                      //style 无用
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )));
  }
}

class MyApp13 extends StatelessWidget {
  final List<String> item;

  MyApp13({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "padi",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('padding'),
            ),
            body: new Stack(
              children: <Widget>[
                new Align(
                  alignment: new FractionalOffset(1.0, 0.0),
                  child:
                      new Image.asset('assets/images/ant_installment_icon.png'),
                ),
                new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child:
                      new Image.asset('assets/images/ant_installment_icon.png'),
                ),
              ],
            )));
  }
}

class MyApp12 extends StatelessWidget {
  final List<String> item;

  MyApp12({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "列表",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('居中布局示例'),
            ),
            body: new Center(
              child: Text('center'),
            )));
  }
}

class MyApp11 extends StatelessWidget {
  final List<String> item;

  MyApp11({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "a",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('容器图片展示Expanded'),
            ),
            body: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    // 使用Expanded防止内容溢出
                    new Expanded(
                      child: new Container(
                        width: 100.0,
                        height: 200.0,
                        decoration: new BoxDecoration(
                            border: new Border.all(
                              width: 10,
                              color: Colors.lightBlue,
                            ),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(8.0))),
                        margin: const EdgeInsets.all(20),
                        child: new Image.asset(
                            'assets/images/ant_installment_icon.png'),
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        width: 100.0,
                        height: 200.0,
                        decoration: new BoxDecoration(
                            border: new Border.all(
                              width: 10,
                              color: Colors.lightBlue,
                            ),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(8.0))),
                        margin: const EdgeInsets.all(20),
                        child: new Image.asset(
                            'assets/images/card_package_icon.png'),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}

class MyApp10 extends StatefulWidget {
  final List<String> item;

  MyApp10({Key key, @required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<MyApp10> {
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
    return new MaterialApp(
      title: 'From 表单示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('表单'),
          leading: Icon(Icons.print),
        ),
        body: new Column(
          children: <Widget>[
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
              child: RaisedButton(
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
            )
          ],
        ),
      ),
    );
  }
}

class MyApp9 extends StatelessWidget {
  final List<String> item;

  MyApp9({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "列表",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('列表组件2'),
            ),
            body: new GridView.count(
              crossAxisCount: 3,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Text('ajj'),
                Text('ajj'),
                Text('ajj'),
                Text('ajj'),
                Text('ajj'),
                Text('ajj'),
                Text('ajj'),
                Text('ajj'),
                Text('ajj'),
                Text('ajj'),
              ],
            )));
  }
}

class MyApp8 extends StatelessWidget {
  final List<String> item;

  MyApp8({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "列表",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('列表组件2'),
            ),
            body: new ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return new ListTile(
                    leading: new Icon(Icons.message),
                    title: Text('${item[index]}'),
                  );
                })));
  }
}

class MyApp7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "列表",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('列表组件'),
            ),
            body: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160,
                      color: Colors.orange,
                    ),
                    Container(
                      width: 160,
                      color: Colors.greenAccent,
                      child: Column(
                        children: <Widget>[
                          new Text(
                            '颜色+ 删除线条 + 25',
                            style: new TextStyle(
                                color: const Color(0xffff0000),
                                decoration: TextDecoration.lineThrough,
                                decorationColor: const Color(0xffff0000),
                                fontSize: 25),
                          ),
                          new Text('颜色+ 加粗 + 25',
                              style: new TextStyle(
                                  color: const Color(0xffff0000),
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25))
                        ],
                      ),
                    )
                  ],
                ))));
  }
}

class MyApp6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "ICon",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('图标及按钮组件'),
            ),
            body: new Column(
              children: <Widget>[
                new Icon(
                  Icons.title,
                  color: Colors.greenAccent,
                  size: 30,
                ),
                new IconButton(
                    icon: Icon(
                      Icons.message,
                      color: Colors.lightBlue,
                      size: 56,
                    ),
                    tooltip: '按下提示',
                    onPressed: () {
                      print('按下操作');
                    }),
                new RaisedButton(
                  onPressed: () {
                    print('raisebutton');
                  },
                  color: Colors.lightBlue,
                  child: Text(
                    "raisebutton",
                    style: new TextStyle(color: Colors.black),
                  ),
                )
              ],
            )));
  }
}

class MyApp5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "ImageDemo",
        home: new Scaffold(
          //功能 示抽屉（drawers，比如：左边栏）、通知（snack bars） 以及 底部按钮（bottom sheets）。
          appBar: new AppBar(
            title: new Text('Text'),
          ),
          body: new Column(
            //竖直排列
            children: <Widget>[
              new Text(
                '颜色+ 删除线条 + 25',
                style: new TextStyle(
                    color: const Color(0xffff0000),
                    decoration: TextDecoration.lineThrough,
                    decorationColor: const Color(0xffff0000),
                    fontSize: 25),
              ),
              new Text('颜色+ 加粗 + 25',
                  style: new TextStyle(
                      color: const Color(0xffff0000),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25))
            ],
          ),
        ));
  }
}

class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "ImageDemo",
        home: Center(
          child: new Image.network(
            'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1573178989&di=5467e073272b5a414945e3365016db56&src=http://hbimg.b0.upaiyun.com/b8a2f3cb90ebfdcc8f432e55137d8008d8e0b53c656d-LYlEC1_fw658',
            fit: BoxFit.fill,
          ),
        ));
  }
}

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Container",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container"),
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.orange,
              border: new Border.all(
                color: Colors.lightBlue,
                width: 2,
              ),
              borderRadius:
                  const BorderRadius.all(const Radius.circular(8)), //弧度
            ),
            child: Text(
              'FLUTTER',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'aaa',
      home: new Scaffold(
        floatingActionButton: new Theme(
            data: Theme.of(context),
            child: new FloatingActionButton(
              onPressed: () {
                //launch("https://baidu.com");
                http.get("http://httpbin.org/").then((response) {
                  print("response${response.statusCode}");
                  print(response.body);
                });
              },
              child: new Icon(Icons.computer),
            )),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'appName',
      theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlueAccent, // app主要部分的背景颜色
          accentColor: Colors.orange[600]),
      home: new HomePage(
        title: "appName2",
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<HomePage> {
  int _counter = 0;

  void _addCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Container(
          color: Theme.of(context).accentColor,
          child:
              new Text("$_counter", style: Theme.of(context).textTheme.title),
        ),
      ),
      floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.greenAccent),
          child: new FloatingActionButton(
            onPressed: _addCounter,
            child: new Icon(Icons.computer),
          )),
    );
  }
}
