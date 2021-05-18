import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/item.dart';
import 'model/model.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/17 4:26 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/17 4:26 下午
///  @UpdateRemark: 更新说明

class ProviderTestPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ProviderState2();
  }
}

// ignore: camel_case_types
class _ProviderState2 extends State<ProviderTestPage2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var modelTest = context.watch<ModelTest>();
    return new Scaffold(
        appBar: AppBar(
          title: Text('provider2'),
        ),
        body: Column(
          children: [
            Container(
              child: Consumer<ModelTest>(
                builder: (context, model, child) {
                  return Text("total Price${model.totalPrice}");
                },
                child: ThirdPage(), // 什么作用没发现
              ),
            ),
            TextButton(
                onPressed: () {
                  modelTest.add(Item(11, 4));
                },
                child: Text("add")),
            Text("total2  Price${modelTest.totalPrice}")
          ],
        ));
  }
}

class ThirdPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThirdPageState();
  }
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}
