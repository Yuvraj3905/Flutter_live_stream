import 'dart:io';

import 'package:camera/camera.dart';
import 'package:livekit_client/livekit_client.dart';
import 'dart:typed_data';


class CameraService {
   Room? room;
  late CameraController cameraController;

  Future<void> initializeCamera() async {
     final cameras = await availableCameras();
    final firstCamera = cameras.first;
    cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    await cameraController.initialize();
    // final cameras = await availableCameras();
    // _controller = CameraController(cameras[0], ResolutionPreset.medium);
    // try{
    // await _controller.initialize();
    // }catch(error){
    //   print("Error Initializing the camera $error");
    // }
    // Handle camera initialization errors
  }
  
  
   Future<void> startVideoStream() async {
    
    if (room != null && room!.localParticipant != null) {
      try {
        await room!.localParticipant!.setCameraEnabled(true);// '!' null aware operator
        print('Video stream started');
      } catch (error) {
        print('Error starting video stream: $error');
      }
    } else {
      print('Room or local participant not initialized');
    }
  }

  Future<void> stopVideoStream() async {
   
    if (room != null && room!.localParticipant != null) {
      try {
        await room!.localParticipant!.setCameraEnabled(false);
        print('Video stream stopped');
      } catch (error) {
        print('Error stopping video stream: $error');
      }
    } else {
      print('Room or local participant not initialized');
    }
  }

 Future<void> switchCamera() async {
  await cameraController.dispose();//option to free up resources after the use of camera

  final cameras = await availableCameras(); // Get the list of available cameras

  CameraDescription newCamera;
  if (cameraController.description.lensDirection == CameraLensDirection.back) {
    newCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
  } else {
    newCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
  }

  // Initialize the new camera controller
  cameraController = CameraController(
    newCamera,
    ResolutionPreset.medium,
  );

  await cameraController.initialize();

}

 Future<Uint8List> captureLastFrame() async {
    if (!cameraController.value.isInitialized) {
      throw 'Camera is not initialized';
    }

    try {
      // Capturing the image from the camera
      XFile imageFile = await cameraController.takePicture();

      // Decoding the image file into bytes
      Uint8List imageBytes = await File(imageFile.path).readAsBytes();
      
      return imageBytes;
    } catch (e) {
      print('Error capturing the last frame: $e');
      throw 'Error capturing the last frame';
    }
  }

  
}
