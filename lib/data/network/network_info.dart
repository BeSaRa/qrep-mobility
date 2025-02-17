import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementer implements NetworkInfo {
  final Connectivity _connectivity;
  NetworkInfoImplementer(this._connectivity);
  @override
  Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivityResults =
        await _connectivity.checkConnectivity();

    // Check if any of the results contain WiFi or mobile
    return connectivityResults.contains(ConnectivityResult.wifi) ||
        connectivityResults.contains(ConnectivityResult.mobile);
  }
}
