// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/main.dart';

import 'upcoming_person_bean.dart';

bool isLoginPassword(String input) {
  RegExp mobile = new RegExp(r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$");
  return mobile.hasMatch(input);
}

Future<String> say(String from, String msg, [String device]) async {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }

  return await Future.value(result + "a");
}

String say2(String from, String msg, [String device]) => '$from says $msg';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // double a =33.modPow(exponent, modulus);
    // print("logintPasswordaaa  ${a.toStringAsFixed(2)}");
    /* // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    var fss;
    assert(fss == null);
    var number = "lsjdf";
    int a = 1;
    bool b = true ;
   */
    /* Logger.log('Button clicked2');
    Logger lg = new Logger('a');*/
    /*var loginPassword = isLoginPassword("12345698MSt");
    print("logintPassword "+ loginPassword.toString());*/

    var teas = ['green', 'black', 'chamomile', 'earl grey'];
    /*    teas.forEach((item) {
       print(item);
     });
     teas.forEach(print);
     var a = teas.iterator;
     while (a.moveNext()){
        print(a.current);
     }
     for(var a = 0 ; a < teas.length; a++) {
       print(a.toString() + teas[a].toUpperCase());
     }*/
    /*  var loudTeas = teas.map((tea) => tea.toUpperCase());
    loudTeas.forEach(print);
    var loudTeaList = teas
        .map((tea) => tea.toUpperCase()).toList();*/
    // print(loudTeaList.toString());
    // print(say("a", "b"));

    const String name = "AA";
    // 如果需要在编译时就固定变量的值，可以使用 const 类型变量
    // 如果 Const 变量是类级别的，需要标记为 static const
    // 使用with关键字折叠其他类以实现代码重用。当属性和方法重复时，以当前类为准。
    // 如果想使用和Java接口一样的功能可以使用Mixins和implements两种方式
//    name = 'A';
    var foo = const [];
    final bar = const [];
    const baz = [];
    /*  foo = ["aaaaa"];
    bar = ["aaaa"];
    baz = ["aaaa"];*/
    /*  var b = new B();
     b.a();*/
    Children children = Children();
    children.children = [];
    children.accountList = [];

    var accountList = AccountList();
    accountList.select = false;
    accountList.name = "mao";
    children.accountList.add(accountList);


    Children children2 = Children();
    var accountList2 = AccountList();
    accountList2.select = false;
    accountList2.name = "mao1";
    children2.accountList = [];
    children2.accountList.add(accountList2);
    children.children.add(children2);

    Map<int, Children> map = Map();
    map[0] = children;
    map[1] = children2;

    List<AccountList> tst = [];
    /*map[0].children[0].accountList.forEach((element) {
      tst.add(element);
    });*/
    tst.add(children2.accountList[0]);

    print(
        "aas1  ${map[0].children[0].accountList[0].name} ${map[0].children[0].accountList[0].select}");
    print(
        "113a  ${map[1].accountList[0].name} ${map[1].accountList[0].select}");
    tst[0].select = true;

    print(
        "aas2  ${map[0].children[0].accountList[0].name} ${map[0].children[0].accountList[0].select}");
    print("11b  ${map[1].accountList[0].name} ${map[1].accountList[0].select}");
    print("11bsss   ${tst[0].name} ${tst[0].select}");
  });
}

mixin A {
  void a() {
    print('fun a => by a');
  }
}

class B with A {
  @override
  void a() {
    // TODO: implement a
    super.a();
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
