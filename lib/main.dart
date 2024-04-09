import 'package:flutter/material.dart';
import 'package:test_app/helpers/device.dart';
import 'package:test_app/helpers/timezone.dart';

import 'helpers/battery.dart';
import 'helpers/bluetooth_status.dart';
import 'helpers/connection_status.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  final Stopwatch stopwatch = Stopwatch()..start();
  runApp(const MainApp());

  WidgetsBinding.instance!.addPostFrameCallback((_) {
    print('App started in ${stopwatch.elapsedMilliseconds}ms');
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main App',
      home: const HomePage(),
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController timezoneController = TextEditingController();
  late String internetConnectionStatus = '';
  late String bluetoothConnectionStatus = '';
  late String batteryPercent = '';

  @override
  void initState() {
    super.initState();
    timezoneController.text = getTimeZone();
    _updateConnectionStatus();
    _getBluetoothStatus();
    _getBatteryPercent();
    getDeviceDetails();
  }

  void _updateConnectionStatus() async {
    internetConnectionStatus = await getConnectionStatus();
    print('Connection Status: $internetConnectionStatus');
  }

  void _getBluetoothStatus() async {
    bluetoothConnectionStatus = (await getBluetoothStatus())!;
    print('Bluetooth Status: $bluetoothConnectionStatus');
  }

  void _getBatteryPercent() async {
    batteryPercent = await getBatteryPercent();
    print('Battery Percent: $batteryPercent');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Timezone: ${timezoneController.text}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Connection Status: ${internetConnectionStatus.toString()}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Bluetooth Status: $bluetoothConnectionStatus',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Screen Width: ${screenSize.width}  Height: ${screenSize.height}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Orientation: $orientation',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Battery Percent: $batteryPercent',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 60),
            Align(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    timezoneController.text = getTimeZone();
                  });
                },
                child: const Text('Get Data'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
