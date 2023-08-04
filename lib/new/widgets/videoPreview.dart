import 'dart:io';

import 'package:flutter/material.dart';
import 'package:some/new/summary.dart';
import 'package:some/new/widgets/camVideo.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String filePath;
  final String name;

  const VideoPage({Key? key, required this.filePath, required this.name})
      : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;

  // @override
  // void dispose() {
  //   _videoPlayerController.dispose();
  //   super.dispose();
  // }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setVolume(0.0);
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CamVideo(
                    name: "Front",
                  );
                },
              ),
            );
          },
        ),
        title: const Text('Video Preview'),
        elevation: 0,
        backgroundColor: Colors.black26,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (widget.name == "Around") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Summary();
                    },
                  ),
                );
              }
              // print('Preview Page');
              else if (widget.name == "Front") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CamVideo(
                        name: "Around",
                      );
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: _initVideoPlayer(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return VideoPlayer(_videoPlayerController);
          }
        },
      ),
    );
  }
}
