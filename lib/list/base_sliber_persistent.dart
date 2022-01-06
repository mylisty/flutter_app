import 'package:flutter/material.dart';

/// @ProjectName: geely_tool
/// @Description:  用于固定头部使用
/// @Author: maoShengTao
/// @CreateDate: 2021/11/23 10:54 上午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/11/23 10:54 上午
///  @UpdateRemark: 更新说明

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double _minExtent;
  final double _maxExtent;
  final Widget widget;

  MySliverPersistentHeaderDelegate(
      this.widget, this._minExtent, this._maxExtent);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //创建child子组件
    //shrinkOffset：child偏移值minExtent~maxExtent
    //overlapsContent：SliverPersistentHeader覆盖其他子组件返回true，否则返回false
    // print('shrinkOffset = $shrinkOffset overlapsContent = $overlapsContent');
    return Container(
      alignment: Alignment.centerLeft,
      child: widget,
    );
  }

  //SliverPersistentHeader最大高度
  @override
  double get maxExtent => _maxExtent;

  //SliverPersistentHeader最小高度
  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
