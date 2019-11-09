import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
      /*  new MyApp15(
        item: new List<String>.generate(300, (i)=> "item$i"),
      )*/
      new MaterialApp(
        title: 'a',
        home:   new FirstScreen(),
      )
     /* new MyApp25()*/
  );
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
  final  list = new List.generate(30, (i) => new SecondScreen(title:'商品id$i',dec: '商品详情$i'));
  var result='Navigator';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('$result'),
      ),
      body: new ListView.builder(itemBuilder: (context,index) {
        return new ListTile(
          title:  new Text(list[index].title),
          onTap: ()  {
        /*  result =   await Navigator.push(context, new MaterialPageRoute(builder: (context) =>
            new SecondScreen(list[index].title, list[index].dec)));
           print('reslut $result');*/
            Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){
              return  new SecondScreen(title: list[index].title,dec: list[index].dec,);
            })).then( (Object result){
              //处理代码
              this.result  = result;
              print('aaa '+ this.result);
            });
          },
        );
      }),
    );
  }

}


class SecondScreen extends StatelessWidget {
  String title;
  String dec;
  SecondScreen({Key key, @required this.title,@required this.dec}) : super(key: key);
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
              Navigator.pop(context,dec);
            }),
      ),
    );
  }

}
class MyApp23 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = new List<String>.generate(40, (i) => "item $i");
    return new MaterialApp(
        title: "Transform",
        home: new Scaffold(
            appBar: AppBar(
              title: Text('Transform'),
            ),
            body: new ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
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
              },
            )));
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
      onTap: () {
        print('按下');
      },
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
              child: new AspectRatio(
                aspectRatio: 1.5, //宽高比例
                child: new Container(
                  color: Colors.greenAccent,
                  child: new GridView.extent(
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
                  ),
                ),
              ),
            )));
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
                        return value.length < 6 ? "密码不够六位" : null;
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
