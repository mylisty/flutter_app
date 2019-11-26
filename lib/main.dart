import 'dart:ui' as prefix0;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:transparent_image/transparent_image.dart';

import 'dialog.dart';
void main() {
  runApp(
      /*  new MyApp26(
        item: new List<String>.generate(300, (i)=> "item$i"),
      )*/
      new MaterialApp(
        title: 'a',
        home:   new MyApp30(),
      )
   /*   new MyApp30()*/
  );
}

class MyApp30 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LinearGradientState();
  }
}

class LinearGradientState extends State<MyApp30> {
  Future<Null> _onRefresh() async{
    await Future.delayed(Duration(seconds: 3),(){
      setState(() {});
    });
  }
  //这是个key吧，机制问题
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: new LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.cyan, Colors.white, Colors.blue]
                )
            ),
          ),
          RefreshIndicator(
            child: Column(
                children: <Widget>[
                  Text("a"),
                  RaisedButton(onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                    child: Text("button"),
                  )
                ],
            ),
            onRefresh: _onRefresh ,
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
      ) ,
    );
  }
}


class MyApp29 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TextFieldState();
  }
}

class TextFieldState extends State<MyApp29> {
  var  controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      appBar: new AppBar(
        title: new Text("textField button"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new Container(
              width: 200,
              child: TextField(
                controller: controller,
                //    maxLength: 30,//最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                maxLines: 1,//最大行数
                autocorrect: true,//是否自动更正
                autofocus: false,//是否自动对焦
                obscureText: false,//是否是密码
                textAlign: TextAlign.start,//文本对齐方式
                style: TextStyle(fontSize: 17, color: Colors.black87),//输入文本的样式
                //| inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
                inputFormatters: [
                  BlacklistingTextInputFormatter(RegExp("[a-z]")),
                  LengthLimitingTextInputFormatter(5)
                ],
                onChanged: (text) {//内容改变的回调
                  print('change $text');
                },
                cursorWidth: 2.0,
                cursorColor: Colors.black87,//光标颜色,
                dragStartBehavior: DragStartBehavior.down,
                // this.dragStartBehavior = DragStartBehavior.down,
                scrollPadding: EdgeInsets.all(20),
                decoration: new InputDecoration(
                  hintText: "phone",
                  hintStyle: new TextStyle(fontSize: 16),
                  //prefixIcon: Image.asset("assets/images/qr_zhilun.jpg",width: 5,height: 5,),
                  border: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87 ),
                      borderRadius: BorderRadius.circular(7.0)
                  ),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
                ),
              ),
            ),
            OutlineButton(
              textTheme:  ButtonTextTheme.normal,
              onPressed: () {

            },
           /*   focusColor: Colors.lime,
              hoverColor: Colors.red  ,*/
           //   color: Colors.greenAccent,
           //   borderSide: BorderSide(color: Colors.lightBlue,style: BorderStyle.solid),
              child: Text("outline",style: new TextStyle(fontSize: 10),),
              disabledBorderColor: Colors.amberAccent,
              highlightedBorderColor: Colors.red,
              color: Colors.green,
              hoverColor: Colors.black87,
             // splashColor: Colors.green,//点击后的颜色
             /* shape: ShapeBorder.lerp(),*/
             // highlightColor: Colors.amberAccent,
              shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
            ),
            FlatButton(onPressed: () {},
                child: new Text("FlatButton"),
                color: Colors.green,
                clipBehavior: Clip.antiAlias,
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0) ,
                ),
               // highlightColor: Colors.red,
              hoverColor: Colors.amberAccent,
            ),
            RaisedButton(onPressed: () {

            },
              child: Text("RaiseButton"),
              color: Colors.green,
                shape: new StadiumBorder(side: new BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.greenAccent,
                ),),
//              highlightColor: Colors.amber,
              splashColor: Colors.amber,
          //    colorBrightness:Brightness.light ,
            )
          ],
        )
      ),
    );;
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
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("dialog"),
        ),
        body: Center(
          child: new RaisedButton(
            onPressed: () {
              show(context);
            },
            child: Text("button"),
          ),
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
class ViewPageState  extends State<MyApp27> {

  _onPageChnge(index) {
    print("aaaaaaaaaaaaaaa "+ index.toString());
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
                   child: FadeInImage.memoryNetwork(
                       placeholder: kTransparentImage,
                       image: 'https://p0.ssl.qhimg.com/t0183421f63f84fccaf.gif',),
                       width: 100,
                       height: 100,
                 ),
                 Image.network('https://ws1.sinaimg.cn/large/0065oQSqly1fw8wzdua6rj30sg0yc7gp.jpg'),
                 Image.network('https://ws1.sinaimg.cn/large/0065oQSqly1fw0vdlg6xcj30j60mzdk7.jpg'),
                Image.network('https://ws1.sinaimg.cn/large/0065oQSqly1fuo54a6p0uj30sg0zdqnf.jpg'),
                new Container(
                  child: FadeInImage.assetNetwork(placeholder: "assets/images/card_package_icon.png", image: 'https://ws1.sinaime/0065oQSqly1fw8wzdua6rj30sg0yc7gp.jpg'),
                )
              ],
              onPageChanged:  _onPageChnge,
              scrollDirection: Axis.horizontal,
              reverse: false,
            )
        )
    );
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
            body:  new Center(
              child: new Column(
                children: <Widget>[
                  new ClipOval(
                    child: new SizedBox(
                      width: 50,
                      height: 50,
                      child:  new Image.asset('assets/images/qr_zhilun.jpg',fit: BoxFit.fill,),
                    ),
                  ),
                  new CircleAvatar(
                    radius:40 ,
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
                    borderRadius: new BorderRadius.all(new Radius.circular(100)),
                    child: new Image.asset("assets/images/qr_zhilun.jpg",width: 72,height: 72,),
                  ),
                ],
              ),
            )
        )
    );
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
  final  list = new List.generate(30, (i) => new SecondScreen(title:'商品id$i',dec: '商品详情$i'));
  var result='Navigator';
  String platformVersion = 'Unknown';
  var demoPlugin = const MethodChannel('demo.plugin');
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('$result'),
      ),
      body: new ListView.builder(itemBuilder: (context,index) {
        return new ListTile(
          title:  new Text(list[index].title),
          onTap: ()  async {
            // Platform messages may fail, so we use a try/catch PlatformException.
            /* await FlutterPlugin.getName;*/
           // demoPlugin.invokeMethod('interaction');
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
                      onFieldSubmitted: (value) {

                      },
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: '请输入密码'),
                      obscureText: true,
                      validator: (value) {
                        return isLoginPassword(value)? "6~16位数字和字符组合": null;
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
