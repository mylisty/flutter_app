/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2022/1/19 2:04 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2022/1/19 2:04 下午
///  @UpdateRemark: 更新说明

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'dart:ui' as ui;

/// Used with [TabBar.indicator] to draw a horizontal line below the

/// selected tab.

///

/// The selected tab underline is inset from the tab's boundary by [insets].

/// The [borderSide] defines the line's color and weight.

///

/// The [TabBar.indicatorSize] property can be used to define the indicator's

/// bounds in terms of its (centered) widget with [TabIndicatorSize.label],

/// or the entire tab with [TabIndicatorSize.tab].

class SugarTabIndicator extends Decoration {
  /// Create an underline style selected tab indicator.

  ///

  /// The [borderSide] and [insets] arguments must not be null.

  const SugarTabIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
    this.gradientColor,
    this.width,
  })  : assert(borderSide != null),
        assert(insets != null);

  final List<Color> gradientColor;

  /// The color and weight of the horizontal line drawn below the selected tab.

  final BorderSide borderSide;

  /// Locates the selected tab's underline relative to the tab's boundary.

  ///

  /// The [TabBar.indicatorSize] property can be used to define the

  /// tab indicator's bounds in terms of its (centered) tab widget with

  /// [TabIndicatorSize.label], or the entire tab with [TabIndicatorSize.tab].

  final EdgeInsetsGeometry insets;

  /// 固定宽度
  final double width;

  @override
  DecorationlerpFrom(Decoration a, double t) {
    if (a is SugarTabIndicator) {
      return SugarTabIndicator(
          borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
          insets: EdgeInsetsGeometry.lerp(a.insets, insets, t),
          width: width);
    }

    return super.lerpFrom(a, t);
  }

  @override
  DecorationlerpTo(Decoration b, double t) {
    if (b is SugarTabIndicator) {
      return SugarTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t),
      );
    }

    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return _UnderlinePainter(this, onChanged, gradientColor, width);
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(
      this.decoration, VoidCallback onChanged, this.gradientColor, this.width)
      : assert(decoration != null),
        super(onChanged);

  final SugarTabIndicator decoration;

  BorderSide get borderSide => decoration.borderSide;

  EdgeInsetsGeometry get insets => decoration.insets;

  List<Color> gradientColor;
  double width;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);

    assert(configuration.size != null);

    final Rect rect = offset & configuration.size;

    final Paint paint = borderSide.toPaint()..strokeCap  = StrokeCap.square;

    Rect myRect;
    if (width != null) {
      myRect = Rect.fromLTWH(
          rect.left + rect.width / 2 - width / 2, rect.bottom - 7, width, 2);
    } else {
      myRect = Rect.fromLTWH(
          rect.left + rect.width / 3, rect.bottom - 7, rect.width / 3, 2);
    }

    paint.shader = ui.Gradient.linear(
        Offset(myRect.left, 0), Offset(myRect.right, 0), gradientColor);

    paint.strokeWidth = 3;

    canvas.drawRRect(
        RRect.fromRectAndRadius(myRect, Radius.circular(3)), paint);
  }
}
