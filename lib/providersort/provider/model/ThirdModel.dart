import 'package:flutter/material.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/18 4:24 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/18 4:24 下午
///  @UpdateRemark: 更新说明

class ThirdModel extends ChangeNotifier {
  String name;
  int a;

  /// The current catalog. Used to construct items from numeric ids.
  int get value => a;

  set setValue(int b) {
    a = b;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }
}
