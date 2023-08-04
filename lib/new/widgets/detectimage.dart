import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:some/constants.dart';
import 'package:some/new/widgets/picPreview.dart';

class DetectImage extends StatefulWidget {
  const DetectImage({super.key, required this.index, required this.name});
  final int index;
  final String name;

  @override
  State<DetectImage> createState() => _DetectImageState();
}

class _DetectImageState extends State<DetectImage> with WidgetsBindingObserver {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image
  List<String> path = [
    "assets/images/inside-leftfoot.png",
    "assets/images/front-leftfoot.png",
    "assets/images/bottom-leftfoot.png",
    "assets/images/back-leftfoot.png",
    "assets/images/outside-leftfoot.png",
    "assets/images/inside-rightfoot.png",
    "assets/images/front-rightfoot.png",
    "assets/images/bottom-rightfoot.png",
    "assets/images/back-rightfoot.png",
    "assets/images/outside-rightfoot.png",
  ];

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller = CameraController(
        cameras![0],
        ResolutionPreset.max,
      );
    }
  }

  gotoPreview() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PicPreview(
            index: widget.index,
            name: widget.name,
            prevImage: image!.path,
          );
        },
      ),
    ); //sending XFile image to preview page by converting it to File
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.name),
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.arrow_forward,
      //       ),
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: 400,
            child: controller == null
                ? const Text(
                    "Loading Camera...",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                : !controller!.value.isInitialized
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CameraPreview(controller!),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: -65,
            child: Image.asset(
              path[widget.index],
              height: 400,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.8,
            left: MediaQuery.of(context).size.width * 0.4,
            child: FloatingActionButton(
              backgroundColor: xeuronBlack,
              elevation: 0,
              onPressed: () async {
                //image capture button
                log((MediaQuery.of(context).size.height).toString());
                log((MediaQuery.of(context).size.width).toString());
                try {
                  if (controller != null) {
                    //check if contrller is not null
                    if (controller!.value.isInitialized) {
                      //check if controller is initialized
                      image = await controller!.takePicture(); //capture image
                      gotoPreview();
                      // setState(() {
                      //update UI
                      // imageList.add(
                      //   File(image!.path),
                      // );
                      // });
                    }
                  }
                } catch (e) {
                  print(e); //show error
                }
              },
              child: const Icon(
                Icons.circle,
                size: 56,
                color: xeuronGreen,
              ),
            ),
          ),
          // Container(
          //   //show captured image
          //   padding: const EdgeInsets.all(30),
          //   child: image == null
          //       ? const Text("No image captured")
          //       : Image.file(
          //           File(image!.path),
          //           height: 200,
          //         ),
          //   //display captured image
          // ),
        ],
      ),
    );
  }
}
