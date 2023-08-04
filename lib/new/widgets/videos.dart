import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:some/constants.dart';
import 'package:some/new/foot.dart';
import 'package:some/new/summary.dart';
import 'package:some/new/widgets/videogrid.dart';

class FootVideo extends StatefulWidget {
  const FootVideo({super.key});

  @override
  State<FootVideo> createState() => _FootVideoState();
}

class _FootVideoState extends State<FootVideo> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Videogrid(
              name: "Left Foot",
            ),
            const Videogrid(
              name: "Right Foot",
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Foot();
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Summary();
                          // return const CameraApp1();
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
                      'Next',
                      style: GoogleFonts.nunito(
                        color: xeuronGreen,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
