package com.example.animopo

import android.os.Bundle
import android.webkit.WebView
import androidx.webkit.WebSettingsCompat
import androidx.webkit.WebViewFeature
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "webview/theme"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Ensure flutterEngine is not null
        flutterEngine?.let {
            MethodChannel(it.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                if (call.method == "setDarkMode") {
                    val enableDarkMode = call.argument<Boolean>("enableDarkMode")
                    setWebViewDarkMode(enableDarkMode ?: false)
                    result.success(null)
                }
            }
        }
    }

    private fun setWebViewDarkMode(enableDarkMode: Boolean) {
        if (WebViewFeature.isFeatureSupported(WebViewFeature.FORCE_DARK)) {
            val webView = WebView(applicationContext)
            if (enableDarkMode) {
                WebSettingsCompat.setForceDark(webView.settings, WebSettingsCompat.FORCE_DARK_ON)
            } else {
                WebSettingsCompat.setForceDark(webView.settings, WebSettingsCompat.FORCE_DARK_OFF)
            }
        }
    }
}
