// ignore_for_file: must_be_immutable, unnecessary_this, avoid_print
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:some/constants.dart';
import 'package:some/new/phyprofile.dart';
import 'package:some/new/preferences.dart';
import 'package:some/new/showSummary.dart';
import 'package:some/new/userinfo.dart';
import 'package:some/new/widgets/camVideo.dart';
import 'package:some/new/widgets/footgrid.dart';
import 'package:some/new/widgets/showImageSummary.dart';
import 'package:some/new/widgets/videos.dart';
import 'package:some/sqflite/dbhelper.dart';

import '../sqflite/model.dart';

class Summary extends StatelessWidget {
  //String funame, age, email, gender, height, weight, preco, phyact, descr;

  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SummaryWidget(),
    );
  }
}

class SummaryWidget extends StatefulWidget {
  const SummaryWidget({Key? key}) : super(key: key);
  @override
  State<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  //DB manager variable
  final DbManager dbManager = DbManager();

  //initial values for all the fields
  String username = '',
      firstname = '',
      middlename = '',
      lastname = '',
      age = '',
      email = '',
      gender = '',
      precondition = '',
      physicalactivity = '',
      description = '',
      hunit = '',
      wunit = '';

  //initialize height and weight to 0
  int uheight = 0, uweight = 0;

  //Store paths in strings to store in sqflite
  String path1 = imageList[0];
  String path2 = imageList[1];
  String path3 = imageList[2];
  String path4 = imageList[3];
  String path5 = imageList[4];
  String path6 = imageList[5];
  String path7 = imageList[6];
  String path8 = imageList[7];
  String path9 = imageList[8];
  String path10 = imageList[9];

  get value => null;

  @override
  void initState() {
    final usr = PreferencesService(); //variable for shared preference
    //get shared pref data
    usr.getSetting().then(update);
    usr.getphyinfo().then(haha);
    super.initState();
  }

  //function to save data in sqflite
  void saveData2sqflite() {
    Model model = Model(
      //variable of model class
      userid: uniqueId,
      height: uheight,
      weight: uweight,
      username: username,
      fname: firstname,
      mname: middlename,
      lname: lastname,
      desc: description,
      email: email,
      dob: age,
      gender: gender,
      hunit: hunit,
      phyact: physicalactivity,
      precon: precondition,
      wunit: wunit,
      image1: path1,
      image2: path2,
      image3: path3,
      image4: path4,
      image5: path5,
      image6: path6,
      image7: path7,
      image8: path8,
      image9: path9,
      image10: path10,
      vid1: front,
      vid2: around,
    );
    print("Inside saveData2sqflite : $uniqueId");
    print(imageList[0]);
    print(imageList[0].toString());
    dbManager.insertModel(model); //function to insert data into table
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Summary",
          style: TextStyle(
            color: Color(0xff50e0b5),
            fontSize: 22,
          ),
        ),
        centerTitle: true, //title will be in center
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 50, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Full Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "$firstname $middlename $lastname",
                          style: const TextStyle(
                            fontSize: 20,
                            color: xeuronGreen,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 50, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'E-mail',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          email,
                          style: const TextStyle(
                            fontSize: 20,
                            color: xeuronGreen,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //row to accomodate height, weight
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'D O B',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            age,
                            style: const TextStyle(
                              fontSize: 20,
                              color: xeuronGreen,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Height', //${phypr.heig}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                uheight.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: xeuronGreen,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                hunit,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Weight', //${phypr.weig}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                uweight.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: xeuronGreen,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                wunit,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 50, 0),
                child: Column(
                  children: [
                    const Text(
                      'Gender',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          gender,
                          style: const TextStyle(
                            fontSize: 20,
                            color: xeuronGreen,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 50, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pre-existing condition', //${phypr.prec}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
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
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          precondition.isEmpty ? precondition : "None",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 50, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Physical Activities', //${phypr.phya}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
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
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          physicalactivity.isEmpty ? physicalactivity : "None",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 50, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description', //${phypr.desc}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
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
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          description.isEmpty ? description : "None",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Foot Images', //${phypr.desc}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const showImageSummary(),
                    const Text(
                      'Videos', //${phypr.desc}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const FootVideo();
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
                            saveData2sqflite();
                            print("submit btn pressed");
                            return showSummary();
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
                        'Submit',
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
      ),
    );
  }

  void update(UserinFo value) {
    setState(() {
      this.username = value.name;
      this.firstname = value.fnname;
      this.middlename = value.mnname.isEmpty ? value.mnname : " ";
      this.lastname = value.lnname;
      this.age = value.ndob;
      this.email = value.eemail;
      this.gender = value.gender;
    });
  }

  void haha(phyprof value) {
    setState(() {
      this.uheight = int.parse(value.heig);
      this.uweight = int.parse(value.weig);
      this.hunit = value.hunit;
      this.wunit = value.wunit;
      this.precondition = value.prec ?? " ";
      this.physicalactivity = value.phya ?? " ";
      this.description = value.desc ?? " ";
    });
  }
}
