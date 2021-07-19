import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providersort/provider/provier_demo.dart';
import 'package:provider/provider.dart';

import 'model/ThirdModel.dart';
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
    var modelTest2 = context.watch<ThirdModel>();
    LogUtil.e("aaaaatest  ${modelTest2.a}");
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
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (context) {
                    return new ProviderTestPage();
                  }));
                },
                child: Text("add2")),
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
