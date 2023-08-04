import 'dart:io';

import "package:flutter/material.dart";
import 'package:some/new/widgets/detectimage.dart';
import 'package:some/new/widgets/footgrid.dart';
import 'dart:math' as math;
import '../foot.dart';

class PicPreview extends StatefulWidget {
  const PicPreview(
      {super.key,
      required this.prevImage,
      required this.index,
      required this.name});
  final String prevImage; //image to preview
  //parameter to b be passed if pic is retaken
  final String name; //name of the image
  final int index; //index to be used in the outline

  @override
  State<PicPreview> createState() => _PicPreviewState();
}

class _PicPreviewState extends State<PicPreview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        //to postion the widgets in the container
        children: [
          Image.file(File(widget.prevImage)),
          Positioned(
            top: 700,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff0C1324),
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 48, 135, 110),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1.5),
                      )
                    ],
                  ),
                  child: FloatingActionButton(
                    heroTag: "Exit",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Foot();
                            // return to the foot page
                          },
                        ),
                      );
                    },
                    child: const Icon(Icons.close),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff0C1324),
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 48, 135, 110),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1.5),
                      )
                    ],
                  ),
                  child: FloatingActionButton(
                    heroTag: "Retake",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetectImage(
                              index: widget.index,
                              name: widget.name,
                            );
                            // return to the foot page
                          },
                        ),
                      );
                    },
                    child: const Icon(Icons.refresh),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff0C1324),
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 48, 135, 110),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1.5),
                      )
                    ],
                  ),
                  child: FloatingActionButton(
                    heroTag: "Accept",
                    onPressed: () {
                      imageList[widget.index] = widget.prevImage;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Foot(); //navigates to the next page
                          },
                        ),
                      );
                    },
                    child: const Icon(Icons.check),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
