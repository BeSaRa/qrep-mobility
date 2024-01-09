package com.eblacorp.qrep

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
}