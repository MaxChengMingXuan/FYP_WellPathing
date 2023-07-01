import 'package:flutter/material.dart';

import '../../../../models/user.dart';
import '../../models/Palette.dart';

import 'chartscreen.dart';
import 'datascreen.dart';
import 'gamescreen.dart';
import 'resultscreen.dart';
import 'summaryscreen.dart';
import 'testscreen.dart';

class ActivityScreen extends StatefulWidget {
  final User user;

  const ActivityScreen({super.key, required this.user});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late double screenHeight, screenWidth, resWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.75;
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Activity",
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.2,
                        height: screenWidth * 0.2,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.05,
                      ),
                      Text(
                        "WellPathing",
                        style: TextStyle(fontSize: screenWidth * 0.05),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: screenWidth * 0.95,
                  height: screenWidth * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TestScreen(user: widget.user)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/images/test_button.jpg"),
                    ),
                  ),
                ),
                // SizedBox(height: screenHeight * 0.02),
                Container(
                  width: screenWidth * 0.95,
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.00),
                        child: SizedBox(
                          width: screenWidth * 0.4,
                          height: screenWidth * 0.4,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SummaryScreen(user: widget.user)));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    "assets/images/SummaryButton_Compressed.jpg"),
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.00),
                        child: SizedBox(
                          width: screenWidth * 0.5,
                          height: screenWidth * 0.5,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GameScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                  "assets/images/TherapyButton_Compressed.jpg"),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.00),
                        child: SizedBox(
                          width: screenWidth * 0.5,
                          height: screenWidth * 0.5,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChartScreen(user: widget.user)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/images/repre_c.jpg"),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.00),
                        child: SizedBox(
                          width: screenWidth * 0.4,
                          height: screenWidth * 0.4,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DataScreen(user: widget.user)));
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ResultScreen(
                                //             user: widget.user,
                                //             )));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                    Image.asset("assets/images/data_comp.jpg"),
                              )),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(screenWidth * 0.05),
                      //   child: SizedBox(
                      //     width: screenWidth * 0.4,
                      //     height: screenWidth * 0.4,
                      //     child: ElevatedButton(
                      //       onPressed: () {},
                      //       child: Text('Button 1'),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(screenWidth * 0.05),
                      //   child: SizedBox(
                      //     width: screenWidth * 0.4,
                      //     height: screenWidth * 0.4,
                      //     child: ElevatedButton(
                      //       onPressed: () {},
                      //       child: Text('Button 1'),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     color: Colors.yellow,
                      //     child: Center(child: Text('Item 4')),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
