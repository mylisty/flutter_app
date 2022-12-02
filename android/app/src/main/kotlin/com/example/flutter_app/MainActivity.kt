package com.example.flutter_app

import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant


// https://juejin.cn/post/6976443779762880549  RecyclerView
// https://juejin.cn/post/6844904137713270797 RecyclerView 豆瓣详情页面 bottomDialog 样式

class MainActivity : FlutterActivity() {

    val CHANNEL: String = "samples.flutter.dev/battery"
/*  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    // 自定义插件
//    MethodChannel(flutterView, CHANNEL).setMethodCallHandler(object : MethodCallHandler {
//      override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
//        if (call.method == "interaction") {
//          val intent = Intent(this@MainActivity, SecondActivity::class.java)
//          this@MainActivity.startActivity(intent)
//          result.success("success")
//        } else {
//          result.notImplemented()
//        }
//      }
//    })

  }*/


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "interaction") {
                val intent = Intent(this@MainActivity, SecondActivity::class.java)
                this@MainActivity.startActivity(intent)
                result.success("success")
            } else {
                result.notImplemented()
            }
        }
        super.configureFlutterEngine(flutterEngine)
    }

}
