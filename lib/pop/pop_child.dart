import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2022/1/14 2:58 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2022/1/14 2:58 下午
///  @UpdateRemark: 更新说明

class PopChildView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PopChildViewSate();
  }
}

class _PopChildViewSate extends State<PopChildView> {
  var _bodyText = "ssss";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: GestureDetector(
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
            children: [
              Container(
                color: Colors.white,
                child: Text("$_bodyText"),
                height: 200,
              ),
              Container(
                child: Text("1111"),
                height: 200,
                color: Colors.white,
              ),
            ],
          ),
        ),
        onTap: () {
          _bodyText = "afassfafad";
          setState(() {});
          // Navigator.of(context).pop();
        },
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            bottomRight: const Radius.circular(10),
            bottomLeft: const Radius.circular(10)), //弧度
      ),
    );
  }
}
