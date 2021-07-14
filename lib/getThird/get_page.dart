import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/18 4:56 下午a
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/18 4:56 下午
///  @UpdateRemark: 更新说明

///   https://github.com/jonataslaw/getx/blob/master/README.zh-cn.md
class GetDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("getX${controller.count}")),
      ),
      body: Center(
        child: TextButton(
          child: Text("next"),
          onPressed: () {
            // Get.toNamed(
            //   "/Other",
            // );
            // Get.customTransition
            Get.toNamed("/Other");
            // Get.to(Other(),transition: Transition.rightToLeft);
            /*Navigator.push(
                context,
                PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) {
                      return Other();
                    },
                    transitionsBuilder:
                        (___, Animation<double> animation1, ____,
                        Widget child) {
                      return *//* FadeTransition(
                        opacity: animation,
                        child: RotationTransition(
                          turns: Tween<double>(begin: 0.5, end: 1.0)
                              .animate(animation),
                          child: child,
                        ),
                      )*//*
                        SlideTransition(
                          //定义滑动的位置
                          position: Tween<Offset>(
                              begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                              .animate(CurvedAnimation(
                              parent: animation1,
                              curve: Curves.fastOutSlowIn
                          )),
                          child: child,
                        );
                    }));*/
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.increment();
        },
      ),
    );
  }
}

class Other extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find();
    var previousRoute = Get.currentRoute;
    print("previousRoute $previousRoute");
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Text("data ${controller.count}"),
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  var count = 0.obs;

  increment() => count++;
}
