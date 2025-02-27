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

    return
        // !connectivityResults.contains(ConnectivityResult.other) ||
        !connectivityResults.contains(ConnectivityResult.bluetooth) ||
            !connectivityResults.contains(ConnectivityResult.none);
  }
}
