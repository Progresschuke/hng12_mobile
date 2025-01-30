package com.example.stage_zero_task

import io.flutter.embedding.android.FlutterActivity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "github/methodchannel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "openBrowser") {
                val url = call.argument<String>("url")
                openBrowser(url)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun openBrowser(url: String?) {
        if (url != null) {
            val intent = Intent(Intent.ACTION_VIEW)
            intent.data = Uri.parse(url)
            startActivity(intent)
        }
    }
}
 