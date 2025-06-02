import UIKit
import Flutter
import FirebaseCore
import FirebaseAnalytics
import AVFoundation

@main
@objc class AppDelegate: FlutterAppDelegate {

    private let audioChannelName = "com.eblacorp.qrep/audio"
    private var audioChannel: FlutterMethodChannel!
    private let session = AVAudioSession.sharedInstance()  // ← single shared instance

    var audioRecorder: AVAudioRecorder?
    var audioFileUrl: URL?
    private var audioPlayer: AVAudioPlayer?
    private var stopTimer: Timer?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Firebase setup
        FirebaseApp.configure()
        Analytics.setAnalyticsCollectionEnabled(true)

        // Register Flutter plugins
        GeneratedPluginRegistrant.register(with: self)

        // Configure iOS audio session for VoIP/WebRTC
        configureAudioSession(mode: .videoChat)

        // Set up MethodChannel
        guard let controller = window?.rootViewController as? FlutterViewController else {
            fatalError("rootViewController is not a FlutterViewController")
        }
        audioChannel = FlutterMethodChannel(
            name: audioChannelName,
            binaryMessenger: controller.binaryMessenger
        )
        audioChannel.setMethodCallHandler(handleAudioMethodCall)

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // MARK: – Shared Audio Session Configuration

    private func configureAudioSession(mode: AVAudioSession.Mode) {
        do {
            try session.setCategory(
                .playAndRecord,
                mode: mode,
                options: [
                    .defaultToSpeaker,
                    .allowBluetooth,
                    .mixWithOthers,
                    .interruptSpokenAudioAndMixWithOthers
                ]
            )
            try session.setActive(true)
            print("✅ AVAudioSession configured: category=playAndRecord, mode=\(mode.rawValue)")
        } catch {
            print("❌ Failed to configure AVAudioSession: \(error)")
        }
    }

    // MARK: – MethodChannel Handler

    private func handleAudioMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "resetAudioMode":
            DispatchQueue.main.async {
                self.configureAudioSession(mode: .default)
                result(nil)
            }

        case "forceAudioPlayback":
            print("✅ iOS: forceAudioPlayback method received")
//              configureAudioSession(mode: .videoChat)
            forceAudioPlayback()
            result(nil)

        case "playSilentAudio":
            playSilentAudio()
            result(nil)

        default:
            result(FlutterMethodNotImplemented)
        }
    }

    // MARK: – Force Speaker Playback

   private func forceAudioPlayback() {
       DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
           do {
               try self.session.setCategory(.playAndRecord,
                                            mode: .videoChat,
                                            options: [.defaultToSpeaker, .allowBluetooth])
               try self.session.overrideOutputAudioPort(.speaker)
               try self.session.setActive(true, options: .notifyOthersOnDeactivation)

               for output in self.session.currentRoute.outputs {
                   print("🔈 Output port: \(output.portType.rawValue)")
               }
               print("✅ Forced speaker playback")
           } catch {
               print("❌ forceAudioPlayback error: \(error.localizedDescription)")
           }
       }
   }


    // MARK: – Play Brief Silent Audio (to prime the session)

    private func playSilentAudio() {
        do {
            try session.setCategory(.playAndRecord,
                                   mode: .videoChat,
                                   options: [.defaultToSpeaker, .allowBluetooth, .mixWithOthers])
            try session.setActive(true)

            guard let url = Bundle.main.url(forResource: "silent", withExtension: "mp3") else {
                print("❌ Could not find silent.mp3")
                return
            }

            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = 1.0
            audioPlayer?.play()

            stopTimer?.invalidate()
            stopTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                self.audioPlayer?.stop()
                self.audioPlayer = nil
                print("🛑 Stopped silent audio after 3 seconds")
            }

            print("🔊 Playing silent audio at max volume")
        } catch {
            print("❌ playSilentAudio failed: \(error)")
        }
    }
}
// import UIKit
// import Flutter
// import FirebaseCore
// import FirebaseAnalytics
//
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
