import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providersort/provider/provier_demo.dart';
import 'package:flutter_app/providersort/provider/provier_page2.dart';
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

class ProviderTestPage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ProviderState3();
  }
}

// ignore: camel_case_types
class _ProviderState3 extends State<ProviderTestPage3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var modelTest = context.watch<ModelTest>();
    return ChangeNotifierProvider(
      create: (context) => ThirdModel()..a = 45,
      child: Consumer<ThirdModel>(
        builder: (context, model, child) {
          return Scaffold(
              body: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new ProviderTestPage2();
                }));
              },
              child: Text("aaaaa ${model.a}"),
            ),
          ));
        },
      ),
    );
  }
}
