// ignore_for_file: avoid_print, unused_local_variable

import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:some/constants.dart';
import 'phyprofile.dart';
import 'package:flutter/material.dart';
import 'preferences.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserInfoWidget(),
    );
  }
}

class UserinFo {
  final String name;
  late final String fnname;
  final String mnname;
  final String lnname;
  late final String ndob;
  late final String eemail;
  late final String gender;
  UserinFo(
      {required this.name,
      required this.fnname,
      required this.mnname,
      required this.lnname,
      required this.ndob,
      required this.eemail,
      required this.gender});
}

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  State<UserInfoWidget> createState() => _UserInfoWidget();
}

class _UserInfoWidget extends State<UserInfoWidget> {
  //global key
  int value = 0;
  bool positive = false;
  bool loading = false;
  late int selectedDob;
  final _preferencesService = PreferencesService();
  final signupkey = GlobalKey<FormState>();
  final uname = TextEditingController(); //controller for username
  final fname = TextEditingController(); //controller for first name
  final mname = TextEditingController(); //controller for middle name
  final lname = TextEditingController(); //controller for last name
  // final age = TextEditingController();  //controller for age
  final email = TextEditingController(); //controller for email
  final descrp = TextEditingController(); //controller for description
  final TextEditingController dob =
      TextEditingController(); //controller for dob

  String gender = 'Male';
  @override
  void initState() {
    super.initState();
    _populateFields(); //populate fields when page is initialized
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _populateFields() async {
    final settings = await _preferencesService
        .getSetting(); //variable for shared preferences
    setState(() {
      uname.text = settings.name.isEmpty
          ? settings.name
          : ""; //if no data save nothing else show the data
      fname.text = settings.fnname.isEmpty
          ? settings.fnname
          : ""; //if no data save nothing else show the data
      mname.text = settings.mnname.isEmpty
          ? settings.mnname
          : ""; //if no data save nothing else show the data
      lname.text = settings.lnname.isEmpty
          ? settings.lnname
          : ""; //if no data save nothing else show the data
      dob.text = settings.ndob.isEmpty
          ? settings.ndob
          : ""; //if no data save nothing else show the data
      email.text = settings.eemail.isEmpty
          ? settings.eemail
          : ""; //if no data save nothing else show the data
      gender = settings.gender.isEmpty
          ? settings.gender
          : "Male"; //if no data save nothing else show the data
    });
  }

  @override
  Widget build(BuildContext context) {
    // ThemeData theme = Theme.of(context);
    // var gendertext = "Male";
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'User Information Form',
          style: TextStyle(
            color: Color(0xff50e0b5),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            // width: 800,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: signupkey,
              child: ListView(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                children: [
                  //first name textform field
                  Container(
                    padding: const EdgeInsets.only(
                      //padding for all directions
                      left: 30,
                      top: 20,
                      right: 50,
                      bottom: 5,
                    ),
                    child: Container(
                      height: 50, //fixed height for the container
                      padding: const EdgeInsets.only(
                        left: 20, //padding for the text form field
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
                        cursorColor: const Color(0xff50e0b5),
                        controller: fname,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "First Name",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'FirstName required'; //empty error message
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  //Middle name field
                  Container(
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 20,
                      right: 50,
                      bottom: 5,
                    ),
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
                        //no empty value warning for middle name cuz some dont have this
                        cursorColor: const Color(0xff50e0b5),
                        controller: mname,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Middle Name",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 20,
                      right: 50,
                      bottom: 5,
                    ),
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
                        cursorColor: const Color(0xff50e0b5),
                        controller: lname,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Last Name",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            // ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                            return 'LastName required'; //error message for empty field
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 20,
                      right: 50,
                      bottom: 5,
                    ),
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
                        cursorColor: const Color(0xff50e0b5),
                        controller: uname,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "UserName",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                        validator: (String? value) {
                          if (value != null && value.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                            //regex for username with only letters
                            return 'Username is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 20,
                      right: 50,
                      bottom: 5,
                    ),
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
                        cursorColor: const Color(0xff50e0b5),
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "E-mail",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                        validator: (String? value) {
                          if (value != null && value.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}') //regex of email address
                                  .hasMatch(value!)) {
                            return 'Enter correct email';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  //date-time picker for DOB
                  Container(
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 20,
                      right: 50,
                      bottom: 5,
                    ),
                    child: Container(
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
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: dob, //..text="1993-08-09",
                        textInputAction: TextInputAction.next,
                        cursorColor: const Color(0xff4FB7BA),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              //only when clicked opens the date picker
                              context: context,
                              initialDate: DateTime(1990), //starting date
                              firstDate: DateTime(
                                  1900), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: Color(0xff4FB7BA),
                                      onPrimary: Color(0xff090F18),
                                      onSurface: Color(0xff4ACEA9),
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            const Color(0xff4ACEA9),
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              });

                          if (pickedDate != null) {
                            // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            selectedDob = int.parse(
                              DateFormat('yyyyMMdd').format(pickedDate),
                            );
                            // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement
                            setState(() {
                              dob.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          }
                        },
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'DOB is required';
                          } else {
                            return null;
                          }
                        },

                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "D O B",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: Color(0xff4ACEA9),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 10,
                      right: 50,
                    ),
                    child: const Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        // color: Color(0xff50e0b5),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 10,
                      right: 50,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: AnimatedToggleSwitch<int>.size(
                            current: value,
                            innerColor: Colors.transparent,
                            values: const [
                              0,
                              1,
                              2
                            ], //values of index in the toggle switch
                            iconOpacity: 0.5,
                            dif: 80,
                            borderColor: Colors.transparent,
                            selectedIconOpacity: 1,
                            iconBuilder: (value, size) {
                              //builds icon according to the index value
                              IconData data = Icons.male;
                              Color color = const Color(0xff50e0b5);
                              if (value == 0) {
                                data = Icons.male;
                                color = const Color(0xff50e0b5);
                              }
                              if (value == 1) {
                                data = Icons.female;
                                color = const Color(0xff50e0b5);
                              }
                              if (value == 2) {
                                data = Icons.transgender;
                                color = const Color(0xff50e0b5);
                              }
                              return Icon(
                                data,
                                semanticLabel: "Male",
                                color: color,
                                size: min(size.width, size.height),
                              );
                            },
                            colorBuilder: (i) {
                              if (i == 0) return Colors.transparent;
                              if (i == 1) return Colors.transparent;
                              if (i == 2) return Colors.transparent;
                            },
                            onTap: () {},
                            onChanged: (i) async {
                              setState(() {
                                value = i;
                              });

                              if (i == 0) return gender = 'Male';
                              if (i == 1) return gender = 'Female';
                              if (i == 2) return gender = 'Others';
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            gender == null ? "Male" : gender,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff50e0b5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
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
                    onPressed: () {
                      // print(gender);
                      String unam = uname.text;
                      String fnam = fname.text; //
                      String mnam = mname.text;
                      String lnam = lname.text;
                      String ag = dob.text;
                      String emai = email.text;
                      String gend = gender;

                      if (signupkey.currentState!.validate()) {
                        saveSetting(); //save settings to shared preferences
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Phyprof(); //navigates to the next page
                            },
                          ),
                        );
                      }
                    },
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveSetting() {
    //to save userinfo into shared preferences
    final userinfo = UserinFo(
      name: uname.text,
      fnname: fname.text,
      mnname: mname.text,
      lnname: lname.text,
      ndob: dob.text,
      eemail: email.text,
      gender: gender,
    );

    print(userinfo);
    _preferencesService.saveSettings(userinfo);
  }
}
