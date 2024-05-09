import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class TestB extends StatefulWidget {
  const TestB({super.key});

  @override
  State<TestB> createState() => _TestBState();
}

class _TestBState extends State<TestB> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              flutterBlue.startScan(timeout: const Duration(seconds: 2));
              var subscription = flutterBlue.scanResults.listen((results) {
                print('results:${results[0].device.connect()}');
                // for (ScanResult r in results) {
                //   print(
                //       '@@@@${r.device.name} found! rssi: ${r.rssi} ${r.advertisementData}');
                // }
              });

// Stop scanning
              flutterBlue.stopScan();
            },
            child: const Text('스캔시작'),
          ),
        ],
      ),
    );
  }
}
