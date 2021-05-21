import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/19 9:39 上午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/19 9:39 上午
///  @UpdateRemark: 更新说明

class GetXUtil {
  Future<T> getTo<T>(
    dynamic page, {
    bool opaque,
    Transition transition,
    Curve curve,
    Duration duration,
    int id,
    bool fullscreenDialog = false,
    dynamic arguments,
    Bindings binding,
    bool preventDuplicates = true,
    bool popGesture,
  }) {
    Get.to(page);
    return null;
  }
}
