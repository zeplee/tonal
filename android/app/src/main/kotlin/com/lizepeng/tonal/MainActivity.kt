package com.lizepeng.tonal

import android.graphics.Color
import android.os.Build
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //API>21,设置状态栏颜色透明
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) window.statusBarColor = Color.TRANSPARENT
        GeneratedPluginRegistrant.registerWith(this)
    }
}
