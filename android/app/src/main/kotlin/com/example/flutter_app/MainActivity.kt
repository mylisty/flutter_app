package com.example.flutter_app

import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel
import android.icu.lang.UCharacter.GraphemeClusterBreak.T





class MainActivity: FlutterActivity() {

  private val CHANNEL = "demo.plugin"
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    // 自定义插件
    MethodChannel(flutterView, CHANNEL).setMethodCallHandler(object : MethodCallHandler {
      override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "interaction") {
          val intent = Intent(this@MainActivity, SecondActivity::class.java)
          this@MainActivity.startActivity(intent)
          result.success("success")
        } else {
          result.notImplemented()
        }
      }
    })
    GeneratedPluginRegistrant.registerWith(this)
  }
}
