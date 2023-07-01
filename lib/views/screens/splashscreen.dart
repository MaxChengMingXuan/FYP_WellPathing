//async: library for timer
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wellpathing/models/result.dart';
import 'package:wellpathing/views/shared/tab.dart';
import 'activityscreen.dart';
import '../../../../models/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double screenHeight, screenWidth, resWidth;

  @override
  void initState() {
    super.initState();
    User user = User(
        id: "0",
        email: "Guest",
        name: "Guest",
        matric: "0",
        staffid: "0",
        school: "na",
        programme: "na",
        department: "na",
        regdate: "0",
        role: 'Guest');

    // Result result = Result(
    //   resultid: "0",
    // id: "0",

    // sskmscore: "0",
    // sskmlevel: "na",
    // sskmsentiasa: "na",
    // resultdate: "0");

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => MainScreen(user: user))));
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.75;
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(135, 37, 37, 37), BlendMode.darken),
                      image: AssetImage('assets/images/star night.png'),
                      fit: BoxFit.cover))),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                      SizedBox(
                        width: screenWidth / 2,
                        child: Center(
                          child: Text(
                            "WellPathing",
                            style: TextStyle(
                                fontSize: screenWidth * 0.07,
                                // fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                    width: 70,
                    child: CircularProgressIndicator(
                        strokeWidth: 7,
                        color: Color.fromARGB(255, 226, 239, 240)),
                  ),
                  SizedBox(
                    width: screenWidth / 0.8,
                    child: Center(
                      child: Text(
                        "Believe in yourself and all that you are.",
                        style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
