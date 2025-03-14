/*package com.eblacorp.qrep

import android.os.Bundle
import android.os.PersistableBundle
import com.google.firebase.Firebase
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.analytics.analytics
import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity : FlutterFragmentActivity() {
    private lateinit var analytics: FirebaseAnalytics

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        analytics = Firebase.analytics
        super.onCreate(savedInstanceState, persistentState)
    }
    // ...
}*/
package com.eblacorp.qrep

import android.media.AudioManager
import android.os.Bundle
import com.google.firebase.Firebase
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.analytics.analytics
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    private lateinit var analytics: FirebaseAnalytics
    private val CHANNEL = "com.eblacorp.qrep/audio"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Initialize Firebase
        analytics = Firebase.analytics
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Setup Method Channel properly
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "resetAudioMode") {
                resetAudioMode()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun resetAudioMode() {
        val audioManager = getSystemService(AUDIO_SERVICE) as AudioManager
        audioManager.mode = AudioManager.MODE_NORMAL
        audioManager.isSpeakerphoneOn = true
    }
}
