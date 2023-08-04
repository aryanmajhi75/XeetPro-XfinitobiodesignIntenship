import 'dart:io';

import 'package:flutter/material.dart';
import 'package:some/new/widgets/detectimage.dart';
import 'package:some/new/widgets/showImage.dart';

List<String> imageList = List.generate(10, (index) => "");

class Footgrid extends StatefulWidget {
  const Footgrid({super.key, required this.name});
  final String name; // name for deciding which foot to show (L/R)

  @override
  State<Footgrid> createState() => _FootgridState();
}

class _FootgridState extends State<Footgrid> {
  //initial values for the index of image to be shown and name
  int index = 0;
  String name = "";

  int nullInd = 0;
  int len = 0; //length to cheeck if any imagelist is null

  @override
  initState() {
    super.initState();
    checkNull(9);
    print("inside init : $imageList");
  }

  void showSnackbar(int index, context) {
    // print(imageList);
    print("inside showSnackbar Function ${index + 1}");
    print(MediaQuery.of(context).size.width);
    final snackbar = SnackBar(
      content: Text("Please take image for grid number : ${index + 1}"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  checkNull(int len) {
    bool isNull = false;
    print("length: $len");
    for (int i = 0; i < len; ++i) {
      if (imageList[i].isEmpty == true) {
        nullInd = i;
        isNull = true;
        print("inside checkNull func : $isNull : $i");
        return isNull;
      }
    }
    return isNull;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.name, //shows the either left or right foot
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff50e0b5),
            ),
          ),
        ),
        GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          padding: const EdgeInsets.all(5),
          shrinkWrap: true,
          children: [
            InkWell(
              // on tap
              //for first item if name is right then check for null else go to image caputure page
              onTap: () {
                if (widget.name == "Right Foot") {
                  len = 5;
                  if (checkNull(len) == true) {
                    showSnackbar(nullInd, context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          if (widget.name == 'Left Foot') {
                            index = 0; //if left foot index is 0
                            name = "Left Foot";
                          }
                          if (widget.name == 'Right Foot') {
                            index = 5; //else 1
                            name = "Right Foot";
                          }
                          return DetectImage(
                            //send index and name as parameter to the camera page
                            index: index,
                            name: name,
                          );
                          // return const CameraApp1();
                        },
                      ),
                    );
                  }
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if (widget.name == 'Left Foot') {
                          index = 0; //if left foot index is 0
                          name = "Left Foot";
                        }
                        if (widget.name == 'Right Foot') {
                          index = 5; //else 1
                          name = "Right Foot";
                        }
                        return DetectImage(
                          //send index and name as parameter to the camera page
                          index: index,
                          name: name,
                        );
                        // return const CameraApp1();
                      },
                    ),
                  );
                }
              },
              //grid 0 -> Left foot 5->Right foot
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.black12,
                  // height: MediaQuery.of(context).size.height * 0.1,
                  // width: MediaQuery.of(context).size.width * 0.3,
                  child: widget.name == "Left Foot"
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageList[0] !=
                                  "" //if left foot show left sideways image
                              ? showImage(
                                  imageName: imageList.elementAt(0),
                                )
                              : Image.asset(
                                  "assets/images/left-foot-inside.png",
                                  fit: BoxFit.fill,
                                ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageList[5] != ""
                              ? showImage(
                                  imageName: imageList.elementAt(5),
                                )
                              : Image.asset(
                                  "assets/images/right-foot-inside.png",
                                  fit: BoxFit.fill,
                                ),
                        ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (widget.name == "Left Foot") {
                  // ind = 0;
                  len = 1;
                } else {
                  // ind = 0;
                  len = 6;
                }
                if (checkNull(len) == true) {
                  showSnackbar(nullInd, context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if (widget.name == 'Left Foot') {
                          index = 1;
                          name = "Left Foot";
                        }
                        if (widget.name == 'Right Foot') {
                          index = 6;
                          name = "Right Foot";
                        }
                        return DetectImage(
                          index: index,
                          name: name,
                        );
                        // return const CameraApp1();
                      },
                    ),
                  );
                }
              },
              //grid 1 -> Left foot 6->Right foot
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.black12,
                  // height: MediaQuery.of(context).size.height * 0.1,
                  // width: MediaQuery.of(context).size.width * 0.3,
                  child: widget.name == "Left Foot"
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageList[1] != ""
                              ? showImage(
                                  imageName: imageList.elementAt(1),
                                )
                              : Image.asset(
                                  "assets/images/left-foot-front.png",
                                  fit: BoxFit.fill,
                                ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageList[6] != ""
                              ? showImage(
                                  imageName: imageList.elementAt(1),
                                )
                              : Image.asset(
                                  "assets/images/right-foot-front.png",
                                  fit: BoxFit.fill,
                                ),
                        ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (widget.name == "Left Foot") {
                  // ind = 0;
                  len = 2;
                } else {
                  // ind = 0;
                  len = 7;
                }

                if (checkNull(len) == true) {
                  showSnackbar(nullInd, context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if (widget.name == 'Left Foot') {
                          index = 2;
                          name = "Left Foot";
                        }
                        if (widget.name == 'Right Foot') {
                          index = 7;
                          name = "Right Foot";
                        }
                        return DetectImage(
                          index: index,
                          name: name,
                        );
                        // return const CameraApp1();
                      },
                    ),
                  );
                }
              },
              //grid 2 -> Left foot 7->Right foot
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.black12,
                  // height: MediaQuery.of(context).size.height * 0.1,
                  // width: MediaQuery.of(context).size.width * 0.3,
                  child: widget.name == 'Left Foot'
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageList[2] != ""
                              ? showImage(
                                  imageName: imageList.elementAt(2),
                                )
                              : Image.asset(
                                  "assets/images/left-foot-bottom.png",
                                  fit: BoxFit.fill,
                                ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageList.elementAt(7) != ""
                              ? showImage(
                                  imageName: imageList.elementAt(2),
                                )
                              : Image.asset(
                                  "assets/images/right-foot-bottom.png",
                                  fit: BoxFit.fill,
                                ),
                        ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (widget.name == "Left Foot") {
                  // ind = 0;
                  len = 3;
                } else {
                  // ind = 0;
                  len = 8;
                }

                if (checkNull(len) == true) {
                  showSnackbar(nullInd, context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if (widget.name == 'Left Foot') {
                          index = 3;
                          name = "Left Foot";
                        }
                        if (widget.name == 'Right Foot') {
                          index = 8;
                          name = "Right Foot";
                        }
                        return DetectImage(
                          index: index,
                          name: name,
                        );
                        // return const CameraApp1();
                      },
                    ),
                  );
                }
              },
              //grid 3 -> Left foot 8->Right foot
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.black12,
                  // height: MediaQuery.of(context).size.height * 0.1,
                  // width: MediaQuery.of(context).size.width * 0.3,
                  child: widget.name == 'Left Foot'
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageList[3] != ""
                              ? showImage(
                                  imageName: imageList.elementAt(3),
                                )
                              : Image.asset(
                                  "assets/images/left-foot-back.png",
                                  fit: BoxFit.fill,
                                ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageList[8] != ""
                              ? showImage(
                                  imageName: imageList.elementAt(8),
                                )
                              : Image.asset(
                                  "assets/images/right-foot-back.png",
                                  fit: BoxFit.fill,
                                ),
                        ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (widget.name == "Left Foot") {
                  // ind = 0;
                  len = 4;
                } else {
                  // ind = 0;
                  len = 9;
                }

                if (checkNull(len) == true) {
                  showSnackbar(nullInd, context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if (widget.name == 'Left Foot') {
                          index = 4;
                          name = "Left Foot";
                        }
                        if (widget.name == 'Right Foot') {
                          index = 9;
                          name = "Right Foot";
                        }
                        return DetectImage(
                          index: index,
                          name: name,
                        );
                      },
                    ),
                  );
                }
              },
              //grid 4 -> Left foot 9->Right foot
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.black12,
                  child: widget.name == 'Left Foot'
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageList[4] != ""
                              ? showImage(
                                  imageName: imageList.elementAt(4),
                                )
                              : Image.asset(
                                  //if left foot is false then show right foot image
                                  "assets/images/left-foot-outside.png",
                                  fit: BoxFit.fill,
                                ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageList.elementAt(9) != ""
                              ? showImage(imageName: imageList.elementAt(9))
                              : Image.asset(
                                  //else left foot image
                                  "assets/images/right-foot-outside.png",
                                  fit: BoxFit.fill,
                                ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
