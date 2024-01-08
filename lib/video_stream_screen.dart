import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'camera_preview_widget.dart';
import 'livekit_service.dart';
import 'camera_service.dart';


class VideoStreamScreen extends StatefulWidget {
  @override
  _VideoStreamScreenState createState() => _VideoStreamScreenState();
}

class _VideoStreamScreenState extends State<VideoStreamScreen> {
  final LiveKitService liveKitService = LiveKitService();
  final CameraService cameraService = CameraService();

  bool isStreaming = false;
  @override
  void initState() {
    super.initState();
    initializeServices();
  }

  Future<void> initializeServices() async {
    await liveKitService.initializeLiveKit();
    await cameraService.initializeCamera();
  }

  Future<void> startStreaming() async {
    await cameraService.startVideoStream();
    setState(() {
      isStreaming = true;
    });
  }

  Future<void> stopStreaming() async {
    await cameraService.stopVideoStream();
    setState(() {
      isStreaming = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Video Streaming'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Camera preview widget
            Center(child: isStreaming?CameraPreviewWidget(
                cameraController: cameraService.cameraController):Text("Streaming Stopped")
),
            // CameraPreviewWidget(
            //     cameraController: cameraService.cameraController),

            // Space between video display and controls
            SizedBox(height: 20),

            // Video controls (start/stop stream, camera switch, etc.)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    if (!isStreaming) {
                      startStreaming();
                    }
                    // Logic to start the video stream
                  },
                ),
                IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: () {
                    // Logic to stop the video stream
                    if (isStreaming) {
                      stopStreaming();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.switch_camera),
                  onPressed: () async{
                     await cameraService.switchCamera();
                    setState(() {});
                    // switchCamera();
                  },
                ),
                // Add more controls as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class VideoStreamScreen extends StatefulWidget {
//   @override
//   _VideoStreamScreenState createState() => _VideoStreamScreenState();
// }

// class _VideoStreamScreenState extends State<VideoStreamScreen> {
//   final LiveKitService liveKitService = LiveKitService();
//   final CameraService cameraService = CameraService();

//   @override
//   void initState() {
//     super.initState();
//     initializeServices();
//   }

//   Future<void> initializeServices() async {
//     await liveKitService.initializeLiveKit();
//     await cameraService.initializeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Live Video Streaming'),
//       ),
//      body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Video stream display widget
//           Container(
//             width: 300,
//             height: 200,
//             // color: Colors.grey, // Replace with your video stream display widget
//             // You might use a VideoPlayer, CameraPreview, or other widget here
           
//           ),

//           // Space between video display and controls
//           SizedBox(height: 20),

//           // Video controls (start/stop stream, camera switch, etc.)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.play_arrow),
//                 onPressed: () {
//                   // Logic to start the video stream
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.stop),
//                 onPressed: () {
//                   // Logic to stop the video stream
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.switch_camera),
//                 onPressed: () {
//                   // Logic to switch the camera
//                 },
//               ),
//               // Add more controls as needed
//             ],
//         ),
//         ],
//       ),
//       ),
//     );
//   }
// }
