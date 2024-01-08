import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPreviewWidget extends StatefulWidget {
  final CameraController cameraController;

  const CameraPreviewWidget({Key? key, required this.cameraController})
      : super(key: key);

  @override
  _CameraPreviewWidgetState createState() => _CameraPreviewWidgetState();
}

class _CameraPreviewWidgetState extends State<CameraPreviewWidget> {
  @override
  void initState() {
    super.initState();
    widget.cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.cameraController.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: widget.cameraController.value.aspectRatio,
      child: CameraPreview(widget.cameraController),
    );
  }
}