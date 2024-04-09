import 'package:device_info_plus/device_info_plus.dart';

void getDeviceDetails() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

  // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  // print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

  // WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
  // print('Running on ${webBrowserInfo.userAgent}');
}
