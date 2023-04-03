import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/base/base_page.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/31 3:39 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/31 3:39 下午
///  @UpdateRemark: 更新说明

class ProgressPage extends BasePage {
  ProgressPage(String title, String subTitle) : super(title, subTitle);

  @override
  Widget build(BuildContext context) => ProgressPageBody();
}
class ProgressPageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgressStaepage();
  }
}

class _ProgressStaepage extends State<ProgressPageBody> {
  int process = 20;
  int max = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  process += 5;
                  setState(() {});
                },
                child: Text("change")),
            LinearProgressIndicator(
              value: process / 100.0,
              // 当前进度
              backgroundColor: Colors.yellow,
              // 进度条背景色
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              // 进度条当前进度颜色
              minHeight: 10, // 最小宽度
            ),
            // Color? focusColor,
            // Color? hoverColor,
            // Color? highlightColor,
            Material(
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () {},
                child: Container(
                  height: 68.0,
                  width: 200.0,
                  // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
                  child: LinearProgressIndicator(
                    value: process / 100.0,
                    backgroundColor: Color(0xffFFE3E3),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xffFF4964)),
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 36,
                  width: 215,
                  child: ClipRRect(
                    // 边界半径（`borderRadius`）属性，圆角的边界半径。
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    child: LinearProgressIndicator(
                      minHeight: 34,
                      value: process / 100.0,
                      backgroundColor: Color(0xff72C6BB),
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff20DAC2)),
                    ),
                  ),
                ),
                Container(
                  height: 36,
                  width: 215,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                      ),
                    ),
                    child: Text(
                      "下载",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                )
              ],
            ),
            MyButton(),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The InkWell Wraps our custom flat button Widget
    return new InkWell(
      // When the user taps the button, show a snackbar
      child: new Container(
        width: 215,
        height: 36,
        child: LinearProgressIndicator(
          minHeight: 36,
          value: 44 / 100.0,
          backgroundColor: Color(0xffFFE3E3),
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFF4964)),
        ),
      ),
    );
  }
}
