import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementer implements NetworkInfo {
  final Connectivity _connectivity;
  NetworkInfoImplementer(this._connectivity);
  @override
  Future<bool> get isConnected =>
      _connectivity.checkConnectivity().then((value) {
        if (value == ConnectivityResult.wifi ||
            value == ConnectivityResult.mobile) {
          return true;
        } else {
          return false;
        }
      });
}
