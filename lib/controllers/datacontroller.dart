import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/helpers/battery.dart';
import 'package:test_app/helpers/bluetooth_status.dart';
import 'package:test_app/helpers/connection_status.dart';
import 'package:test_app/helpers/screen.dart';
import 'package:test_app/helpers/timezone.dart';

class DataController extends GetxController {
  final BuildContext _context;
  final Connectivity _connectivity = Connectivity();

  DataController(this._context);

  RxString timezone = ''.obs;
  RxString internetConnectionStatus = ''.obs;
  RxString bluetoothConnectionStatus = ''.obs;
  RxString carrierName = ''.obs;
  RxString batteryPercent = ''.obs;
  RxString deviceName = ''.obs;
  RxString deviceModel = ''.obs;
  RxString screenResolution = ''.obs;
  RxString deviceType = ''.obs;
  RxString deviceOS = ''.obs;
  RxString screenOrientation = ''.obs;
  RxString appVersion = ''.obs;

  @override
  void onInit() {
    super.onInit();
    timezone.value = getTimeZone();
    // _updateConnectionStatus();
    // _getBluetoothStatus();
    _getBatteryPercent();
    // _getDeviceDetails();
    _getAppDetails();
    // ScreenData;
    _updateScreenData();

    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results.first);
    });
  }

  void _updateConnectionStatus(ConnectivityResult result) async {
    print('Connection Status: $result');
    if (result == ConnectivityResult.mobile) {
      internetConnectionStatus.value = 'Mobile Data';
    } else if (result == ConnectivityResult.wifi) {
      internetConnectionStatus.value = 'Wi-Fi';
    } else if (result == ConnectivityResult.ethernet) {
      internetConnectionStatus.value = 'Ethernet';
    } else if (result == ConnectivityResult.vpn) {
      internetConnectionStatus.value = 'VPN';
    } else if (result == ConnectivityResult.bluetooth) {
      internetConnectionStatus.value = 'Bluetooth';
    } else if (result == ConnectivityResult.other) {
      internetConnectionStatus.value = 'Other';
    } else if (result == ConnectivityResult.none) {
      internetConnectionStatus.value = 'No Connection';
    } else {
      internetConnectionStatus.value = 'Unknown';
    }
  }

  void _getBluetoothStatus() async {
    bluetoothConnectionStatus.value = (await getBluetoothStatus())!;
    print('Bluetooth Status: $bluetoothConnectionStatus');
  }

  void _getBatteryPercent() async {
    batteryPercent.value = await getBatteryPercent();
    print('Battery Percent: $batteryPercent');
  }

  void _updateScreenData() {
    final ScreenData screenData = ScreenData(_context);
    screenResolution.value = screenData.screenSize.toString();
    screenOrientation.value = screenData.screenOrientation.toString();
  }

  void _getAppDetails() {
    appVersion.value = '1.0.0';
  }
}
