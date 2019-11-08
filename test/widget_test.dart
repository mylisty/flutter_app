// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/main.dart';
class  Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to the _ in front
  // of its name.
  static final Map<String, Logger> _cache =
  <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      print('a');
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      print('b');
      return logger;
    }
  }

  Logger._internal(this.name);
    static log(String msg) {
      print(msg);
  }
  _ls() {

  }
}

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
    Logger.log('Button clicked2');
    Logger lg = new Logger('a');
  });
}
