import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/base/base_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';
import 'base_sliber_persistent.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2022/1/6 2:50 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2022/1/6 2:50 下午
///  @UpdateRemark: 更新说明
class ListPage extends BasePage {
  ListPage(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => ListPageBody();
}
class ListPageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPageBodyState();
  }
}

class _ListPageBodyState extends State<ListPageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 100,
          //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 4,
              //纵轴间距
              mainAxisSpacing: 10.0,
              //横轴间距
              crossAxisSpacing: 6.0,
              //子组件宽高长度比例
              childAspectRatio: 72 / 26),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.blueAccent, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "sssss$index",
                    style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.close,
                      size: 16,
                      color: Color(0xFFC4C4C4),
                    ),
                  )
                ],
              ),
            );
          }),
       /* new GridView.count(

        //一行多少个
      crossAxisCount: 4,
      //滚动方向
      scrollDirection: Axis.vertical,
      // 左右间隔
      crossAxisSpacing: 10.0,
      // 上下间隔
      mainAxisSpacing: 10.0,
      //宽高比
      childAspectRatio: 1 / 1,
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
        )*/
    );
  }
}
class ListPage2 extends BasePage {
  ListPage2(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => HomeFragmentPage2();
}
class HomeFragmentPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeFragmentPageState2();
  }
}

class _HomeFragmentPageState2 extends State
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int groupValue;
  static const List<String> selections = <String>[
    'Hercules Mulligan',
    'Eliza Hamilton',
    'Philip Schuyler',
    'Maria Reynolds',
    'Samuel Seabury',
  ];
  @override
  void initState() {
    this.tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("title"),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            new SliverList(
              delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return new Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: new Column(
                    children: <Widget>[
                      Container(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return RadioListTile<int>(
                                value: index,
                                groupValue: groupValue,
                                toggleable: true,
                                title: Text(selections[index]),
                                onChanged: (int value) {
                                  setState(() {
                                    groupValue = value;
                                  });
                                },
                              );
                            },
                            itemCount: selections.length,
                          )),
//              banner
                      new Container(
                          height: 300,
                          child: new Image.network(
                            "https://upload.jianshu.io/users/upload_avatars/3884536/d847a50f1da0.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240",
                            fit: BoxFit.cover,
                          )),
//               功能栏
                      new Container(
                        height: 100,
                        color: Colors.greenAccent,
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: new GestureDetector(
                                child: new Column(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.add_shopping_cart,
                                      size: 45,
                                    ),
                                    new Text(
                                      "交易查询",
                                      style: new TextStyle(
                                          fontSize: 12, color: Colors.black38),
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                                onTap: () {
                                  Fluttertoast.showToast(
                                    msg: "点击了交易查询",
                                  );
                                },
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: new GestureDetector(
                                child: new Column(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.add_shopping_cart,
                                      size: 45,
                                    ),
                                    new Text(
                                      "我的仓单",
                                      style: new TextStyle(
                                          fontSize: 12, color: Colors.black38),
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                                onTap: () {
                                  Fluttertoast.showToast(
                                    msg: "点击了我的仓单",
                                  );
                                },
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: new GestureDetector(
                                child: new Column(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.add_shopping_cart,
                                      size: 45,
                                    ),
                                    new Text(
                                      "资金管理",
                                      style: new TextStyle(
                                          fontSize: 12, color: Colors.black38),
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                                onTap: () {
                                  Fluttertoast.showToast(
                                    msg: "点击了资金管理",
                                  );
                                },
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: new GestureDetector(
                                child: new Column(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.add_shopping_cart,
                                      size: 45,
                                    ),
                                    new Text(
                                      "用户中心",
                                      style: new TextStyle(
                                          fontSize: 12, color: Colors.black38),
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                                onTap: () {
                                  Fluttertoast.showToast(
                                    msg: "点击了用户中心",
                                  );
                                },
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      // 交易信息
                      new Container(
                        height: 130,
                        child: new Center(
                          child: new ListView.builder(
                              padding: EdgeInsets.all(10.0),
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return new GestureDetector(
                                  child: new Card(
                                    elevation: 15.0,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14.0))),
                                    child: new Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Text("小麦"),
                                          new Text("安徽省合肥市"),
                                          new Text("2170"),
                                          new Text("0.9%")
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () => _listItemOnTap(index),
                                );
                              }),
                        ),
                      ),
                      new Container(
                        width: double.infinity,
                        height: 10,
                        color: Colors.black12,
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(1)),
                          border: new Border.all(color: Colors.black, width: 1),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 14,
                          height: 14,
                          child: Checkbox(
                              fillColor:
                                  MaterialStateProperty.all(Colors.white),
                              checkColor: Colors.black,
                              value: true,
                              splashRadius: 1,
                              side: BorderSide.none,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.values[1],
                              onChanged: (bool newValue) {
                                setState(() {});
                              }),
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              width: 3,
                              height: 16,
//                      color: Colors.red,
                              decoration: new BoxDecoration(
                                  border: new Border.all(
                                      color: Colors.red, width: 0.5),
                                  color: Colors.red,
                                  borderRadius:
                                      new BorderRadius.circular((20.0))),
                            ),
                            new Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: new Text(
                                "行业快讯",
                                style: new TextStyle(
                                    fontSize: 17.0,
                                    color: new Color(0xFF333333)),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }, childCount: 1),
            ),
            /*SliverAppBar(
          pinned: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('开学季 Pinned 效果'),
            background: Image.network(
              "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),*/
            // 定位
            new SliverPersistentHeader(
              delegate: new MySliverPersistentHeaderDelegate(
                  Container(
                    height: 40,
                    color: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Visibility(
                      visible: true,
                      child: Text("data"),
                    ),
                  ),
                  40,
                  40),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.yellow,
                height: 40,
                margin: EdgeInsets.only(top: 20, bottom: 10),
                alignment: Alignment.center,
                child: Text(
                  "lsflsjfdjsldjflsjdf}",
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
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
                onTap: () => _listItemOnTap(index),
              );
            }, childCount: 10))
          ],
        ));
  }

  _listItemOnTap(int index) {
    Fluttertoast.showToast(msg: "当前点击的是list里的第$index");
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
//  ScrollController controller;
  var list = new List<String>.generate(100, (i) => "item $i");
  List<GlobalKey> keys = <GlobalKey>[];
  ScrollController controller;

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < list.length; i++) {
      keys.add(GlobalKey(debugLabel: i.toString()));
    }

    controller = new ScrollController();
    controller.addListener(() {
      var position = controller.position;
      var offset = controller.initialScrollOffset;
      var maxScrollExtent2 = controller.position.maxScrollExtent;
      var minScrollExtent = controller.position.minScrollExtent;
      LogUtil.e("aaaaaaaaaaaaa position  " + position.toString());
      LogUtil.e("aaaaaaaaaaaaa     controller.offset ${controller.offset}");
      LogUtil.e("aaaaaaaaaaaaa offset" + offset.toString());
      LogUtil.e("aaaaaaaaaaaaa maxScrollExtent2" + maxScrollExtent2.toString());
      LogUtil.e("aaaaaaaaaaaaa minScrollExtent" + minScrollExtent.toString());
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
        body: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                // 页面不可见的部分就跳转不了
                /* RenderBox box = keys[1].currentContext.findRenderObject();
                Offset offset = box.localToGlobal(Offset.zero);

                LogUtil.e(" offset sss  ${offset.dy}");
                LogUtil.e(" offset distance  ${offset.distance}");
                LogUtil.e(" offset distanceSquared  ${offset.distanceSquared}");*/
                controller.jumpTo(controller.position.maxScrollExtent);
              },
              child: Text("data"),
            ),
            Expanded(
              child: buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListView() {
    /* var listView = Container(
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
                  key:keys[index],
                  title: new Text(list[index]),
                ));
          },
          childCount: list.length,
        ),
      ),
    );*/
    int a = -1;
    var listView = Container(
      child: ListView(
        controller: controller,
        children: list.map<Widget>((data) {
          a++;
          LogUtil.e("aaaaaaaaaaaaaaa $a");
          return Padding(
            padding: EdgeInsets.all(8),
            child: new ListTile(
              key: keys[a],
              title: new Text(list[a]),
            ),
          );
        }).toList(),
      ),
    );
    return listView;
  }
}
