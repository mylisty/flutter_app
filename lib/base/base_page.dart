import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/24 9:41 上午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/24 9:41 上午
///  @UpdateRemark: 更新说明

abstract class BasePage extends StatelessWidget {
  String title;

  BasePage(this.title);

  Widget buildWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: buildWidget(context),
    );
  }
}
