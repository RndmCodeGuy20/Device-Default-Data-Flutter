import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<String?> getBluetoothStatus() async {
  // if (await FlutterBluePlus.isSupported == false) {
  //   print("Bluetooth not supported by this device");
  //   return null;
  // }

  var subscription =
      FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
    print("Bluetooth adapter state: $state");
  });

  BluetoothAdapterState bluetoothStatus =
      await FlutterBluePlus.adapterState.first;

  return bluetoothStatus.toString();
}
