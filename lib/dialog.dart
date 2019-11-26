
import 'package:flutter/material.dart';
Future<void> showListDialog(context) async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(title: Text("请选择")),
          Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: (){
                      print("index");
                    },
                  );
                },
              )),
        ],
      );
      //使用AlertDialog会报错
      //return AlertDialog(content: child);
      return Dialog(child: child);
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}


Future<void> show(context) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("AlerDialog"),
       content: SingleChildScrollView(
         child: ListBody(
           children: <Widget>[
             Text('You will never be satisfied.'),
             Text('You\’re like me. I’m never satisfied.'),
           ],
         ),
       ),
        actions: <Widget>[
          FlatButton(
            child: Text('Regret'),
            onPressed: () {
             Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
