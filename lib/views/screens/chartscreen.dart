import 'dart:convert';
import 'dart:ffi';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../models/user.dart';
import '../../models/result.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../serverconfig.dart';

class ChartScreen extends StatefulWidget {
  final User user;
  const ChartScreen({super.key, required this.user});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<Result> resultList = <Result>[];
  String titlecenter = "Loading...";
  // ignore: prefer_typing_uninitialized_variables
  // var placemarks;

  final df = DateFormat('dd/MM/yyyy hh:mm a');
  late double screenHeight, screenWidth, resWidth;
  bool isStaff = false;
  bool isStudent = true;
  int rowcount = 2;

  String role = "Student";
  String school = "CAS";
  String department = "PKU";

  List<String> roleScores = [];
  List<String> schoolScores = [];
  List<String> departmentScores = [];

  double role_totalscore = 0;
  double school_totalscore = 0;
  double department_totalscore = 0;

//staff and student
  double avgscore = 0;
  //school
  double school_avgscore = 0;
  //department
  double department_avgscore = 0;

  @override
  void initState() {
    super.initState();
    _loadschoolResults();
    _loadroleResults();
  }

  @override
  void dispose() {
    resultList = [];
    super.dispose();
  }

  _ChartScreenState() {
    _selectedSchool = _schoolList[0];
    _selectedDepartment = _departmentList[0];
  }

  final _departmentList = ["PKU", "UAssist", "Library", "Sport-Centre"];
  String? _selectedDepartment = "";

  final _schoolList = ["CAS", "COLGIS"];
  String? _selectedSchool = "";

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
              title: const Text("SSKM Score Check"),
              centerTitle: true,
              actions: []),
          body: resultList.isEmpty
              ? Center(
                  child: Text(titlecenter,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)))
              : Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    //   child: Text(
                    //     "Your total SSKM test results (${resultList.length} found)",
                    //     style: const TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 200, 223, 244),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Card(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: screenWidth * 0.4,
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                role = "Student";
                                                isStaff = false;
                                                isStudent = true;
                                                _loadroleResults();
                                                setState(() {});
                                              },
                                              icon: Icon(Icons.search),
                                              label: Text('Student'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.4,
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                role = "Staff";
                                                isStudent = false;
                                                isStaff = true;

                                                _loadroleResults();
                                                setState(() {});
                                              },
                                              icon: Icon(Icons.search),
                                              label: Text('Staff'),
                                            ),
                                          ),
                                        ]),
                                    Text(
                                        "Average $role SSKM Score: ${avgscore.toStringAsFixed(2)}"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SfLinearGauge(
                                        minimum: 0,
                                        maximum: 48,
                                        ranges: [
                                          LinearGaugeRange(
                                            startValue: 0,
                                            endValue: 14,
                                            color: Colors.lightGreen,
                                          ),
                                        ],
                                        markerPointers: [
                                          LinearShapePointer(
                                            value: avgscore,
                                          ),
                                        ],
                                        barPointers: [
                                          LinearBarPointer(value: avgscore)
                                        ],
                                        animateAxis: true,
                                        animateRange: true,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 200, 223, 244),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Visibility(
                                  visible: isStaff,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                        value: _selectedDepartment,
                                        items: _departmentList
                                            .map((e) => DropdownMenuItem(
                                                child: Text(e), value: e))
                                            .toList(),
                                        onChanged: (val) {
                                          _selectedDepartment = val as String;
                                          _loaddepartmentResults();
                                          setState(() {});
                                        },
                                        decoration: const InputDecoration(
                                            labelText: 'Department',
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                            icon: Icon(
                                              Icons.stadium,
                                              color: Colors.grey,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 2.0),
                                            ))),
                                  ),
                                ),
                                Visibility(
                                  visible: isStudent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: screenWidth * 0.5,
                                      child: DropdownButtonFormField(
                                          isExpanded: true,
                                          value: _selectedSchool,
                                          items: _schoolList
                                              .map((e) => DropdownMenuItem(
                                                  child: Text(e), value: e))
                                              .toList(),
                                          onChanged: (val) {
                                            _selectedSchool = val as String;
                                            _loadschoolResults();
                                            setState(() {});
                                          },
                                          decoration: const InputDecoration(
                                              labelText: 'School',
                                              labelStyle: TextStyle(
                                                  color: Colors.black),
                                              icon: Icon(
                                                Icons.school,
                                                color: Colors.grey,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                    BorderSide(width: 2.0),
                                              ))),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Visibility(
                                  visible: isStudent,
                                  child: Container(
                                      height: screenWidth * 0.8,
                                      child: SfRadialGauge(
                                          enableLoadingAnimation: true,
                                          animationDuration: 2000,
                                          axes: <RadialAxis>[
                                            RadialAxis(
                                                minimum: 0,
                                                maximum: 48,
                                                ranges: <GaugeRange>[
                                                  GaugeRange(
                                                      startValue: 0,
                                                      endValue: 14,
                                                      color: Colors.green),
                                                  GaugeRange(
                                                      startValue: 14,
                                                      endValue: 31,
                                                      color: Colors.orange),
                                                  GaugeRange(
                                                      startValue: 31,
                                                      endValue: 48,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: school_avgscore)
                                                ],
                                                annotations: <GaugeAnnotation>[
                                                  GaugeAnnotation(
                                                      widget: Container(
                                                          child: Center(
                                                        child: Text(
                                                          'average score: \n${school_avgscore.toStringAsFixed(2)}',
                                                          style: TextStyle(
                                                            fontSize:
                                                                screenWidth *
                                                                    0.05,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )),
                                                      angle: 90,
                                                      positionFactor: 0.5)
                                                ])
                                          ])),
                                ),
                                Visibility(
                                  visible: isStaff,
                                  child: Container(
                                      height: screenWidth * 0.8,
                                      child: SfRadialGauge(
                                          enableLoadingAnimation: true,
                                          animationDuration: 2000,
                                          axes: <RadialAxis>[
                                            RadialAxis(
                                                minimum: 0,
                                                maximum: 48,
                                                ranges: <GaugeRange>[
                                                  GaugeRange(
                                                      startValue: 0,
                                                      endValue: 14,
                                                      color: Colors.green),
                                                  GaugeRange(
                                                      startValue: 14,
                                                      endValue: 31,
                                                      color: Colors.orange),
                                                  GaugeRange(
                                                      startValue: 31,
                                                      endValue: 48,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value:
                                                          department_avgscore)
                                                ],
                                                annotations: <GaugeAnnotation>[
                                                  GaugeAnnotation(
                                                      widget: Container(
                                                          child: Center(
                                                        child: Text(
                                                          'average score: \n${department_avgscore.toStringAsFixed(2)}',
                                                          style: TextStyle(
                                                            fontSize:
                                                                screenWidth *
                                                                    0.05,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )),
                                                      angle: 90,
                                                      positionFactor: 0.5)
                                                ])
                                          ])),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Card(
                    //     child: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       //Number
                    //       ClipRRect(
                    //         borderRadius: BorderRadius.circular(3),
                    //         child: Container(
                    //           width: screenWidth * 0.1,
                    //           color: const Color.fromARGB(255, 240, 223, 206),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(5.0),
                    //             child: Center(
                    //               child: Text(
                    //                 "No.",
                    //                 style: TextStyle(
                    //                   fontSize: screenWidth / 25,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       ClipRRect(
                    //         borderRadius: BorderRadius.circular(3),
                    //         child: Container(
                    //           width: screenWidth * 0.45,
                    //           color: Color.fromARGB(255, 240, 223, 206),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(5.0),
                    //             child: Center(
                    //               child: Text(
                    //                 "Time",
                    //                 style: TextStyle(
                    //                   fontSize: screenWidth / 24,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),

                    //       ClipRRect(
                    //         borderRadius: BorderRadius.circular(3),
                    //         child: Container(
                    //           width: screenWidth * 0.15,
                    //           color: Color.fromARGB(255, 240, 223, 206),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(5.0),
                    //             child: Center(
                    //               child: Text(
                    //                 "Score",
                    //                 style: TextStyle(
                    //                   fontSize: screenWidth / 26,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),

                    //       ClipRRect(
                    //         borderRadius: BorderRadius.circular(3),
                    //         child: Container(
                    //           width: screenWidth * 0.21,
                    //           color: Color.fromARGB(255, 240, 223, 206),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(5.0),
                    //             child: Center(
                    //               child: Text(
                    //                 "Status",
                    //                 style: TextStyle(
                    //                   fontSize: screenWidth / 24,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )),
                    // Expanded(
                    //   child: GridView.count(
                    //     crossAxisCount: rowcount,
                    //     childAspectRatio: 6,
                    //     children: List.generate(resultList.length, (index) {
                    //       return Card(
                    //         elevation: 8,
                    //         child: InkWell(
                    //           onTap: () {
                    //             // _showDetails(index);
                    //             _deleteDialog(index);
                    //           },
                    //           onLongPress: () {},
                    //           child: Column(children: [
                    //             const SizedBox(
                    //               height: 8,
                    //             ),
                    //             Flexible(
                    //                 flex: 4,
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.all(7.0),
                    //                   child: Row(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceBetween,
                    //                     children: [
                    //                       //Number
                    //                       ClipRRect(
                    //                         borderRadius:
                    //                             BorderRadius.circular(3),
                    //                         child: Container(
                    //                           width: screenWidth * 0.1,
                    //                           color: Color.fromARGB(
                    //                               255, 213, 241, 237),
                    //                           child: Padding(
                    //                             padding:
                    //                                 const EdgeInsets.all(5.0),
                    //                             child: Center(
                    //                               child: Text(
                    //                                 (index + 1).toString(),
                    //                                 style: TextStyle(
                    //                                   fontSize:
                    //                                       screenWidth / 24,
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       ClipRRect(
                    //                         borderRadius:
                    //                             BorderRadius.circular(3),
                    //                         child: Container(
                    //                           width: screenWidth * 0.45,
                    //                           color: const Color.fromARGB(
                    //                               255, 214, 232, 242),
                    //                           child: Padding(
                    //                             padding:
                    //                                 const EdgeInsets.all(5.0),
                    //                             child: Center(
                    //                               child: Text(
                    //                                 df.format(DateTime.parse(
                    //                                     resultList[index]
                    //                                         .resultdate
                    //                                         .toString())),
                    //                                 style: TextStyle(
                    //                                   fontSize:
                    //                                       screenWidth / 24,
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),

                    //                       ClipRRect(
                    //                         borderRadius:
                    //                             BorderRadius.circular(3),
                    //                         child: Container(
                    //                           width: screenWidth * 0.12,
                    //                           color: Color.fromARGB(
                    //                               255, 243, 237, 211),
                    //                           child: Padding(
                    //                             padding:
                    //                                 const EdgeInsets.all(5.0),
                    //                             child: Center(
                    //                               child: Text(
                    //                                 "  ${resultList[index].sskmscore}  ",
                    //                                 style: TextStyle(
                    //                                   fontSize:
                    //                                       screenWidth / 24,
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),

                    //                       ClipRRect(
                    //                         borderRadius:
                    //                             BorderRadius.circular(3),
                    //                         child: Container(
                    //                           width: screenWidth * 0.21,
                    //                           color: Color.fromARGB(
                    //                               255, 240, 244, 194),
                    //                           child: Padding(
                    //                             padding:
                    //                                 const EdgeInsets.all(5.0),
                    //                             child: Center(
                    //                               child: Text(
                    //                                 "  ${resultList[index].sskmlevel}  ",
                    //                                 style: TextStyle(
                    //                                   fontSize:
                    //                                       screenWidth / 30,
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ))
                    //           ]),
                    //         ),
                    //       );
                    //     }),
                    //   ),
                    // )
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

  void _loadroleResults() {
    http
        .get(
      Uri.parse("${ServerConfig.SERVER}/php/loadavgrole.php?userrole=$role"),
    )
        .then((response) {
      // wait for response from the request
      if (response.statusCode == 200) {
        //if statuscode OK
        var jsondata =
            jsonDecode(response.body); //decode response body to jsondata array
        if (jsondata['status'] == 'success') {
          print(response.body);
          //check if status data array is success
          var extractdata = jsondata['data']; //extract data from jsondata array

          if (extractdata['results'] != null) {
            //check if  array object is not null
            resultList = <Result>[]; //complete the array object definition
            extractdata['results'].forEach((v) {
              //traverse results array list and add to the list object array resultList
              resultList.add(Result.fromJson(
                  v)); //add each result array to the list object array resultList
              roleScores.add(v['sskm_score']);
            });

            titlecenter = "Found";
          } else {
            titlecenter =
                "Empty result Available"; //if no data returned show title center
            resultList.clear();
          }
        } else {
          print(response.body);

          titlecenter = "No result Available now";
        }
      } else {
        titlecenter = "No connection to database"; //status code other than 200
        resultList.clear(); //clear resultList array
      }
      print("test_role$roleScores");
      List<double> droleScores = roleScores.map(double.parse).toList();

      role_totalscore = droleScores.reduce((value, element) => value + element);
      avgscore = role_totalscore / roleScores.length;
      print(avgscore);
      roleScores.clear();
      setState(() {}); //refresh UI
    });
  }

  void _loadschoolResults() {
    String? school = _selectedSchool;
    http
        .get(
      Uri.parse(
          "${ServerConfig.SERVER}/php/loadschoolresults.php?userschool=$school"),
    )
        .then((response) {
      // wait for response from the request
      if (response.statusCode == 200) {
        //if statuscode OK
        var jsondata =
            jsonDecode(response.body); //decode response body to jsondata array
        if (jsondata['status'] == 'success') {
          print(response.body);
          //check if status data array is success
          var extractdata = jsondata['data']; //extract data from jsondata array

          if (extractdata['results'] != null) {
            //check if  array object is not null
            resultList = <Result>[]; //complete the array object definition
            extractdata['results'].forEach((v) {
              //traverse results array list and add to the list object array resultList
              resultList.add(Result.fromJson(
                  v)); //add each result array to the list object array resultList
              schoolScores.add(v['sskm_score']);
            });

            titlecenter = "Found";
          } else {
            titlecenter =
                "Empty result Available"; //if no data returned show title center
            resultList.clear();
          }
        } else {
          print(response.body);

          titlecenter = "No result Available now";
        }
      } else {
        titlecenter = "No connection to database"; //status code other than 200
        resultList.clear(); //clear resultList array
      }
      print("test_school$schoolScores");
      List<double> dschoolScores = schoolScores.map(double.parse).toList();

      school_totalscore =
          dschoolScores.reduce((value, element) => value + element);
      school_avgscore = school_totalscore / schoolScores.length;
      print(school_avgscore);
      schoolScores.clear();
      setState(() {}); //refresh UI
    });
  }

  void _loaddepartmentResults() {
    String? department = _selectedDepartment;
    http
        .get(
      Uri.parse(
          "${ServerConfig.SERVER}/php/loaddepartmentresults.php?userdepartment=$department"),
    )
        .then((response) {
      // wait for response from the request
      if (response.statusCode == 200) {
        //if statuscode OK
        var jsondata =
            jsonDecode(response.body); //decode response body to jsondata array
        if (jsondata['status'] == 'success') {
          print(response.body);
          //check if status data array is success
          var extractdata = jsondata['data']; //extract data from jsondata array

          if (extractdata['results'] != null) {
            //check if  array object is not null
            resultList = <Result>[]; //complete the array object definition
            extractdata['results'].forEach((v) {
              //traverse results array list and add to the list object array resultList
              resultList.add(Result.fromJson(
                  v)); //add each result array to the list object array resultList
              departmentScores.add(v['sskm_score']);
            });

            titlecenter = "Found";
          } else {
            titlecenter =
                "Empty result Available"; //if no data returned show title center
            resultList.clear();
          }
        } else {
          print(response.body);

          titlecenter = "No result Available now";
        }
      } else {
        titlecenter = "No connection to database"; //status code other than 200
        resultList.clear(); //clear resultList array
      }
      print("test_school$departmentScores");
      List<double> ddepartmentScores =
          departmentScores.map(double.parse).toList();

      department_totalscore =
          ddepartmentScores.reduce((value, element) => value + element);
      department_avgscore = department_totalscore / departmentScores.length;
      print(department_avgscore);

      departmentScores.clear();
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
            "Delete record ${truncateString(resultList[index - 1].resultid.toString(), 15)}",
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
