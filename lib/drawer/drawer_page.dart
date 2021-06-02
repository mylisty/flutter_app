import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/27 9:48 上午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/27 9:48 上午
///  @UpdateRemark: 更新说明

class DrawerPage extends StatelessWidget {
  final List<Tab> _mTabs = <Tab>[
    Tab(
      text: 'Tab1',
      icon: Icon(Icons.airline_seat_flat_angled),
    ),
    Tab(
      text: 'Tab2',
      icon: Icon(Icons.airline_seat_flat_angled),
    ),
    Tab(
      text: 'Tab3',
      icon: Icon(Icons.airline_seat_flat_angled),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: _mTabs.length,
          child: new Scaffold(
            appBar: new AppBar(
              //自定义Drawer的按钮
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                    icon: Icon(Icons.wifi_tethering),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    });
              }),
              title: new Text('Drawer Demo'),
              backgroundColor: Colors.cyan,
              bottom: new TabBar(tabs: _mTabs),
            ),
            body: new TabBarView(
                children: _mTabs.map((Tab tab) {
              return new Center(
                child: new Text(tab.text),
              );
            }).toList()),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 150,
                    child: UserAccountsDrawerHeader(
                      //设置用户名
                      accountName: new Text('Drawer Demo 抽屉组件'),
                      //设置用户邮箱
                      accountEmail: new Text('www.baidu.com'),
                      //设置当前用户的头像
                      currentAccountPicture: new CircleAvatar(
                      ),
                      //回调事件
                      onDetailsPressed: () {},
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.wifi),
                    title: new Text('无线网络1'),
                    subtitle: new Text('我是副标题'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wifi),
                    title: new Text('无线网络2'),
                    subtitle: new Text('我是副标题'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wifi),
                    title: new Text('无线网络3'),
                    subtitle: new Text('我是副标题'),
                    onTap: () {
                      print('ssss');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.wifi),
                    title: new Text('无线网络4'),
                    subtitle: new Text('我是副标题'),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
