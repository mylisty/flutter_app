
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providersort/provider/provier_page2.dart';
import 'package:provider/provider.dart';

import 'model/item.dart';
import 'model/model.dart';
import 'model/secondModel.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/17 4:26 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/17 4:26 下午
///  @UpdateRemark: 更新说明

class ProviderTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ProviderState();
  }
}

// ignore: camel_case_types
class _ProviderState extends State<ProviderTestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var modelTest = context.watch<ModelTest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('provider'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("data"),
              ),
              TextButton(
                onPressed: () {
                  _testAdd(10, 1);
                },
                child: Text("add"),
              ),
              TextButton(
                onPressed: () {
                  _testAdd(20, 1);
                },
                child: Text("add2"),
              ),
              TextButton(
                onPressed: () {
                },
                child: Text("test ${modelTest.totalPrice}"),
              ),
              Container(
                child: Consumer<SecondModel>(
                  builder: (context, model, child) {
                    return Text("total Price${model.value}");
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (context) {
                      return new ProviderTestPage2();
                    }));
                    // Navigator.pushNamed(context, '/pages');
                  },
                  child: Text("next")),
            ],
          ),
        )
        ,
      ),
    );
  }

  _testAdd(double price, int count) {
    var counter = context.read<ModelTest>();
    counter.add(Item(price, count));
  }
}
