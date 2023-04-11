import 'dart:convert';
import 'dart:math';

// ignore: avoid_web_libraries_in_flutter
import 'dart:ui' as prefix0;
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/PopRoute.dart';
import 'package:flutter_app/pop/base_pop.dart';
import 'package:flutter_app/pop/pop_child.dart';
import 'package:flutter_app/pop/pop_page.dart';
import 'package:flutter_app/progress/progress_page.dart';
import 'package:flutter_app/providersort/animation.dart';
import 'package:flutter_app/providersort/flutterprovider/providerspage.dart';
import 'package:flutter_app/providersort/provider/model/ThirdModel.dart';
import 'package:flutter_app/providersort/provider/model/model.dart';
import 'package:flutter_app/providersort/provider/model/secondModel.dart';
import 'package:flutter_app/providersort/provider/provier_page2.dart';
import 'package:flutter_app/res_colours.dart';
import 'package:flutter_app/res_styles.dart';
import 'package:flutter_app/tabbar/SugarTabIndicator.dart';
import 'package:flutter_app/textField/textField_page.dart';
import 'package:flutter_app/third/flutterPicker/fluter_picker.dart';
import 'package:flutter_app/watermark/workmark_page.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:popup_window/popup_window.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'dart:async';
import 'SlidingUpPanelExample/sliding_up_panel.dart';
import 'Test.dart';
import 'base/base_page.dart';
import 'base/demo_group.dart';
import 'button/button_page.dart';
import 'chart/chart_page2.dart';
import 'chart/line_chart_sample2.dart';
import 'dialog.dart';
import 'dart:math' as math;

import 'get/get_page.dart';
import 'list/list_page.dart';
import 'material/material_page.dart';
import 'providersort/provider/provier_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// flutter demo https://github.com/nisrulz/flutter-examples
// demo https://github.com/OpenFlutter/Flutter-Notebook
// https://www.jianshu.com/p/7cff367dbdde 快捷键
// Myapp105  CustomScrollView  https://www.jianshu.com/p/2ba93e7bb8ea 参考CustomScrollView
// Myapp106  srcrol View index
//StickyDemo  TestPage  HomeFragmentPage2 // 吸顶效果  // https://www.jianshu.com/p/fdfe6d808705 参考资料
// *****比较好   https://juejin.cn/post/6997202342655311879#heading-30 // 吸顶效果
// MyApp108 头部隐藏和显示效果
// 底部弹窗 跟随键盘动
// const 是编译时常量，用 const 修饰的常量，必须在声明时初始化，并且是可以确定的值。
// 而 final 则是运行时常量，用 final 修饰的常量，必须在声明时初始化，或者在构造函数中初始化，但它的值可以动态计算
// proviersort 包含动画

// https://www.jianshu.com/p/9adf350829c2  自带图标 https://www.jianshu.com/p/6e2509f91aa6

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    /* new MyApp26(
        item: new List<String>.generate(300, (i)=> "item$i"),
      )*/
    GetMaterialApp(
      defaultTransition: Transition.rightToLeftWithFade,
      navigatorKey: Get.key,
      // home: TextFieldPage(),
      // home: MainPage(),
      // home: TableRangeExample(),
      // home: TableComplexExample(),
      // home: TextFieldPage(),
      // home: BasicPage(),
      // home: PopPage(),
      // home: GetDemoPage(),
      home: Demo(),
      // home: SlidingUpPanelExample(),
      navigatorObservers: [
        new MiddleWare(), // 可接听路由情况
      ],
      getPages: [
        GetPage(
            name: "/ButtonPage",
            transition: Transition.fadeIn,
            page: () => ButtonPage("ss", "aa")),
        GetPage(
            name: "/water",
            transition: Transition.fadeIn,
            page: () => WatermarkPage()),
      ],
      localizationsDelegates: [
        PickerLocalizationsDelegate.delegate,
        // 如果要使用本地化，请添加此行，则可以显示中文按钮
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', 'CH'),
        const Locale('ko', 'KO'),
        const Locale('it', 'IT'),
        const Locale('ar', 'AR'),
        const Locale('tr', 'TR'),
      ],
    ),

/*      new MaterialApp(
    title: '',
    home: new TabbarBgColorTest(),*/
  );
}

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoWidget();
  }
}

class DemoWidget extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    List<BasePage> _overlayPages = [
      ButtonPage("button", "按钮基础,带位置引导dialog"),
      TextFieldPage("textField", "输入框"),
      ProgressPage("progress", "进度条"),
      MyApp30("listView", "列表"),
      ListPage2("listView2", "列表带悬浮"),
      TextPage("text", "字体"),
      MyApp3("text", "字体样式"),
      MyApp11("Expanded", "容器图片展示Expanded"),
      MyApp13("Align", "位置控制"),
      MyApp16("ConstrainedBox", "限制框"),
      MyApp19("Transform", "旋转"),
      MyApp18("Table", "表格"),
      MyApp20("Baseline", "Baseline"),
      MyApp21("Wrap", "自动换行"),
      MyApp26("clip等", "圆角"),
      ViewPageState("viewPage", ""),
      MyApp30("Drawer", "侧拉"),
      MyApp101("DropdownButton", "下拉框带悬浮按钮"),
      MyApp103("MyApp103", "滚轮"),
      MyApp104("MenuHome", "popWindow 二维码 水印"),
      OverlayPage("OverlayPage", "导览图"),
      MyProviderApp("MyProviderApp", "Provide"),
      MainPage("animate", "动画"),
      MyApp108("banner", "banner滚动图"),
    ];
    List<BasePage> _overlayPages2 = [
      MyApp22("详情布局", "详情布局"),
      Myapp106("listView跳到指定item", "还需优化"),
      MyApp29("常用button，text等使用", ""),
      TabbarBgColor("tabber", "导航栏和TabBar"),
      BasicPage("日期选取器", ""),
      MyApp107("list滚动", ""),
      TestPage("顶部图片加tabber", ""),
      FlutterPickerPage("pick", ""),
      PopPage("Pop", ""),
      Chart1("syncfusion_flutter_charts", ""),
      Chart2("fl_chart", ""),
      GetDemoPage("getx", "路由"),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('示例')),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DemoGroupWidget(
                  groupLabel: "基础组件",
                  itemPages: _overlayPages,
                ),
                DemoGroupWidget(
                  groupLabel: "常见布局",
                  itemPages: _overlayPages2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MiddleWare extends NavigatorObserver {
  @override
  void didPop(Route route, Route previousRoute) {
    // TODO: implement didPop
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    // TODO: implement didPush
    print("GOING TO ROUTE2 ${route.settings.toString()}");
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    // TODO: implement didRemove
    super.didRemove(route, previousRoute);
  }
}

/// Provider 使用demo
class MyProviderApp extends BasePage {
  MyProviderApp(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ModelTest()),
        ChangeNotifierProvider(create: (context) => ThirdModel()),
        ChangeNotifierProxyProvider<ModelTest, SecondModel>(
          // ChangeNotifierProxyProvider自动disPose已有实例的话 可以用于合并实例
          // 用ChangeNotifierProxyProvider.value 需要手动销毁实例
          create: (context) => SecondModel(),
          update: (context, modelTest, secondModel) {
            print("aaachange ${modelTest.totalPrice}");
            secondModel.setValue = modelTest.totalPrice.toInt();
            return secondModel;
          },
        )
      ],
      child: MaterialApp(
        title: "provier",
        home: ProviderTestPage(),
      ),
    );
  }
}

class MainPage extends BasePage {
  MainPage(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => MainPageBody();
}

class MainPageBody extends StatefulWidget {
  @override
  _MainPageBodyState createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  // 定义 ValueNotifier 对象 _counter
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  // 页面滑动控制器
  PageController _ctrl;

  @override
  void initState() {
    _ctrl = PageController(
      viewportFraction: 0.9,
    )..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.black,
            child: Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: const Color(0xFFE8581C),
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

typedef ValueWidgetBuilder<T> = Widget Function(
    BuildContext context, T value, Widget child);

class BasicPage extends BasePage {
  BasicPage(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => BasicPageBody();
}

class BasicPageBody extends StatefulWidget {
  @override
  _BasicPageBodyState createState() => _BasicPageBodyState();
}

class _BasicPageBodyState extends State<BasicPageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("showModalBottomSheet"),
      ),
      body: Center(),
      bottomNavigationBar: BottomAppBar(
        child: bottomNewCommentButton(),
      ),
    );
  }

  Container bottomNewCommentButton() {
    return Container(
      child: ElevatedButton(
        child: Text("Publish",
            style: TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: () {
          Pickers.showDatePicker(
            context,
            // 模式，详见下方
            mode: DateMode.YMDHM,
            // 后缀 默认Suffix.normal()，为空的话Suffix()
            // suffix: Suffix(hours: ' 小时', minutes: ' 分钟', seconds: ' 秒'),
            // 样式  详见下方样式
            // pickerStyle: pickerStyle,
            // 默认选中
            selectDate: PDuration(
                year: 2021,
                month: 12,
                day: 10,
                hour: 18,
                minute: 36,
                second: 36),
            minDate: PDuration(year: 2021, month: 12, day: 10, hour: 10),
            maxDate: PDuration(
                year: 2023,
                month: 12,
                day: 10,
                hour: 12,
                minute: 40,
                second: 36),
            onConfirm: (p) {
              print('longer >>> 返回数据：$p');
            },
            // onChanged: (p) => print(p),
          );
          /*showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                // 5126。86 2176.03
                return new AnimatedPadding(
                  padding: MediaQuery.of(context).viewInsets,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    child: textField(),
                    padding: EdgeInsets.all(7),
                  ),
                );
              });*/
        },
      ),
      height: 50,
    );
  }

  Row textField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: new TextField(
            decoration: InputDecoration(
              hintText: 'Say something here...',
              border: null,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue[300]),
              ),
            ),
            keyboardType: TextInputType.text,
            maxLength: 250,
            maxLines: 10,
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

//滚动最大距离
const APPBAR_SCROLL_OFFSET = 100;

class MyApp108 extends BasePage {
  MyApp108(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => MyApp108Body();
}

class MyApp108Body extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<MyApp108Body> {
  List _imageUrl = [
    'https://dimg04.c-ctrip.com/images/zg0o180000014yl20DEA4.jpg',
    'https://dimg04.c-ctrip.com/images/zg0f180000014vrut370F.jpg',
    'https://dimg04.c-ctrip.com/images/zg0n18000001528jhD6B2.jpg'
  ];
  double appBarAlpha = 0;

  __onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
            context: context,
            removeTop: false,
            //监听列表的滚动
            child: NotificationListener(
              //监听滚动后要调用的方法
              // ignore: missing_return
              onNotification: (scrollNotification) {
                //只有当是更新状态下和是第0个child的时候才会调用
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  __onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 110,
                    child: Swiper(
                      //item的数量
                      itemCount: _imageUrl.length,
                      //自动播放
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          _imageUrl[index],
                          fit: BoxFit.fill,
                        );
                      },
                      //banner上添加指示器
                      pagination: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              activeColor: Colors.red)),
                    ),
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text("哈哈"),
                    ),
                  )
                ],
              ),
            )),
        //通过Opacity的透明度来控制appBar的显示与隐藏
        // opacity:透明度，0.0 到 1.0，0.0表示完全透明，1.0表示完全不透明
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("首页"),
              ),
            ),
          ),
        )
      ],
    ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MyApp107 extends BasePage {
  MyApp107(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => MyApp107Body();
}

class MyApp107Body extends StatefulWidget {
  @override
  _TestPageState2 createState() => _TestPageState2();
}

class _TestPageState2 extends State<MyApp107Body> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            new SliverList(
                delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return new Container(
                height: 400,
                child: new ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return new InkWell(
                        child: new Container(
                          child: new Card(
                            elevation: 15.0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14.0))),
                            child: new Container(
                              padding: EdgeInsets.all(8.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Text("小麦"),
                                  new Text("安徽省合肥市"),
                                  new Text("2170"),
                                  new Text("0.9%")
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: () => {},
                      );
                    }),
              );
            }, childCount: 1)),
            new SliverList(
                delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return new InkWell(
                child: new Container(
                  child: new Card(
                    elevation: 15.0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: new Container(
                      padding: EdgeInsets.all(8.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text("小麦"),
                          new Text("安徽省合肥市"),
                          new Text("2170"),
                          new Text("0.9%")
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () => {},
              );
            }, childCount: 10)),
            new SliverList(
                delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return new InkWell(
                child: new Container(
                  height: 400,
                  color: Colors.blueAccent,
                  child: Text("data"),
                ),
                onTap: () => {},
              );
            }, childCount: 1)),
          ],
        ),
        Container(
          height: 50,
          child: Container(
            child: Text(
              //设置带背景色 的高亮水波纹 效果（Material 和 InkWeel 组合使用）
              "涉及多方了解上的飞机，设计的法律上京东方。所经历的计算机撒旦解放，使得开发商开发圣诞节",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..color = Colors.blue,
                  fontSize: 17),
            ),
          ),
        ),
      ],
    ));
  }
}

const url =
    'http://www.pptbz.com/pptpic/UploadFiles_6909/201203/2012031220134655.jpg';

class TestPage extends BasePage {
  TestPage(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => TestPageBody();
}

class TestPageBody extends StatefulWidget {
  @override
  _TestPageBodyState createState() => _TestPageBodyState();
}

class _TestPageBodyState extends State<TestPageBody> {
  var tabTitle = [
    '1',
    '页面2',
    '页面3阿萨德发顺丰',
  ];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: tabTitle.length,
        child: Scaffold(
          body: new NestedScrollView(
            headerSliverBuilder: (context, bool) {
              return [
                SliverAppBar(
                  expandedHeight: 56.0,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      title: Text("data"),
                      background: Image.network(
                        url,
                        fit: BoxFit.cover,
                      )),
                ),
                new SliverPersistentHeader(
                  delegate: new SliverTabBarDelegate(
                    /**
                        const TabBar({
                        Key key,
                        @required this.tabs,//显示的标签内容，一般使用Tab对象,也可以是其他的Widget
                        this.controller,//TabController对象
                        this.isScrollable = false,//是否可滚动
                        this.indicatorColor,//指示器颜色
                        this.indicatorWeight = 2.0,//指示器高度
                        this.indicatorPadding = EdgeInsets.zero,//底部指示器的Padding
                        this.indicator,//指示器decoration，例如边框等
                        this.indicatorSize,//指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
                        this.labelColor,//选中label颜色
                        this.labelStyle,//选中label的Style
                        this.labelPadding,//每个label的padding值
                        this.unselectedLabelColor,//未选中label颜色
                        this.unselectedLabelStyle,//未选中label的Style
                        }) : assert(tabs != null),
                        assert(isScrollable != null),
                        assert(indicator != null || (indicatorWeight != null && indicatorWeight > 0.0)),
                        assert(indicator != null || (indicatorPadding != null)),
                        super(key: key);
                     */
                    new TabBar(
                      tabs: tabTitle.map((f) => Tab(text: f)).toList(),
                      // indicatorColor: Colors.blue,
                      indicator: SugarTabIndicator(gradientColor: [
                        Color(0xFF3492FB),
                        Color(0xFFC4DBFD)
                      ]),
                      unselectedLabelColor: Color(0xFF666666),
                      labelColor: Colors.blue,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 2,
                      /*indicator: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(50)), //弧度
                      ),*/
                    ),
                    color: Colors.white,
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: tabTitle
                  .map((s) => Container(
                            color: Colors.greenAccent,
                            height: 23,
                          ) /*ListView.builder(
                        itemBuilder: (context, int) => Text("123"),
                        itemCount: 100,
                      )*/
                      )
                  .toList(),
            ),
          ),
        ));
  }
}

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar widget;
  final Color color;

  const SliverTabBarDelegate(this.widget, {this.color})
      : assert(widget != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: widget,
      color: color,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => widget.preferredSize.height;

  @override
  double get minExtent => widget.preferredSize.height;
}

class StickyDemo extends StatefulWidget {
  final String title;

  StickyDemo({Key key, this.title}) : super(key: key);

  @override
  _StickyDemoState createState() => _StickyDemoState();
}

class _StickyDemoState extends State<StickyDemo>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('开学季 Pinned 效果'),
              background: Image.network(
                "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this.tabController,
                tabs: <Widget>[
                  Tab(text: 'Home'),
                  Tab(text: 'Profile'),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                Center(child: Text('Content of Home')),
                Center(child: Text('Content of Profile')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class MyApp105 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CustomScrollViewPage();
  }
}

class _CustomScrollViewPage extends State<MyApp105> {
  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            height: 340,
            decoration: BoxDecoration(
                gradient: new LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.cyan, Colors.white, Colors.blue])))
      ],
    )*/

        /*SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 500,
              color: Colors.red,

              child: Text("data"),
            ),
            Container(
              height: 300,
              child: ListView.builder(
//                  shrinkWrap: false,
//                  physics: new NeverScrollableScrollPhysics(),
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return new ListTile(
                      leading: new Icon(Icons.message),
                      title: Text('aaaa$index'),
                    );
                  }),
            ),
            Container(
              height: 200,
              color: Colors.blue,
              child: Text("data"),
            ),
          ],
        ),
      )*/
        Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        //BouncingScrollPhysics 弹性效果   ClampingScrollPhysics  夹击
        reverse: false,
        // 反转页面
//        shrinkWrap: true,
//      dragStartBehavior: DragStartBehavior.start,
//        cacheExtent: ,
//          anchor: 0.1 ,
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            onStretchTrigger: () {
              // Function callback for stretch
              return;
            },
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: false,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Sunday'),
                subtitle: Text('sunny, h: 80, l: 65'),
              ),
              ListTile(
                leading: Icon(Icons.center_focus_weak),
                title: Text('Monday'),
                subtitle: Text('sunny, h: 80, l: 65'),
              ),
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Monday'),
                subtitle: Text('sunny, h: 80, l: 65'),
              ),
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Monday'),
                subtitle: Text('sunny, h: 80, l: 65'),
              ),
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Monday'),
                subtitle: Text('sunny, h: 80, l: 65'),
              ),
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Monday'),
                subtitle: Text('sunny, h: 80, l: 65'),
              ),
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Monday'),
                subtitle: Text('sunny, h: 80, l: 65'),
              ),
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Monday'),
                subtitle: Text('sunny, h: 80, l: 65'),
              ),
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Monday'),
                subtitle: Text('sunny, h: 80, l: 65'),
              ),
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Monday'),
                subtitle: Text('sunny, h: 80, l: 65'),
              ),
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Monday'),
                subtitle: Text('sunny, h: 80, l: 65'),
              ),

              // ListTiles++
            ]),
          ),
        ],
      ),
    );
  }
}

class OverlayPage extends BasePage {
  OverlayPage(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => OverlayPageBody();
}

/*
 引导图标
 */
class OverlayPageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new OverlayPageBodyState();
  }
}

class OverlayPageBodyState extends State<OverlayPageBody> {
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
  void dispose() {
    OverlayDialog2.cancelToast();
    OverlayDialog._cancelToast();
    super.dispose();
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
            ElevatedButton(
              onPressed: () {
                OverlayDialog._cancelToast();
              },
              child: Text("取消"),
            ),
            ElevatedButton(
              onPressed: () {
                OverlayDialog.show(context, message: "测试");
              },
              child: Text("弹出"),
            ),
            ElevatedButton(
              onPressed: () {
                OverlayDialog2.cancelToast();
              },
              child: Text("取消2"),
            ),
            ElevatedButton(
              onPressed: () {
                // OverlayDialog2.show(context);
                // OverlayDialog2.show(context,
                //     message: "换电中，预计五分钟...", height: 142,count: -1);
                OverlayDialog2.show(context,
                    message: "换电成功",
                    status: "SUCCESS",
                    bgColor: Color(0xE5000000));
              },
              child: Text("弹出2"),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () {
                  Loading.show(context, left: dx);
                },
                key: anchorKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverlayDialog2 {
  static OverlayEntry _overlayEntry; // 浮层，Toast显示全靠它
  static Timer timer;

  static void show(
    BuildContext context, {
    String message = "结束中", // 文本内容
    int count = 30, // count =-1时 不启用倒计时功能
    double height = 120,
    String status = "LOADING", // LOADING  加载  FAIL 失败 SUCCESS 成功
    Color bgColor, // 背景颜色
  }) async {
    if (bgColor == null) {
      bgColor = Color(0xA6000000);
    }
    OverlayDialog2.cancelToast();
    var countInit = true;
    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState2) {
          if (countInit && count != -1 && status == "LOADING") {
            countInit = false;
            timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
              count--;
              if (count <= 0) {
                cancelToast();
              }
              setState2(() {});
            });
          }
          return Material(
            //创建透明层
            type: MaterialType.transparency, //透明类型
            child: Center(
              child: Container(
                width: 120,
                height: height,
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 24,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Visibility(
                      visible: "LOADING" == status,
                      child: Container(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                          backgroundColor: Colors.transparent,
                        ),
                        width: 27,
                        height: 27,
                      ),
                    ),
                    Visibility(
                      visible: "FAIL" == status,
                      child: new Image.asset(
                        'assets/images/swap_fail_close.png',
                        width: 28,
                        height: 28,
                      ),
                    ),
                    Visibility(
                      visible: "SUCCESS" == status,
                      child: new Image.asset(
                        'assets/images/swap_success.png',
                        width: 28,
                        height: 28,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 14, left: 16, right: 16),
                      child: Text(
                        "$message${count != -1 && status == "LOADING" ? count : ""}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    WidgetsBinding.instance
        .addPostFrameCallback((_) => overlayState.insert(_overlayEntry));
  }

  // 移除Toast
  static cancelToast() async {
    if (_overlayEntry != null) {
      _overlayEntry.remove();
      _overlayEntry = null;
    }
    _cancelTimer();
  }

  // 单独取消倒计时
  static _cancelTimer() async {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
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
                    ),
                  ),
                  Positioned(
                    left: 140,
                    bottom: 222,
                    child: GestureDetector(
                      onTap: () {
                        _cancelToast();
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

class TabbarBgColor extends BasePage {
  TabbarBgColor(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => TabbarBgColorTestBody();
}

class TabbarBgColorTestBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabbarBgColorTesttate();
  }
}

class _TabbarBgColorTesttate extends State<TabbarBgColorTestBody>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final List<String> _tabs = ["新闻", "历史", "图片"];
  TabController _tabController;
  PageController _pageController = PageController();
  List<Widget> pageList = [
    TestPageBody(),
    Myapp106("", ""),
    MyApp3("", ""),
  ];

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
                child: Offstage(
                  offstage: _selectedIndex != 0,
                  child: TabBar(
                    // indicator: ColorTabIndicator(Colors.black),//选中标签颜色
                    indicatorColor: Colors.black,
                    //选中下划线颜色,如果使用了indicator这里设置无效
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.yellow,
//                    indicatorPadding: EdgeInsets.all(10),
                    tabs: _tabs
                        .map((item) => Tab(
                              child: Container(child: Text(item)),
                            ))
                        .toList(),
                  ),
                ),
              ),
            )),
        body:
            _currentPage() /*_selectedIndex == 0
            ? TabBarView(
                controller: _tabController,
                children: _tabs
                    .map((item) => Container(
                          color: Colors.blueGrey,
                          alignment: AlignmentDirectional.center,
                          child: Text(item),
                        ))
                    .toList(),
              )
            : pageList[_selectedIndex]*/
        ,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
//              backgroundColor: Colors.blue,
              icon: Container(
                width: 35,
                height: 25,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 5,
                      child: Icon(Icons.message),
                    ),
                    Positioned(
                      right: 0,
                      top: -0,
                      child: Container(
                        width: 15,
                        height: 15,
                        child: new ClipOval(
                          child: new Container(
                            alignment: Alignment.center,
                            width: 15,
                            height: 15,
                            color: Colors.red,
                            child: Text(
                              "1",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              label: "首页",
            ),
            BottomNavigationBarItem(
//              backgroundColor: Colors.green,
              icon: Icon(Icons.message),
              label: "销售",
            ),
            BottomNavigationBarItem(
//              backgroundColor: Colors.amber,
              icon: Icon(Icons.shopping_cart),
              label: " 购物车",
            ),
            BottomNavigationBarItem(
//              backgroundColor: Colors.red,
              icon: Icon(Icons.person),
              label: "个人中心",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              _selectedIndex = index;
            });
            print(_selectedIndex);
          },
        ));
  }

  // 底部导航对应的页面
  Widget _currentPage() {
    return PageView.builder(
        onPageChanged: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: pageList.length,
        itemBuilder: (context, index) {
          return pageList[index];
        });
  }

  @override
  bool get wantKeepAlive => true;
}

class MyApp104 extends BasePage {
  MyApp104(String title, String subTitle) : super(title, subTitle);

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
  GlobalKey _stackKey = GlobalKey();
  GlobalKey _stackKey2 = GlobalKey();
  int count = 0;

  @override
  void initState() {
    // test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '弹出菜单演示',
      home: new Scaffold(
        appBar: new AppBar(
            centerTitle: true,
            title: ElevatedButton(
              onPressed: () {
                final RenderBox button =
                    _stackKey.currentContext.findRenderObject();
                final RenderBox overlay = Overlay.of(_stackKey.currentContext)
                    .context
                    .findRenderObject();
                final RelativeRect position = RelativeRect.fromRect(
                  Rect.fromPoints(
                    button.localToGlobal(Offset(0, 0), ancestor: overlay),
                    button.localToGlobal(button.size.bottomRight(Offset.zero),
                        ancestor: overlay),
                  ),
                  Offset.zero & overlay.size,
                );
                showWindow(
                    position: position,
                    context: context,
                    duration: 300,
                    onWindowShow: () {},
                    onWindowDismiss: () {},
                    windowBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return Container(
                        child: Stack(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FadeTransition(
                              opacity: animation,
                              child: SizeTransition(
                                sizeFactor: animation,
                                child: Material(
                                  child: Container(
                                    height: 420,
                                    child: GestureDetector(
                                      child: MediaQuery.removePadding(
                                        removeTop: true,
                                        context: context,
                                        child: ListView(
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: Text("1111"),
                                              height: 200,
                                            ),
                                            Container(
                                              child: Text("1111"),
                                              height: 200,
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        // Navigator.of(context).pop();
                                      },
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.tealAccent,
                                      borderRadius: const BorderRadius.only(
                                          bottomRight:
                                              const Radius.circular(20),
                                          bottomLeft:
                                              const Radius.circular(20)), //弧度
                                    ),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Text("data$count"),
            )),
        //这是屏幕主体包含一个中央空间，里面是一个文本内容以及字体大小
        body: Container(
          child: Stack(
            children: [
              Container(
                key: _stackKey,
                child: Text("$_bodyText"),
              ),
              ListView(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(
                        "/water",
                        arguments: {"a": 12},
                      ).then((value) => {
                            print("aaaa back ${value.toString()}"),
                          });
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      // 第一种通过 PopChildView 第二种通过 StatefulBuilder来实现
                      showBaseWindow(
                        context,
                        _stackKey,
                        showBg: true,
                        child: PopChildView(),
                      );
                    },
                    child: Container(
                      child: Text("1111"),
                      height: 200,
                    ),
                  ),
                ],
              )
              /* PopupWindowButton(
                  offset: Offset(0, 40),
                  buttonBuilder: (BuildContext context) {
                    return Text("ddffff");
                  },
                  windowBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                        sizeFactor: animation,
                        child: Container(
                          color: Colors.greenAccent,
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    );
                  },
                  onWindowShow: () {
                    print('PopupWindowButton window show');
                  },
                  onWindowDismiss: () {
                    print('PopupWindowButton window dismiss');
                  }),*/
            ],
          ),
        ) /* new Center(
          child: PopupWindowButton(
              offset: Offset(0, 40),
              buttonBuilder: (BuildContext context) {
                return Text("ddffff");
              },
              windowBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: SizeTransition(
                    sizeFactor: animation,
                    child: Container(
                      color: Colors.greenAccent,
                      height: 40,
                      width: 40,
                    ),
                  ),
                );
              },
              onWindowShow: () {
                print('PopupWindowButton window show');
              },
              onWindowDismiss: () {
                print('PopupWindowButton window dismiss');
              }),
        )*/
        ,
      ),
    );
  }

  void test() {
    _bodyText = "aldjflasj阿放假啊了解对方";
  }
}

class MyApp103 extends BasePage {
  MyApp103(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => MyApp103Body();
}

class MyApp103Body extends StatefulWidget {
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
class _testLiandongState3 extends State<MyApp103Body> {
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
              ElevatedButton(
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
              GestureDetector(
                child: Text(
                  "clic",
                  style: TextStyle(fontSize: 44),
                ),
                onTap: () {
//                  showOverlay(context);
//                Toast2.show(context: context,message: "sljfjsf");
//                  showWeixinButtonView();
                },
              ),
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

class MyApp101 extends BasePage {
  MyApp101(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => MyApp101Body();
}

class MyApp101Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _testLiandongState();
  }
}

// ignore: camel_case_types
class _testLiandongState extends State<MyApp101Body> {
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
    return new Scaffold(
      appBar: AppBar(
        title: Text('pageView Image'),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
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
            width: 200,
          ),
          FloatingActionButton(
            onPressed: () {
              // String url =
              //     'https://cebs-api.solandenergy.com/app/auth/swap/driver/sendverifycode';
              // Map<String, dynamic> queryParameters = {};
              // queryParameters['phone'] = "13136105770";
              // HttpBaseUtil().request(context,
              //     url: url,
              //     queryParameters: queryParameters,
              //     method: RequestMethod.post);
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(title: Text('My Page')),
                    body: Center(
                      child: TextButton(
                        child: Text('POP'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              ));
            },
            child: Text("text"),
          )
        ],
      )),
    );
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

class MyApp30 extends BasePage {
  MyApp30(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => MyApp30Body();
}

class MyApp30Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LinearGradientState();
  }
}

class LinearGradientState extends State<MyApp30Body> {
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
                ElevatedButton(
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

class MyApp29 extends BasePage {
  MyApp29(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => MyApp29Body();
}

class MyApp29Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TextFieldState();
  }
}

class TextFieldState extends State<MyApp29Body>
    with SingleTickerProviderStateMixin {
  var controller;
  AnimationController animationController;
  Animation<Offset> animation;
  TextEditingController rechargeController = TextEditingController();

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
                Container(
                  child: Text(
                    //设置带背景色 的高亮水波纹 效果（Material 和 InkWeel 组合使用）
                    "涉及多方了解上的飞机，设计的法律上京东方。所经历的计算机撒旦解放，使得开发商开发圣诞节",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..color = Colors.blue,
                        fontSize: 18),
                  ),
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(decoration: TextDecoration.none),
                      children: <InlineSpan>[
                        TextSpan(
                            text: 'ssss',
                            style: TextStyle(color: Colors.red, fontSize: 25)),
                        TextSpan(
                            text: '，',
                            style: TextStyle(color: Colors.blueAccent)),
                        TextSpan(
                            text: '一个有态度的程序员',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 12)),
                      ]),
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
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    clipBehavior: Clip.antiAlias,

                    // highlightColor: Colors.red,
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
                Container(
                  child: Text("data"),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Offstage(
                offstage: false,
                child: IntrinsicHeight(
                  // // 自适应高度
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
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              clipBehavior: Clip.antiAlias,
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

class ViewPageState extends BasePage {
  ViewPageState(String title, String subTitle) : super(title, subTitle);

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

typedef void OnTapViewPagerItem(String data);

class ViewPage extends BasePage {
  ViewPage(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => ViewPagerBody([], null);
}

class ViewPagerBody extends StatefulWidget {
  final List<String> viewPagerData;
  final OnTapViewPagerItem onTap;

  ViewPagerBody(this.viewPagerData, this.onTap, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePagerState();
  }
}

class _HomePagerState extends State<ViewPagerBody> {
  int virtualIndex = 0;
  int realIndex = 1;

  PageController controller;
  Timer timer;
  PageController _transController;

  var _currentPageValue = 0.0;

  PageController _entryController;

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

class MyApp26 extends BasePage {
  MyApp26(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Container(
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              new Image.asset(
                'assets/images/qr_zhilun.jpg',
                fit: BoxFit.fill,
              ),
              GestureDetector(
                child: new ClipOval(
                  child: new SizedBox(
                    width: 50,
                    height: 50,
                    child: new Image.asset(
                      'assets/images/qr_zhilun.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                onTap: () {
                  //  show(context);
                },
              ),
              new CircleAvatar(
                backgroundColor: Colors.red,
                radius: 40,
                backgroundImage: AssetImage("assets/images/qr_zhilun.jpg"),
              ),
              new Container(
                width: 72.0,
                height: 72.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/up_version.png"),
                  ),
                ),
              ),
              new ClipRRect(
                borderRadius: new BorderRadius.all(new Radius.circular(100)),
                child: new Image.asset(
                  "assets/images/qr_zhilun.jpg",
                  width: 100,
                  height: 100,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(11.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                      shape: BoxShape.circle
                ),
                child: Text("data"),
//                    transform: new Matrix4.rotationZ(0.3),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Myapp106 extends BasePage {
  Myapp106(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => Myapp106Body();
}

class Myapp106Body extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll To Index Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage106(title: 'Scroll To Index Demo'),
    );
  }
}

class MyHomePage106 extends StatefulWidget {
  MyHomePage106({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePage106State createState() => _MyHomePage106State();
}

class _MyHomePage106State extends State<MyHomePage106>
    with AutomaticKeepAliveClientMixin {
  static const maxCount = 100;
  final random = math.Random();

//  final scrollDirection = Axis.vertical;

  AutoScrollController controller;
  List<List<int>> randomList;
  var list = new List<dynamic>.generate(100, (i) => i);

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
//        axis: scrollDirection
    );
    randomList = List.generate(maxCount,
        (index) => <int>[index, (1000 * random.nextDouble()).toInt()]);
    LogUtil.e("aaaaaaaaaaaaaaaaaaa initState");
  }

  @override
  void dispose() {
    LogUtil.e("aaaaaaaaaaaaaaaaaaa dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        controller: controller,
        cacheExtent: 1.0,
        children: list.map((data) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: _getRow(data, math.max(data.toDouble(), 50.0)),
          );
        }).toList(),
      ) /*ListView(
//        scrollDirection: scrollDirection,
        controller: controller,
        children: randomList.map<Widget>((data) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: _getRow(data[0], math.max(data[1].toDouble(), 50.0)),
          );
        }).toList(),
      )*/
      ,
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToIndex,
        tooltip: 'Increment',
        child: Text("10"),
      ),
    );
  }

  Future _scrollToIndex() async {
    await controller.scrollToIndex(10,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(10);
  }

  Widget _getRow(int index, double height) {
    return _wrapScrollTag(
        index: index,
        child: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.topCenter,
          height: height,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue, width: 4),
              borderRadius: BorderRadius.circular(12)),
          child: Text('index: $index, height: $height'),
        ));
  }

  Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class MyApp22 extends BasePage {
  MyApp22(String title, String subTitle) : super(title, subTitle);

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
                          crossAxisAlignment:
                              CrossAxisAlignment.start, //水平方向左边对齐,
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

class MyApp21 extends BasePage {
  MyApp21(String title, String subTitle) : super(title, subTitle);

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
                    label: new ElevatedButton(onPressed: () {
                      print('顺利交付的计算机');
                    }))
              ],
            )));
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
     */ /*Column(
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
  }
}

class MyApp20 extends BasePage {
  MyApp20(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Baseline",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('Baseline'),
            ),
            body: new Row(
              children: <Widget>[
                new Baseline(
                  baseline: 45,
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    'AbGaSdjls放辣椒',
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

class MyApp19 extends BasePage {
  MyApp19(String title, String subTitle) : super(title, subTitle);

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

class MyApp18 extends BasePage {
  MyApp18(String title, String subTitle) : super(title, subTitle);

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

class MyApp16 extends BasePage {
  MyApp16(String title, String subTitle) : super(title, subTitle);

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
              child: Text('aaaaaaa'),
            )));
  }
}

class MyApp13 extends BasePage {
  MyApp13(String title, String subTitle) : super(title, subTitle);

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
                new Image.network(
                  'https://upload.jianshu.io/users/upload_avatars/3884536/d847a50f1da0.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
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
            )));
  }
}

class MyApp11 extends BasePage {
  MyApp11(String title, String subTitle) : super(title, subTitle);

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

class TextPage extends BasePage {
  TextPage(String title, String subTitle) : super(title, subTitle);

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
                      fontSize: 25)),
              Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0x330000FF),
                    /*   border:
                      Border.all(color: Colors.red, width: 2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10)),*/
                    /*boxShadow: [
                    BoxShadow(color: Colors.blue, offset: Offset(5, 5))
                  ],*/
                    /* BoxShadow(
                      color: Colors.red.withOpacity(0.2),
                      offset: Offset(-6.0, 6.0), //阴影x轴偏移量
                      blurRadius: 10, //阴影模糊程度
                      spreadRadius: 5 //阴影扩散程度
                  )*/
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.yellow]),
                    backgroundBlendMode: BlendMode.srcATop,
                    shape: BoxShape.circle),
//                  foregroundDecoration: FlutterLogoDecoration(),
//                  transform: Matrix4.rotationZ(1),
                child: new Text(
                  "100",
//                    textDirection: TextDirection.rtl,
                  style: TextStyle(),
                ),
//                  alignment: Alignment(0, 0),
                alignment: AlignmentDirectional.center,
              )
            ],
          ),
        ));
  }
}

class MyApp3 extends BasePage {
  MyApp3(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Container",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container"),
        ),
        body: Center(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                print("aaaa");
              },
              child: Column(
                children: [
                  Text(
                    'Roboto Mono sample',
                    style: TextStyle(fontFamily: 'Schyler'),
                  ),
                  Text(
                    'Roboto Mono sample',
                    style: TextStyle(fontFamily: 'RobotoMono'),
                  )
                ],
              ),
            ),
          ),
        ),
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
          child: new Text("$_counter",
              style: Theme.of(context).textTheme.subtitle1),
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
