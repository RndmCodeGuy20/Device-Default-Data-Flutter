import 'package:connectivity_plus/connectivity_plus.dart';

Future<String> getConnectionStatus() async {
  final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile)) {
    return 'Mobile Data';
  } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
    return 'Wi-Fi';
  } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
    return 'Ethernet';
  } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
    return 'VPN';
  } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
    return 'Bluetooth';
  } else if (connectivityResult.contains(ConnectivityResult.other)) {
    return 'Other';
  } else if (connectivityResult.contains(ConnectivityResult.none)) {
    return 'No Connection';
  }

  return 'Unknown';
}


