import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/user.dart';
import '../../models/result.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../serverconfig.dart';

class SummaryScreen extends StatefulWidget {
  final User user;
  const SummaryScreen({super.key, required this.user});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  List<Result> resultList = <Result>[];
  String titlecenter = "Loading...";
  // ignore: prefer_typing_uninitialized_variables
  // var placemarks;

  final df = DateFormat('dd/MM/yyyy hh:mm a');
  late double screenHeight, screenWidth, resWidth;
  int rowcount = 2;

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  @override
  void dispose() {
    resultList = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
      rowcount = 1;
    } else {
      resWidth = screenWidth * 0.75;
      rowcount = 1;
    }
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          appBar: AppBar(
              title: const Text("My Summary"),
              centerTitle: true,
              actions: [
                // PopupMenuButton(
                //     // add icon, by default "3 dot" icon
                //     // icon: Icon(Icons.book)
                //     itemBuilder: (context) {
                //   return [
                //     const PopupMenuItem<int>(
                //       value: 0,
                //       child: Text("New Test"),
                //     ),
                //     const PopupMenuItem<int>(
                //       value: 1,
                //       child: Text("My Order"),
                //     ),
                //   ];
                // }, onSelected: (value) {
                //   if (value == 0) {
                //     // _gotoNewProduct();
                //   } else if (value == 1) {
                //   } else if (value == 2) {}
                // }),
              ]),
          body: resultList.isEmpty
              ? Center(
                  child: Text(titlecenter,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)))
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Text(
                        "Your total SSKM test results (${resultList.length} found)",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Number
                          ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: Container(
                              width: screenWidth * 0.1,
                              color: const Color.fromARGB(255, 240, 223, 206),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    "No.",
                                    style: TextStyle(
                                      fontSize: screenWidth / 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: Container(
                              width: screenWidth * 0.45,
                              color: Color.fromARGB(255, 240, 223, 206),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    "Time",
                                    style: TextStyle(
                                      fontSize: screenWidth / 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: Container(
                              width: screenWidth * 0.15,
                              color: Color.fromARGB(255, 240, 223, 206),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    "Score",
                                    style: TextStyle(
                                      fontSize: screenWidth / 26,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: Container(
                              width: screenWidth * 0.21,
                              color: Color.fromARGB(255, 240, 223, 206),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    "Status",
                                    style: TextStyle(
                                      fontSize: screenWidth / 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Text(
                          //   truncateString(
                          //       resultList[index]
                          //           .resultdate
                          //           .toString(),
                          //       16),
                          //   style: TextStyle(
                          //       fontSize: screenWidth / 24,
                          //       fontWeight: FontWeight.bold),
                          // ),
                        ],
                      ),
                    )),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: rowcount,
                        childAspectRatio: 6,
                        children: List.generate(resultList.length, (index) {
                          return Card(
                            elevation: 8,
                            child: InkWell(
                              onTap: () {
                                // _showDetails(index);
                                _deleteDialog(index);
                              },
                              onLongPress: () {},
                              child: Column(children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Flexible(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //Number
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            child: Container(
                                              width: screenWidth * 0.1,
                                              color: Color.fromARGB(
                                                  255, 213, 241, 237),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Center(
                                                  child: Text(
                                                    (index + 1).toString(),
                                                    style: TextStyle(
                                                      fontSize:
                                                          screenWidth / 24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            child: Container(
                                              width: screenWidth * 0.45,
                                              color: const Color.fromARGB(
                                                  255, 214, 232, 242),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Center(
                                                  child: Text(
                                                    df.format(DateTime.parse(
                                                        resultList[index]
                                                            .resultdate
                                                            .toString())),
                                                    style: TextStyle(
                                                      fontSize:
                                                          screenWidth / 24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            child: Container(
                                              width: screenWidth * 0.12,
                                              color: Color.fromARGB(
                                                  255, 243, 237, 211),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Center(
                                                  child: Text(
                                                    "  ${resultList[index].sskmscore}  ",
                                                    style: TextStyle(
                                                      fontSize:
                                                          screenWidth / 24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            child: Container(
                                              width: screenWidth * 0.21,
                                              color: Color.fromARGB(
                                                  255, 240, 244, 194),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Center(
                                                  child: Text(
                                                    "  ${resultList[index].sskmlevel}  ",
                                                    style: TextStyle(
                                                      fontSize:
                                                          screenWidth / 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Text(
                                          //   truncateString(
                                          //       resultList[index]
                                          //           .resultdate
                                          //           .toString(),
                                          //       16),
                                          //   style: TextStyle(
                                          //       fontSize: screenWidth / 24,
                                          //       fontWeight: FontWeight.bold),
                                          // ),
                                        ],
                                      ),
                                    ))
                              ]),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
        ));
  }

  String truncateString(String str, int size) {
    if (str.length > size) {
      str = str.substring(0, size);
      return "$str";
    } else {
      return str;
    }
  }

  void _loadResults() {
    if (widget.user.id == "0") {
      //check if the user is registered or not
      Fluttertoast.showToast(
          msg: "Register to save your test results.", //Show toast
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
      titlecenter = "Please register an account";
      setState(() {});
      return; //exit method if true
    }
    //if registered user, continue get request
    http
        .get(
      Uri.parse(
          "${ServerConfig.SERVER}/php/loaduserresults.php?userid=${widget.user.id}"),
    )
        .then((response) {
      // wait for response from the request
      if (response.statusCode == 200) {
        print(widget.user.id);
        //if statuscode OK
        var jsondata =
            jsonDecode(response.body); //decode response body to jsondata array
        if (jsondata['status'] == 'success') {
          //check if status data array is success
          var extractdata = jsondata['data']; //extract data from jsondata array
          if (extractdata['results'] != null) {
            //check if  array object is not null
            resultList = <Result>[]; //complete the array object definition
            extractdata['results'].forEach((v) {
              //traverse results array list and add to the list object array resultList
              resultList.add(Result.fromJson(
                  v)); //add each result array to the list object array resultList
            });
            titlecenter = "Found";
          } else {
            titlecenter =
                "No result Available"; //if no data returned show title center
            resultList.clear();
          }
        } else {
          titlecenter = "No result Available";
        }
      } else {
        titlecenter = "No result Available"; //status code other than 200
        resultList.clear(); //clear resultList array
      }
      setState(() {}); //refresh UI
    });
  }

  _deleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Text(
            "Delete record ${index + 1}",
            style: const TextStyle(),
          ),
          content: const Text("Are you sure?", style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                _deleteResult(index);
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

  void _deleteResult(index) {
    try {
      http.post(Uri.parse("${ServerConfig.SERVER}/php/delete_result.php"),
          body: {
            "resultid": resultList[index].resultid,
          }).then((response) {
        var data = jsonDecode(response.body);
        if (response.statusCode == 200 && data['status'] == "success") {
          Fluttertoast.showToast(
              msg: "Success",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 14.0);
          _loadResults();
          return;
        } else {
          Fluttertoast.showToast(
              msg: "Failed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 14.0);
          return;
        }
      });
      // ignore: empty_catches
    } catch (e) {}
  }
}
