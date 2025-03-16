// import UIKit
// import Flutter
// import FirebaseCore
// import FirebaseAnalytics

// @main
// @objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     FirebaseApp.configure();
//     Analytics.setAnalyticsCollectionEnabled(true)
//     GeneratedPluginRegistrant.register(with: self)
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
// }
import UIKit
import Flutter
import FirebaseCore
import FirebaseAnalytics
import AVFoundation  //for audio session management

@main
@objc class AppDelegate: FlutterAppDelegate {
  
  private let CHANNEL = "com.eblacorp.qrep/audio"
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()  // Initialize Firebase
    Analytics.setAnalyticsCollectionEnabled(true)
    GeneratedPluginRegistrant.register(with: self)
    
    // Setup audio session
    setupAudioSession()

    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
    
    channel.setMethodCallHandler { (call, result) in
      if call.method == "resetAudioMode" {
        self.resetAudioMode()
        result(nil)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func setupAudioSession() {
    do {
      let session = AVAudioSession.sharedInstance()
      try session.setCategory(.playAndRecord, mode: .voiceChat, options: .defaultToSpeaker) // Set the speakerphone as the default
      try session.setActive(true)
    } catch {
      print("Error setting up audio session: \(error)")
    }
  }

  private func resetAudioMode() {
    do {
      let session = AVAudioSession.sharedInstance()
      try session.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker) // Ensure speakerphone is on
      try session.setActive(true)
    } catch {
      print("Error resetting audio mode: \(error)")
    }
  }
}