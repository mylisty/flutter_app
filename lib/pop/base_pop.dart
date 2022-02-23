import 'package:flutter/material.dart';
import 'package:popup_window/popup_window.dart';

/// @ProjectName: geely_tool
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/12/23 3:07 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/12/23 3:07 下午
///  @UpdateRemark: 更新说明

void showBaseWindow<T>(BuildContext context, GlobalKey stackKey,
    {Widget child,
    bool showBg = true,
    VoidCallback onWindowShow,
    VoidCallback onWindowDismiss}) {
  RelativeRect position = getPosition(stackKey);
  showWindow(
      position: position,
      context: context,
      duration: 300,
      onWindowShow: onWindowShow,
      onWindowDismiss: onWindowDismiss,
      windowBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Stack(
          children: [
            Visibility(
              visible: showBg,
              child: GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: Material(color: Colors.transparent, child: child),
                ),
              ),
            ),
          ],
        );
      });
}

RelativeRect getPosition(GlobalKey<State<StatefulWidget>> stackKey) {
  final RenderBox button = stackKey.currentContext.findRenderObject();
  final RenderBox overlay =
      Overlay.of(stackKey.currentContext).context.findRenderObject();
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(Offset(0, 0), ancestor: overlay),
      button.localToGlobal(button.size.bottomRight(Offset.zero),
          ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );
  return position;
}
