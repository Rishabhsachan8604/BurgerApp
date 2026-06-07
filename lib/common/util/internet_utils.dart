import 'package:connectivity_plus/connectivity_plus.dart';

class InternetCheck {
  Future<bool> check() async {
    final List<ConnectivityResult> results =
        await Connectivity().checkConnectivity();
    return results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi);
  }

  dynamic checkInternet(Function func) {
    check().then((internet) {
      if (internet) {
        func(true);
      } else {
        func(false);
      }
    });
  }
}
