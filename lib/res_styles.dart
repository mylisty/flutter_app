import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res_colours.dart';
import 'res_dimens.dart';

class CommonStyles {
  static TextStyle listTitle = TextStyle(
    fontSize: CommonDimens.dp16,
    color: CommonColors.text_33,
    fontWeight: FontWeight.bold,
  );
  static TextStyle listTitle2 = TextStyle(
    fontSize: CommonDimens.dp16,
    color: CommonColors.text_33,
  );
  static TextStyle style16_99 = TextStyle(
    fontSize: CommonDimens.dp16,
    color: CommonColors.text_99,
  );
  static TextStyle style24_33 = TextStyle(
    fontSize: CommonDimens.dp24,
    color: CommonColors.text_33,
  );
  static TextStyle listTitle3 = TextStyle(
    fontSize: CommonDimens.dp14,
    color: CommonColors.text_33,
  );
  static TextStyle style14_write = TextStyle(
    fontSize: CommonDimens.dp14,
    color: CommonColors.color_white,
  );
  static TextStyle style13_D93C3C = TextStyle(
    fontSize: CommonDimens.dp13,
    color: CommonColors.text_D93C3C,
  );
  static TextStyle style13_66 = TextStyle(
    fontSize: CommonDimens.dp13,
    color: CommonColors.color_66,
  );
  static TextStyle style13_1376ee = TextStyle(
    fontSize: CommonDimens.dp13,
    color: CommonColors.color_1376ee,
  );

  static TextStyle style13_99 = TextStyle(
    fontSize: CommonDimens.dp13,
    color: CommonColors.color_99,
  );
  static TextStyle style14_99 = TextStyle(
    fontSize: CommonDimens.dp14,
    color: CommonColors.color_99,
  );
  static TextStyle style14_EF350D = TextStyle(
    fontSize: CommonDimens.dp14,
    color: CommonColors.color_EF350D,
  );
  static TextStyle style28_04339C = TextStyle(
    fontSize: CommonDimens.dp28,
    color: CommonColors.color_04339C,
  );

  static TextStyle style14_33 = TextStyle(
    fontSize: CommonDimens.dp13,
    color: CommonColors.color_33,
  );
  static TextStyle style16_33 = TextStyle(
    fontSize: CommonDimens.dp16,
    color: CommonColors.color_33,
  );
  static TextStyle style13_33 = TextStyle(
    fontSize: CommonDimens.dp14,
    color: CommonColors.color_33,
  );

  static TextStyle style14_66 = TextStyle(
    fontSize: CommonDimens.dp14,
    color: CommonColors.color_66,
  );
  static TextStyle style28_04339 = TextStyle(
    fontSize: CommonDimens.dp28,
    color: CommonColors.color_04339C,
  );
  static TextStyle listContent = TextStyle(
    fontSize: CommonDimens.dp14,
    color: CommonColors.text_66,
  );
  static TextStyle style14_1D56C3 = TextStyle(
    fontSize: CommonDimens.dp14,
    color: CommonColors.color_1D56C3,
  );

  static TextStyle listContent2 = TextStyle(
    fontSize: CommonDimens.dp14,
    color: CommonColors.text_99,
  );
  static TextStyle listContent3 = TextStyle(
    fontSize: CommonDimens.dp12,
    color: CommonColors.text_99,
  );
  static TextStyle listContent4 = TextStyle(
    fontSize: CommonDimens.dp13,
    color: CommonColors.text_99,
  );
  static TextStyle listExtra = TextStyle(
    fontSize: CommonDimens.dp12,
    color: CommonColors.text_99,
  );
  static TextStyle listExtra2 = TextStyle(
    fontSize: CommonDimens.dp12,
    color: CommonColors.text_66,
  );
  static TextStyle listExtra3 = TextStyle(
    fontSize: CommonDimens.dp13,
    color: CommonColors.text_66,
  );
  static TextStyle appTitle = TextStyle(
    fontSize: CommonDimens.dp17,
    color: CommonColors.text_33,
  );
  static TextStyle pageTitle = TextStyle(
    fontSize: CommonDimens.dp20,
    color: CommonColors.text_33,
    fontWeight: FontWeight.bold
  );
  static TextStyle style16_33_bold = TextStyle(
      fontSize: CommonDimens.dp16,
      color: CommonColors.text_33,
      fontWeight: FontWeight.bold
  );

  static get style17_33 => TextStyle(
        fontSize: CommonDimens.dp17,
        color: CommonColors.text_33,
      );
  static get style17_Write => TextStyle(
    fontSize: CommonDimens.dp17,
    color: CommonColors.color_white,
  );
  static get style36_Write => TextStyle(
    fontSize: CommonDimens.dp36,
    color: CommonColors.color_white,
  );
}

class Decorations {
  static Decoration bottom = BoxDecoration(
      border:
          Border(bottom: BorderSide(width: 0.33, color: CommonColors.text_99)));
}

/// 间隔
class Gaps {
  /// 水平间隔
  static Widget hGap5 = new SizedBox(width: CommonDimens.dp5);
  static Widget hGap10 = new SizedBox(width: CommonDimens.dp10);
  static Widget hGap15 = new SizedBox(width: CommonDimens.dp15);
  static Widget hGap30 = new SizedBox(width: CommonDimens.dp30);

  /// 垂直间隔
  static Widget vGap5 = new SizedBox(height: CommonDimens.dp5);
  static Widget vGap10 = new SizedBox(height: CommonDimens.dp10);
  static Widget vGap15 = new SizedBox(height: CommonDimens.dp15);
  static Widget vGap8 = new SizedBox(height: CommonDimens.dp8);

  /// 带颜色分割线
  static Widget vColorGap1 = SizedBox(
    height: 1.0,
    child: Container(
      color: CommonColors.background_color,
    ),
  );

  static Widget getHGap(double w) {
    return SizedBox(width: w);
  }

  static Widget getVGap(double h) {
    return SizedBox(height: h);
  }
}
