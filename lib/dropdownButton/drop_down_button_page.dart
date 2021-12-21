import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// @ProjectName: flutter_app
/// @Description:
/// @Author: maoShengTao
/// @CreateDate: 2021/5/31 3:39 下午
/// @UpdateUser: 更新者
/// @UpdateDate: 2021/5/31 3:39 下午
///  @UpdateRemark: 更新说明

class DropDownButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DropDownButtonPageState();
  }
}

class _DropDownButtonPageState extends State<DropDownButtonPage> {
  var selectItemValue = '北京';

  List<DropdownMenuItem> generateItemList() {
    final List<DropdownMenuItem> items = [];
    final DropdownMenuItem item1 = DropdownMenuItem(
      child: Container(child: Text('北京')),
      value: '北京',
    );
    final DropdownMenuItem item2 = DropdownMenuItem(
      child: Container(child: Text('上海')),
      value: '上海',
    );
    final DropdownMenuItem item3 = DropdownMenuItem(
      child: Container(child: Text('北京')),
      value: '广州',
    );
    final DropdownMenuItem item4 = DropdownMenuItem(
      child: Container(child: Text('北京')),
      value: '深圳',
    );
    items.add(item1);
    items.add(item2);
    items.add(item3);
    items.add(item4);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: DropdownButton(
            alignment: AlignmentDirectional.bottomCenter,
            // 提示文本
            hint: Text('请选择一个城市'),
            // 下拉列表的数据
            items: generateItemList(),
            // 改变事件
            onChanged: (value) {
              setState(() {
                selectItemValue = value;
              });
            },
            // 是否撑满
            isExpanded: false,
            value: selectItemValue,
            // 图标大小
            iconSize: 48,
            // 下拉文本样式
            style: TextStyle(color: Colors.green),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 200),
          child: DropdownButton(
            alignment: AlignmentDirectional.bottomStart,
            // 提示文本
            hint: Text('请选择一个城市'),
            // 下拉列表的数据
            items: generateItemList(),
            // 改变事件
            onChanged: (value) {
              setState(() {
                selectItemValue = value;
              });
            },
            // 是否撑满
            isExpanded: true,
            value: selectItemValue,
            // 图标大小
            iconSize: 48,
            // 下拉文本样式
            style: TextStyle(color: Colors.green),
          ),
        ));
  }
}
