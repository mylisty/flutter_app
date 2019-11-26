// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/main.dart';

bool isLoginPassword(String input) {
  RegExp mobile = new RegExp(r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$");
  return mobile.hasMatch(input);
}

 Future<String> say(String from, String msg, [String device])  async{
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }

  return await Future.value(result + "a");
}

String say2(String from, String msg, [String device]) =>   '$from says $msg';
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
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
  });

}
