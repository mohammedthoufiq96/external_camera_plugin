import 'package:flutter/material.dart';
import 'package:external_camera_plugin/external_camera_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasExternalCameras = false;

  @override
  void initState() {
    super.initState();
    checkForExternalCameras();
  }

  Future<void> checkForExternalCameras() async {
    try {
      final result = await ExternalCameraPlugin.hasExternalCameras();
      setState(() {
        hasExternalCameras = result;
      });
    } catch (e) {
      print("Error checking for external cameras: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('External Camera Plugin Example'),
        ),
        body: Center(
          child: Text(
            'Has External Cameras: $hasExternalCameras',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
