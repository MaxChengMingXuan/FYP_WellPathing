import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/user.dart';
import '../shared/tab.dart';
import 'activityscreen.dart';
import 'loginscreen.dart';

import 'registrationscreen.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late double screenHeight, screenWidth, resWidth;
  @override
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
          title: const Text("Profile"),
          automaticallyImplyLeading: false,
        ),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                // height: screenHeight * 0.25,
                child: Row(
                  children: [
                    Center(
                      child: SizedBox(),
                    ),
                    Flexible(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(widget.user.name.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: Divider(
                                color: Colors.blueGrey,
                                height: 2,
                                thickness: 2.0,
                              ),
                            ),
                            Table(
                              columnWidths: const {
                                0: FractionColumnWidth(0.5),
                                1: FractionColumnWidth(0.5)
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  const Icon(Icons.email),
                                  Text(widget.user.email.toString()),
                                ]),
                                TableRow(children: [
                                  const Icon(Icons.assignment),
                                  Text(widget.user.role.toString()),
                                ]),
                                // TableRow(children: [
                                //   const Icon(Icons.credit_score),
                                //   Text(widget.user.credit.toString()),
                                // ]),
                                // widget.user.regdate.toString() == ""
                                //     ? TableRow(children: [
                                //         const Icon(Icons.date_range),
                                //         Text(df.format(DateTime.parse(
                                //             widget.user.regdate.toString())))
                                //       ])
                                //     : TableRow(children: [
                                //         const Icon(Icons.date_range),
                                //         Text(df.format(DateTime.now()))
                                //       ]),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              )),
          Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.05,
                          child: Card(
                            color: Color.fromARGB(217, 7, 49, 72),
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                color: Color.fromARGB(255, 234, 231, 231)
                                    .withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "PROFILE SETTINGS",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  // backgroundColor: Colors.yellow // Add this line
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          // Card(
                          //   color: Color.fromARGB(217, 255, 255, 255),
                          //   child: Center(
                          //     child: Text(
                          //       "PROFILE SETTINGS",
                          //       style: TextStyle(
                          //         fontSize: screenWidth * 0.05,
                          //         // fontWeight: FontWeight.bold,
                          //         // backgroundColor: Colors.yellow // Add this line
                          //       ),
                          //       textAlign: TextAlign.center,
                          //     ),
                          //   ),
                          // ),
                        ),
                        Expanded(
                            child: ListView(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                shrinkWrap: true,
                                children: [
                              // MaterialButton(
                              //   onPressed: isDisable ? null : _updateNameDialog,
                              //   child: const Text("UPDATE NAME"),
                              // ),
                              // const Divider(
                              //   height: 2,
                              // ),
                              // MaterialButton(
                              //   onPressed: isDisable ? null : _updatePhoneDialog,
                              //   child: const Text("UPDATE PHONE"),
                              // ),
                              // MaterialButton(
                              //   onPressed: isDisable ? null : _changePassDialog,
                              //   child: const Text("UPDATE PASSWORD"),
                              // ),
                              // const Divider(
                              //   height: 2,
                              // ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen(user: widget.user)));
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromARGB(232, 247, 222, 213)),
                                ),
                              ),

                              const Divider(
                                height: 2,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegistrationScreen(
                                                  user: widget.user)));
                                },
                                child: Text(
                                  'Registration',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromARGB(232, 247, 222, 213)),
                                ),
                              ),
                              const Divider(
                                height: 2,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _logoutDialog();
                                },
                                child: Text(
                                  'LogOut',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromARGB(232, 238, 122, 122)),
                                ),
                              ),

                              // MaterialButton(
                              //   onPressed: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 LoginScreen(user: widget.user)));
                              //   },
                              //   child: const Text("LOGIN"),
                              // ),
                              // const Divider(
                              //   height: 2,
                              // ),
                              // MaterialButton(
                              //   onPressed: isDisable ? null : buyCreditPage,
                              //   child: const Text("BUY CREDIT"),
                              // ),
                              // const Divider(
                              //   height: 2,
                              // ),
                              // MaterialButton(
                              //   onPressed: isDisable ? null : _logoutDialog,
                              //   child: const Text("LOGOUT"),
                              // ),
                            ])),
                      ],
                    ),
                  ),
                ),
              )),
        ]),
      ),
    );
  }

  void _logoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Logout?",
            style: TextStyle(),
          ),
          content: const Text("Are your sure?"),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('email', '');
                await prefs.setString('pass', '');
                await prefs.setBool('remember', false);
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
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (content) => MainScreen(user: user)));
              },
            ),
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
