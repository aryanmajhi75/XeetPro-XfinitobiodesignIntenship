// ignore_for_file: camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:some/constants.dart';
import 'package:some/new/foot.dart';
import 'package:some/userid.dart';
import 'preferences.dart';
import 'userinfo.dart';
import 'dart:math';

//unique id of each user
int? uniqueId;

class Phyprof extends StatelessWidget {
  const Phyprof({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PhyprofWidget(),
    );
  }
}

class phyprof {
  //class to store physical info
  final String heig;
  final String hunit;
  final String weig;
  final String wunit;
  final String prec;
  final String phya;
  final String desc;
  phyprof(
      {required this.heig,
      required this.hunit,
      required this.weig,
      required this.wunit,
      required this.prec,
      required this.phya,
      required this.desc});
}

class PhyprofWidget extends StatefulWidget {
  const PhyprofWidget({Key? key}) : super(key: key);
  @override
  State<PhyprofWidget> createState() => _PhyprofWidget();
}

class _PhyprofWidget extends State<PhyprofWidget> {
  final _preferencesService = PreferencesService(); //calling shared preferences
  final uinfokey = GlobalKey<FormState>();

  final heigh = TextEditingController(); //text controller for height
  final weigh = TextEditingController(); //text controller for weight
  final precon = TextEditingController(); //text controller for pre condition
  final phyact =
      TextEditingController(); //text controller for physical activities
  final descr = TextEditingController(); //text controller for description

  //for dropdown units in height and weight
  String hunit = "cm";
  String wunit = "kg";

  @override
  void initState() {
    super.initState();
    uniqueId = getId();

    _phyFields(); //filling the fields with shared preferences
  }

  void _phyFields() async {
    final phyp = await _preferencesService.getphyinfo(); //object for phyinfo
    setState(() {
      heigh.text = phyp.heig.isEmpty
          ? phyp.heig.toString()
          : ""; //if no data then dont show anything orelse show height
      hunit = phyp
          .hunit; //if no data then dont show anything orelse show height unit
      weigh.text = phyp.weig.isEmpty
          ? phyp.weig.toString()
          : ""; //if no data then dont show anything orelse show weight
      wunit = phyp
          .wunit; //if no data then dont show anything orelse show weight unit
      precon.text = phyp.prec.isEmpty
          ? phyp.prec
          : ""; //if no data then dont show anything orelse show precondition
      phyact.text = phyp.phya.isEmpty
          ? phyp.phya
          : ""; //if no data then dont show anything orelse show physical activities
      descr.text = phyp.desc.isEmpty
          ? phyp.desc
          : ""; //if no data then dont show anything orelse show description
    });
  }

  var rng = Random();
  @override
  Widget build(BuildContext context) {
    const maxline = 5;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Physical Information Form',
          style: TextStyle(
            color: Color(0xff50e0b5),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 800,
            child: Form(
              key: uinfokey,
              child: ListView(
                children: [
                  // Container(
                  //   padding: const EdgeInsets.only(
                  //     top: 30,
                  //     left: 30,
                  //   ),
                  //   child: const Text(
                  //     'Physical Information Form',
                  //     style: TextStyle(
                  //       color: Color(0xff50e0b5),
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 25,
                  //     ),
                  //   ),
                  // ),
                  //user id of the client
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 50, 5),
                    child: Text(
                      'User ID: $uniqueId', //unique id given to a user when data is entered
                      style: const TextStyle(
                        color: Color(0xff50e0b5),
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 50, 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff0C1324),
                              borderRadius: BorderRadius.circular(45),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 48, 135, 110),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 1.5),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              cursorColor: const Color(0xff50e0b5),
                              controller: heigh,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Height",
                                hintStyle: TextStyle(
                                  color: Colors.white30,
                                ),
                              ),
                              validator: (String? value) {
                                if (value != null && value.isEmpty ||
                                    !RegExp(r'[0-2]+[0-9]+[0-9]') //when it matches with first digit 0-2, second digit 0-9, and third 0-9
                                        .hasMatch(value!)) {
                                  return 'Height is required'; //empty field message
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String?>(
                              focusColor: const Color(0xff707070),
                              dropdownColor: const Color(0xff131728),
                              elevation: 0,
                              value: hunit,
                              // style: TextStyle(),
                              items:
                                  <String>['cm', 'in', 'm'].map((String value) {
                                //mapping list to dropdown item list
                                return DropdownMenuItem<String>(
                                  // alignment: Alignment.center,
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) async {
                                hunit = value!;
                                setState(() {
                                  hunit =
                                      value; //chnage the varia value with recent one
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 50, 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            alignment: Alignment.center,
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
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              cursorColor: const Color(0xff50e0b5),
                              controller: weigh,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Weight",
                                hintStyle: TextStyle(
                                  color: Colors.white30,
                                ),
                              ),
                              validator: (String? value) {
                                if (value != null && value.isEmpty) {
                                  return 'Weight is required'; //empty error message
                                }
                                // if (!RegExp("^(([1][0-9]+.+[0-9]){2,4})").hasMatch(value!)) {
                                //   return "Weight is not a valid";
                                // }
                                else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String?>(
                              dropdownColor: const Color(0xff131728),
                              elevation: 0,
                              value: wunit,
                              items:
                                  <String>['kg', 'g', 'lb'].map((String value) {
                                //mapping the list with dropdown item list
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) async {
                                wunit = value!;
                                setState(() {
                                  wunit =
                                      value; //change the value of variable with recent value
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 50, 5),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      alignment: Alignment.center,
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
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: precon,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Pre-existing Conditions",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 50, 5),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      alignment: Alignment.center,
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
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: phyact,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Physical Activities",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 50, 5),
                    height: maxline * 40.0,
                    width: 750,
                    child: Column(
                      children: <Widget>[
                        Container(
                          // height: 50,
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          alignment: Alignment.center,
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
                          child: TextFormField(
                            maxLines: maxline,
                            textCapitalization: TextCapitalization.words,
                            controller: descr,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Description",
                              hintStyle: TextStyle(
                                color: Colors.white30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                                return const UserInfo(); //navigates to prev page
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
                          if (uinfokey.currentState!.validate()) {
                            savephyinfo();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Foot(); //navigates to the next page
                                  // return const CameraApp1();
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
                  const SizedBox(
                    //sized box for space at the bottom
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void savephyinfo() {
    //to save phyinfo into shared preferences
    final phyinfo = phyprof(
      heig: heigh.text,
      hunit: hunit,
      weig: weigh.text,
      wunit: wunit,
      prec: precon.text,
      phya: phyact.text,
      desc: descr.text,
    );

    print(phyinfo);
    _preferencesService.savephyinfo(phyinfo);
  }
}
