import 'package:ebla/app/app_preferences.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:webview_flutter/webview_flutter.dart' as base_webview;

import '../../../app/depndency_injection.dart';

LocalhostServer localhostServer = LocalhostServer();

class XMapView extends StatefulWidget {
  const XMapView({super.key});

  @override
  _XMapViewState createState() => _XMapViewState();
}

class _XMapViewState extends State<XMapView> {
  WebViewControllerPlus? _controller;
  double _height = 0.001;
  bool _isWebViewReady = false;
  String local = 'ar';
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    local = Localizations.localeOf(context) == ARABIC_LOCAL ? "ar" : "en";
    print('Current locale: $local');

    _initWebView(local);
  }

  Future<void> _initWebView(String local) async {
    if (!localhostServer.isRunning()) {
      await localhostServer.start();
    }
    final port = localhostServer.port;

    if (port == null) {
      debugPrint("❌ Failed to start localhost server.");
      return;
    }

    AppPreferences prefs = instance<AppPreferences>();
    String previousLocale = prefs.getXmapLocale();
    if (!prefs.getXmapCookie() || previousLocale != local) {
      final cookieManager = WebViewCookieManager();
      await cookieManager.setCookie(
        base_webview.WebViewCookie(
          name: 'pll_language',
          value: local,
          domain: 'localhost',
          path: '/',
        ),
      );
      prefs.setXmapCookie(true);
      prefs.setXmapLocale(local);
    }

    // Very important: create the controller AFTER setting the cookie
    final controller = WebViewControllerPlus()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) async {
            final h = await _controller?.webViewHeight;
            var height = double.tryParse(h.toString()) ?? 0.0;
            if (height != _height) {
              setState(() {
                _height = height;
              });
            }
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadFlutterAssetWithServer('assets/xmap/index.html', port); // reload

    setState(() {
      _controller = controller;
      _isWebViewReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isWebViewReady
        ? SizedBox(
            height: _height,
            child: WebViewWidget(controller: _controller!),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
