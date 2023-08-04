// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:some/constants.dart';
import 'userinfo.dart';

// void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Loginwidget(),
    );

    //,);
  }
}

class Loginwidget extends StatefulWidget {
  const Loginwidget({Key? key}) : super(key: key);

  @override
  State<Loginwidget> createState() => _Loginwidget();
}

class Loginform {
  String uname = ''; //initial value
  String pass = ''; //initial value
  Loginform(this.uname, this.pass);
}

class _Loginwidget extends State<Loginwidget> {
  // static Authentication authorizer = Authentication();

  //bool value to show password
  bool _passwordVisible = true;

  TextEditingController unnamec =
      TextEditingController(); //controller for username
  TextEditingController passc =
      TextEditingController(); //controller for password

  final loginkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: SizedBox(
            width: 500,
            child: Form(
              key: loginkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.black,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Login to the ",
                          style: TextStyle(
                            color: Color(0xff707070),
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              'XEET PRO App',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.purpleAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            Text(
                              " !",
                              style: TextStyle(
                                color: Color(0xff707070),
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: unnamec, //controller for username
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707070),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff50e0b5),
                            width: 2.0,
                          ),
                          // borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Employee ID',
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value != "aryan3002") {
                          return "Enter Employee ID"; //empty error message
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.all(20), //fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      obscureText: _passwordVisible,
                      controller: passc, //controller for password
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: xeuronGreen,
                          focusColor: xeuronGreen,
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707070),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff50e0b5),
                            width: 2.0,
                          ),
                          // borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      //errorText: validatepass(passc.text),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value != "aryan123") {
                          return "Enter Password"; //empty error message
                        }
                        return null;
                      },
                    ),
                    // ElevatedButton(
                    //   child: Icon(_passwordVisible
                    //       ? Icons.visibility_off
                    //       : Icons.visibility),
                    //   onPressed: () {
                    //     setState(() {
                    //       _passwordVisible = !_passwordVisible;
                    //     });
                    //   },
                    // )
                  ),

                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       //button to change password
                  //     },
                  //     child: const Text(
                  //       'Forgot Password?',
                  //       textAlign: TextAlign.right,
                  //       style: TextStyle(
                  //         color: Color(0xff50e0b5),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      if (loginkey.currentState!.validate() &&
                          unnamec.text == 'aryan3002' &&
                          passc.text == 'aryan123') {
                        //if the data matches then login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const UserInfo(); //navigates to the next page
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
                        "Login",
                        style: GoogleFonts.nunito(
                          color: xeuronGreen,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.all(20),
                  //   child: Row(
                  //     children: [
                  //       const Text(
                  //         "Don't have an account?",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       TextButton(
                  //         onPressed: () {},
                  //         child: const Text(
                  //           'Sign Up',
                  //           textAlign: TextAlign.right,
                  //           style: TextStyle(
                  //             color: Color(0xff50e0b5),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
/*
  Future<void> _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      log('Successfully configured');
    } on Exception catch (e) {
      log('An error occurred configuring Amplify: $e');
    }
  }*/
}
