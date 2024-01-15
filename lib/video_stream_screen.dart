import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:streamer/broadcast.dart';
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
  bool isPaused = false;
  Uint8List? lastFrame; //Store the Image

  @override
  void initState() {
    super.initState();
    initializeServices();
  }

  Future<void> initializeServices() async {
    await liveKitService.initializeLiveKit();
    await cameraService.initializeCamera();
    // await cameraService.initializeCameras();
  }

  bool isMuted = false;

  void toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
  }

  Future<void> startStreaming() async {
    if (!isPaused) {
      await cameraService.startVideoStream();
      setState(() {
        isStreaming = true;
        isPaused = false;
        lastFrame = null;
      });
    } else {
      await cameraService.startVideoStream();
      setState(() {
        isStreaming = true;
        isPaused = false;
        lastFrame = null;
      });
    }
  }

  Future<void> stopStreaming() async {
    await cameraService.stopVideoStream();
    setState(() {
      isStreaming = false;
      isPaused = false;
    });
  }

  Future<void> pauseStreaming() async {
    setState(() {
      isPaused = true;
    });
    lastFrame = await cameraService.captureLastFrame();
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
      body: Stack(
        children: [
      //        CameraPreviewWidget(
      //   cameraController: cameraService.frontCameraController,
      // ),

      // // Space between camera views
      // SizedBox(height: 20),

      // // Camera preview widget for back camera
      // CameraPreviewWidget(
      //   cameraController: cameraService.backCameraController,
      // ),

          Container(
            width: double.infinity,
            height: double.infinity,
            child: isPaused && lastFrame != null
                ? Image.memory(
                    lastFrame!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : isStreaming
                    ? CameraPreviewWidget(
                        cameraController: cameraService.cameraController,
                      )
                    : Center(
                        child: Text("Streaming Stopped"),
                      ),
          ),

          // Video controls (start/stop stream, camera switch)
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  color: Colors.green,
                  onPressed: () {
                    if (!isStreaming) {
                      startStreaming();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.stop),
                  color: Colors.red,
                  onPressed: () {
                    if (isStreaming) {
                      stopStreaming();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.switch_camera),
                  onPressed: () async {
                    await cameraService.switchCamera();
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () {
                    if (isStreaming) {
                      pauseStreaming();
                    } else {
                      Text("Streaming Stopped2");
                    }
                  },
                  color: isStreaming ? null : Colors.grey,
                ),
                IconButton(
                  icon: Icon(isMuted ? Icons.mic_off : Icons.mic),
                  onPressed: () {
                    toggleMute();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//A controlled window screen with definite viewport

// Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Live Video Streaming'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 300,
//               height: 200,
//               child: isPaused && lastFrame != null
//                   ? Image.memory(
//                       lastFrame!,
//                       width: 300,
//                       height: 200,
//                       fit: BoxFit.cover,
//                     )
//                   : isStreaming
//                       ? CameraPreviewWidget(
//                           cameraController: cameraService.cameraController,
//                         )
//                       : Center(
//                           child: Text("Streaming Stopped"),
//                         ),
//             ),
//             // Space between video display and controls
//             SizedBox(height: 20),

//             // Video controls (start/stop stream, camera switch)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.play_arrow),
//                   onPressed: () {
//                     if (!isStreaming) {
//                       startStreaming();
//                       // createLiveBroadcast();
//                     }
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.stop),
//                   onPressed: () {
//                     if (isStreaming) {
//                       stopStreaming();
//                     }
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.switch_camera),
//                   onPressed: () async {
//                     await cameraService.switchCamera();
//                     setState(() {});
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.pause),
//                   onPressed: () {
//                     if (isStreaming) {
//                       pauseStreaming();
//                     } else {
//                       Text("Streaming Stopped2");
//                     }
//                   },
//                   color: isStreaming ? null : Colors.grey,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }