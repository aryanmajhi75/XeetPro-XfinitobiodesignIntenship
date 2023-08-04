import 'package:flutter/material.dart';
import 'package:some/new/widgets/camVideo.dart';
import 'package:video_player/video_player.dart';

// List<File> videoList = [];

class Videogrid extends StatefulWidget {
  const Videogrid({super.key, required this.name});
  final String name;

  @override
  State<Videogrid> createState() => _VideogridState();
}

class _VideogridState extends State<Videogrid> {
  late VideoPlayerController localVideoController1;
  late VideoPlayerController localVideoController2;

  @override
  void initState() {
    super.initState();
    localVideoController1 =
        VideoPlayerController.asset("assets/videos/front-walk.mp4");
    localVideoController2 =
        VideoPlayerController.asset("assets/videos/side-walk.mp4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff50e0b5),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CamVideo(
                          name: widget.name,
                        );
                      },
                    ),
                  );
                },
                //grid 0 -> Left foot 5->Right foot
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.black12,
                    // height: MediaQuery.of(context).size.height * 0.1,
                    // width: MediaQuery.of(context).size.width * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: widget.name == 'Front'
                          ? AspectRatio(
                              aspectRatio:
                                  localVideoController1.value.aspectRatio,
                              child: VideoPlayer(localVideoController1),
                            )
                          : AspectRatio(
                              aspectRatio:
                                  localVideoController2.value.aspectRatio,
                              child: VideoPlayer(localVideoController2),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
