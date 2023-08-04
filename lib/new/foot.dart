import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:some/constants.dart';
import 'package:some/new/phyprofile.dart';
import 'package:some/new/widgets/camVideo.dart';
import 'package:some/new/widgets/footgrid.dart';
import 'package:path/path.dart' as p;

class Foot extends StatefulWidget {
  const Foot({
    super.key,
  });

  @override
  FootState createState() => FootState();
}

class FootState extends State<Foot> {
  int nullInd = 0;

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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Footgrid(
              //calls foot grid widget with name as left foot
              name: "Left Foot",
            ),
            const Footgrid(
              //calls foot grid widget with name as right foot
              name: "Right Foot",
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    for (int i = 0; i < 10; ++i) {
                      imageList[i] = "";
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Phyprof(); //navigates to prev page
                        },
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: width * 0.4,
                    height: height * 0.08,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/images/button_background.png",
                        ),
                      ),
                    ),
                    child: Text(
                      'Back',
                      style: GoogleFonts.nunito(
                        color: xeuronGreen,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // String path1 = p.dirname(imageList[0].path);
                    // String path2 = imageList[0].path;
                    // String path3 = imageList[0].path.toString();
                    // print("Path 1: $path1 : ${path1.runtimeType}");
                    // print("Path 2: $path2 : ${path2.runtimeType}");
                    // print("Path 3: $path3 : ${path3.runtimeType}");
                    if (checkNull(10) == true) {
                      const message = SnackBar(
                        content: Text("Please take all the images"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(message);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CamVideo(
                              name: "Front",
                            ); //navigates to next page
                          },
                        ),
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: width * 0.4,
                    height: height * 0.08,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/images/button_background.png",
                        ),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.nunito(
                        color: xeuronGreen,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
