import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:some/new/foot.dart';
import 'package:some/new/widgets/videoPreview.dart';

String front = "";
String around = "";

class CamVideo extends StatefulWidget {
  const CamVideo({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _CamVideoState createState() => _CamVideoState();
}

class _CamVideoState extends State<CamVideo> {
  bool _isLoading = true;
  bool _isRecording = false;
  late CameraController _cameraController;

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  // @override
  // void dispose() {
  //   _cameraController.dispose();
  //   super.dispose();
  // }

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    _cameraController = CameraController(
      front,
      ResolutionPreset.max,
      enableAudio: false,
    );
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  _recordVideo() async {
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(filePath: file.path, name: widget.name),
      );
      if (widget.name == "Front") {
        front = file.path;
      } else {
        around = file.path;
      }
      Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(widget.name),
            leading: ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName("Foot"));
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
          body: Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CameraPreview(_cameraController),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    child: Icon(_isRecording ? Icons.stop : Icons.circle),
                    onPressed: () => _recordVideo(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
