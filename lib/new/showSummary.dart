import 'dart:io';
import 'package:flutter/material.dart';
import 'package:some/new/phyprofile.dart';
import 'package:some/sqflite/dbhelper.dart';
import 'package:some/sqflite/model.dart';
import 'package:video_player/video_player.dart';

class showSummary extends StatefulWidget {
  showSummary({super.key});

  @override
  State<showSummary> createState() => _showSummaryState();
}

class _showSummaryState extends State<showSummary> {
  //DB Manager variable
  final DbManager dbManager = DbManager();

  //videoplayercontroller
  late VideoPlayerController _videoPlayerController1;
  late VideoPlayerController _videoPlayerController2;

  //Model variables
  late List<Model> modelList;
  late Model model;

  //init video for video 1
  // Future _initVideoPlayer1() async {
  //   _videoPlayerController1 = VideoPlayerController.file(File(model.vid1));
  //   await _videoPlayerController1.initialize();
  //   await _videoPlayerController1.setLooping(true);
  //   await _videoPlayerController1.play();
  //   print("video 1 init");
  // }

  //init video for video 2
  // Future _initVideoPlayer2() async {
  //   _videoPlayerController2 = VideoPlayerController.file(File(model.vid2));
  //   await _videoPlayerController2.initialize();
  //   await _videoPlayerController2.setLooping(true);
  //   await _videoPlayerController2.play();
  //   print("video 2 init");
  // }

  @override
  Widget build(BuildContext context) {
    //dimensions of the phone
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      //page to show the summary pdf fetched from the server
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Model>>(
          future: dbManager.getModelList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print(snapshot.data);
              modelList = snapshot.data!;
              return Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    for (int i = 0; i < modelList.length; i++) {
                      if (modelList[i].userid == uniqueId) {
                        model = modelList[i];
                      }
                    }
                    return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
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
                            child: const Text("User Information"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: width * 0.8,
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
                            child: Text("Username :${model.username}"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: width * 0.8,
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
                            child: Text("First name : ${model.fname}"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width * 0.8,
                            padding: const EdgeInsets.all(10),
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
                            child: Text("Middle name : ${model.mname}"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width * 0.8,
                            padding: const EdgeInsets.all(10),
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
                            child: Text("Last name : ${model.lname}"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: width * 0.8,
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
                            child: Text("Date of Birth : ${model.dob}"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: width * 0.8,
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
                            child: Text("Email id : ${model.email}"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: width * 0.8,
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
                            child: Text("Gender : ${model.gender}"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
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
                            child: const Text("Physical Information"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: width * 0.8,
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
                            child:
                                Text("Height : ${model.height}${model.hunit}"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: width * 0.8,
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
                            child:
                                Text("Weight : ${model.weight}${model.wunit}"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: width * 0.8,
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
                            child: Text("Preconditions : ${model.precon}"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: width * 0.8,
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
                            child:
                                Text("Physical Activities : ${model.phyact}"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
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
                            child: const Text("Images Captured"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Expanded(
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Container(
                          //         height: height * 0.3,
                          //         padding: const EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //           color: const Color(0xff0C1324),
                          //           borderRadius: BorderRadius.circular(45),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //               color:
                          //                   Color.fromARGB(255, 48, 135, 110),
                          //               spreadRadius: 1,
                          //               blurRadius: 2,
                          //               offset: Offset(0, 1.5),
                          //             )
                          //           ],
                          //         ),
                          //         child: Image.asset(model.image1),
                          //       ),
                          //       Container(
                          //         height: height * 0.3,
                          //         padding: const EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //           color: const Color(0xff0C1324),
                          //           borderRadius: BorderRadius.circular(45),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //               color:
                          //                   Color.fromARGB(255, 48, 135, 110),
                          //               spreadRadius: 1,
                          //               blurRadius: 2,
                          //               offset: Offset(0, 1.5),
                          //             )
                          //           ],
                          //         ),
                          //         child: Image.asset(model.image2),
                          //       ),
                          //       Container(
                          //         height: height * 0.3,
                          //         padding: const EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //           color: const Color(0xff0C1324),
                          //           borderRadius: BorderRadius.circular(45),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //               color:
                          //                   Color.fromARGB(255, 48, 135, 110),
                          //               spreadRadius: 1,
                          //               blurRadius: 2,
                          //               offset: Offset(0, 1.5),
                          //             )
                          //           ],
                          //         ),
                          //         child: Image.asset(model.image3),
                          //       ),
                          //       Container(
                          //         height: height * 0.3,
                          //         padding: const EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //           color: const Color(0xff0C1324),
                          //           borderRadius: BorderRadius.circular(45),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //               color:
                          //                   Color.fromARGB(255, 48, 135, 110),
                          //               spreadRadius: 1,
                          //               blurRadius: 2,
                          //               offset: Offset(0, 1.5),
                          //             )
                          //           ],
                          //         ),
                          //         child: Image.asset(model.image4),
                          //       ),
                          //       Container(
                          //         height: height * 0.3,
                          //         padding: const EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //           color: const Color(0xff0C1324),
                          //           borderRadius: BorderRadius.circular(45),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //               color:
                          //                   Color.fromARGB(255, 48, 135, 110),
                          //               spreadRadius: 1,
                          //               blurRadius: 2,
                          //               offset: Offset(0, 1.5),
                          //             )
                          //           ],
                          //         ),
                          //         child: Image.asset(model.image5),
                          //       ),
                          //       Container(
                          //         height: height * 0.3,
                          //         padding: const EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //           color: const Color(0xff0C1324),
                          //           borderRadius: BorderRadius.circular(45),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //               color:
                          //                   Color.fromARGB(255, 48, 135, 110),
                          //               spreadRadius: 1,
                          //               blurRadius: 2,
                          //               offset: Offset(0, 1.5),
                          //             )
                          //           ],
                          //         ),
                          //         child: Image.asset(model.image6),
                          //       ),
                          //       Container(
                          //         height: height * 0.3,
                          //         padding: const EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //           color: const Color(0xff0C1324),
                          //           borderRadius: BorderRadius.circular(45),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //               color:
                          //                   Color.fromARGB(255, 48, 135, 110),
                          //               spreadRadius: 1,
                          //               blurRadius: 2,
                          //               offset: Offset(0, 1.5),
                          //             )
                          //           ],
                          //         ),
                          //         child: Image.asset(model.image7),
                          //       ),
                          //       Container(
                          //         height: height * 0.3,
                          //         padding: const EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //           color: const Color(0xff0C1324),
                          //           borderRadius: BorderRadius.circular(45),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //               color:
                          //                   Color.fromARGB(255, 48, 135, 110),
                          //               spreadRadius: 1,
                          //               blurRadius: 2,
                          //               offset: Offset(0, 1.5),
                          //             )
                          //           ],
                          //         ),
                          //         child: Image.asset(model.image8),
                          //       ),
                          //       Container(
                          //         height: height * 0.3,
                          //         padding: const EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //           color: const Color(0xff0C1324),
                          //           borderRadius: BorderRadius.circular(45),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //               color:
                          //                   Color.fromARGB(255, 48, 135, 110),
                          //               spreadRadius: 1,
                          //               blurRadius: 2,
                          //               offset: Offset(0, 1.5),
                          //             )
                          //           ],
                          //         ),
                          //         child: Image.asset(model.image9),
                          //       ),
                          //       Container(
                          //         height: height * 0.3,
                          //         padding: const EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //           color: const Color(0xff0C1324),
                          //           borderRadius: BorderRadius.circular(45),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //               color:
                          //                   Color.fromARGB(255, 48, 135, 110),
                          //               spreadRadius: 1,
                          //               blurRadius: 2,
                          //               offset: Offset(0, 1.5),
                          //             )
                          //           ],
                          //         ),
                          //         child: Image.asset(model.image10),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: height * 0.3,
                            padding: const EdgeInsets.all(20),
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
                            child: const Text("Videos Captured"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Column(
                          //   children: [
                          //     Container(
                          //       height: height * 0.3,
                          //       decoration: BoxDecoration(
                          //         color: const Color(0xff0C1324),
                          //         borderRadius: BorderRadius.circular(45),
                          //         boxShadow: const [
                          //           BoxShadow(
                          //             color: Color.fromARGB(255, 48, 135, 110),
                          //             spreadRadius: 1,
                          //             blurRadius: 2,
                          //             offset: Offset(0, 1.5),
                          //           )
                          //         ],
                          //       ),
                          //       child: FutureBuilder(
                          //         future: _initVideoPlayer1(),
                          //         builder: (context, state) {
                          //           if (state.connectionState ==
                          //               ConnectionState.waiting) {
                          //             return const Center(
                          //               child: CircularProgressIndicator(),
                          //             );
                          //           } else {
                          //             return Expanded(
                          //               flex: 1,
                          //               child: SizedBox(
                          //                 height: height * 0.2,
                          //                 child: VideoPlayer(
                          //                   _videoPlayerController1,
                          //                 ),
                          //               ),
                          //             );
                          //           }
                          //         },
                          //       ),
                          //     ),
                          //     Container(
                          //       height: height * 0.3,
                          //       decoration: BoxDecoration(
                          //         color: const Color(0xff0C1324),
                          //         borderRadius: BorderRadius.circular(45),
                          //         boxShadow: const [
                          //           BoxShadow(
                          //             color: Color.fromARGB(255, 48, 135, 110),
                          //             spreadRadius: 1,
                          //             blurRadius: 2,
                          //             offset: Offset(0, 1.5),
                          //           )
                          //         ],
                          //       ),
                          //       child: FutureBuilder(
                          //         future: _initVideoPlayer2(),
                          //         builder: (context, state) {
                          //           if (state.connectionState ==
                          //               ConnectionState.waiting) {
                          //             return const Center(
                          //                 child: CircularProgressIndicator());
                          //           } else {
                          //             return Expanded(
                          //               flex: 1,
                          //               child: SizedBox(
                          //                 height: height * 0.2,
                          //                 child: VideoPlayer(
                          //                     _videoPlayerController2),
                          //               ),
                          //             );
                          //           }
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
