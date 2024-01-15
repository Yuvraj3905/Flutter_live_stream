import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'video_stream_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _checkPermissions();

  runApp(MyApp());
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Streaming'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoStreamScreen()),
            );
          },
          child: Text('Start Streaming'),
        ),
      ),
    );
  }
}

Future<void> _checkPermissions() async {
  var cameraStatus = await Permission.camera.request();
  var microphoneStatus = await Permission.microphone.request();

  if (cameraStatus.isGranted && microphoneStatus.isGranted) {
    print('Camera and microphone permissions granted');
  } else {
    print('Permissions not granted');
    // Handle cases when permissions are not granted
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiveKit Video Streaming',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
       home: StartScreen(),
    );
  }
}

