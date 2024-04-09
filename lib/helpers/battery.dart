import 'package:battery_plus/battery_plus.dart';

Future<String> getBatteryPercent() async {
  final Battery battery = Battery();
  final int batteryLevel = await battery.batteryLevel;
  print('Battery Level: $batteryLevel');
  return batteryLevel.toString();
}
