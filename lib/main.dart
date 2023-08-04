import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:some/constants.dart';
import 'package:some/new/login.dart';


void main() {
  print("inside main");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => Login(),
      //   "/userinfo": (context) => UserInfo(),
      //   "/phyinfo": (context) => Phyprof(),
      //   "/foot": (context) => Foot(),
      //   "/summary": (context) => Summary(),
      // },
      theme: ThemeData(
        //theme data of the whole app
        // primaryTextTheme: TextTheme(),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),

        primaryColor: Colors.grey,
        scaffoldBackgroundColor: const Color(0xff0C1324),
        textTheme: TextTheme(
          subtitle1: GoogleFonts.nunito(
            color: xeuronGreen,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: xeuronBlack,
          foregroundColor: xeuronGreen,
          elevation: 0,
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          buttonColor: Colors.purpleAccent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(
              const Color(0xff0C1324),
            ),
          ),
        ),
      ),
      home: const Login(), //navigate to the login screen
    );
  }
}
