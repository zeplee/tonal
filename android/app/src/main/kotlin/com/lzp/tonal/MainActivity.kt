package com.lzp.tonal

import io.flutter.embedding.android.FlutterActivity

import android.os.Build
import android.view.ViewTreeObserver
import android.view.WindowManager
class MainActivity: FlutterActivity() {
//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        when {
//            //19->21
//            Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT && Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP -> {
//                window.setFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS,
//                        WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
////                window.setFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION,
////                        WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)
//            }
//            //21->max
//            Build.VERSION.SDK_INT > Build.VERSION_CODES.LOLLIPOP -> window.statusBarColor = Color.TRANSPARENT
//        }
//    }
//
//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
//    }
}