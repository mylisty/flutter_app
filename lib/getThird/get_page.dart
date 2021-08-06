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
/*
// 删除一个路由。
            Get.removeRoute()

//反复返回，直到表达式返回真。
            Get.until()

// 转到下一条路由，并删除所有之前的路由，直到表达式返回true。
            Get.offUntil()

// 转到下一个命名的路由，并删除所有之前的路由，直到表达式返回true。
            Get.offNamedUntil()*/

            // setState(() {});
            // 关闭页面
            Get.back(result: {"aaa":"back22"}); // Navigator.pop(context)
            // 进入下一个页面，但没有返回上一个页面的选项（用于闪屏页，登录页面等）
            // Get.off(page);
            // 进入下一个页面并取消之前的所有路由（在购物车、投票和测试中很有用）。
            // Get.offAll(NextScreen());
            // Get.toNamed(
            //   "/Other",
            // );
            // Get.customTransition
            // Get.toNamed("/Other");
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
