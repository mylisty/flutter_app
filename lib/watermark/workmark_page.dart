import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/7/5 1:22 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/7/5 1:22 下午
///  @UpdateRemark: 更新说明

class WatermarkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WatermarkPage();
  }
}

class _WatermarkPage extends State<WatermarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: _WatermarkView(Center(
        child: Text(
          "center",
          style: TextStyle(fontSize: 14, color: Colors.amberAccent),
        ),
      )),
    );
  }
}

class _WatermarkView extends StatelessWidget {
  Widget widget;

  _WatermarkView(this.widget);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //宽度
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            //高度
            return InkWell(
              onTap: () {
                print("aaaa");
              },
              child: Container(
                alignment: Alignment.topCenter,
                width: width / 3,
                height: height / 6,
                child: new Transform(
                  alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                  transform: new Matrix4.skewY(-0.45), //沿Y轴倾斜0.3弧度
                  child: Text('睡懒觉 8888'),
                ),
              ),
            );
          },
          itemCount: 18,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 3,
              // //纵轴间距
              // mainAxisSpacing: 10.0,
              // //横轴间距
              // crossAxisSpacing: 10.0,
              //子组件宽高长度比例
              childAspectRatio: 1.0),
        ),
        widget,
      ],
    );
  }
}
