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
        return true;
        //Note ZAK: there is a problem with this package i guess
        // cause the data loaded after i commad the next 5 lines

        // if (value == ConnectivityResult.wifi ||
        //     value == ConnectivityResult.mobile) {
        // } else {
        //   return false;
        // }
      });
}
