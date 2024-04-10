import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/datacontroller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.put(DataController(context));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Timezone: ${dataController.timezone.value}',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                'Connection Status: ${dataController.internetConnectionStatus.value}',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                'Bluetooth Status: ${dataController.bluetoothConnectionStatus.value}',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                'Screen Width: ${dataController.screenResolution.value}',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                'Orientation: ${dataController.screenOrientation}',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                'Battery Percent: ${dataController.batteryPercent.value}%',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 60),
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // timezoneController.text = getTimeZone();
                    });
                  },
                  child: const Text('Get Data'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
