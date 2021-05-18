import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'item.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/18 9:51 上午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/18 9:51 上午
///  @UpdateRemark: 更新说明

class ModelTest extends ChangeNotifier {
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 计算总价
  double get totalPrice => _items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.count * element.price);

  void add(Item item) {
    _items.add(item);
    // 通知数据发生变化了
    notifyListeners();
  }

  void delete(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
