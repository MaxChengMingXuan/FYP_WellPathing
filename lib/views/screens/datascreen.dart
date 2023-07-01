import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:wellpathing/models/result.dart';

import '../../serverconfig.dart';

import 'package:ndialog/ndialog.dart';
import '../../models/user.dart';

import 'package:http/http.dart' as http;

class DataScreen extends StatefulWidget {
  final User user;
  const DataScreen({super.key, required this.user});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  List<Result> resultList = <Result>[];
  String titlecenter = "Loading...";
  final df = DateFormat('dd/MM/yyyy hh:mm a');
  late double screenHeight, screenWidth, resWidth;
  int rowcount = 1;
  TextEditingController searchController = TextEditingController();
  String search = "all";
  late User seller;
  //for pagination
  // ignore: prefer_typing_uninitialized_variables
  var color;
  int numofpage = 1, curpage = 1;
  int numberofresult = 0;
//for pagination
  @override
  void initState() {
    super.initState();
    // seller = User(
    //     id: "0",
    //     email: "unregistered",
    //     name: "unregistered",
    //     address: "na",
    //     phone: "0123456789",
    //     regdate: "0",
    //     credit: '0');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadResults("all", 1);
    });
  }

  @override
  void dispose() {
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
          appBar:
              AppBar(title: const Text("Data"), centerTitle: true, actions: [
            // IconButton(
            //   icon: const Icon(Icons.search),
            //   onPressed: () {
            //     _loadSearchDialog();
            //   },
            // ),
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
                        "Total $numberofresult results found",
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
                    ),
                    //pagination widget
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: numofpage,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          //build the list for textbutton with scroll
                          if ((curpage - 1) == index) {
                            //set current page number active
                            color = Colors.red;
                          } else {
                            color = Colors.black;
                          }
                          return TextButton(
                              onPressed: () =>
                                  {_loadResults(search, index + 1)},
                              child: Text(
                                (index + 1).toString(),
                                style: TextStyle(color: color, fontSize: 18),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
          // drawer: MainMenuWidget(user: widget.user),
        ));
  }

  String truncateString(String str, int size) {
    if (str.length > size) {
      str = str.substring(0, size);
      return "$str...";
    } else {
      return str;
    }
  }

  void _loadResults(String search, int pageno) {
    curpage = pageno; //init current page
    numofpage; //get total num of pages if not by default set to only 1

    http
        .get(
      Uri.parse(
          "${ServerConfig.SERVER}/php/loadallresults.php?search=$search&pageno=$pageno"),
    )
        .then((response) {
      ProgressDialog progressDialog = ProgressDialog(
        context,
        blur: 5,
        message: const Text("Loading..."),
        title: null,
      );
      progressDialog.show();
      // wait for response from the request
      if (response.statusCode == 200) {
        //if statuscode OK
        var jsondata =
            jsonDecode(response.body); //decode response body to jsondata array
        if (jsondata['status'] == 'success') {
          print(response.body);
          //check if status data array is success
          var extractdata = jsondata['data']; //extract data from jsondata array
          List<String> schoolScores = [];
          if (extractdata['results'] != null) {
            numofpage = int.parse(jsondata['numofpage']); //get number of pages
            numberofresult = int.parse(jsondata[
                'numberofresult']); //get total number of result returned
            //check if  array object is not null
            resultList = <Result>[]; //complete the array object definition
            extractdata['results'].forEach((v) {
              //traverse results array list and add to the list object array resultList
              resultList.add(Result.fromJson(
                  v)); //add each product array to the list object array productList
              schoolScores.add(v['sskm_score']);
              print("test$schoolScores");
            });

            titlecenter = "Found";
          } else {
            titlecenter =
                "No Result Available"; //if no data returned show title center
            resultList.clear();
          }
        }
      } else {
        titlecenter = "No Product Available"; //status code other than 200
        resultList.clear(); //clear productList array
      }

      setState(() {}); //refresh UI
      progressDialog.dismiss();
    });
  }

  // _showDetails(int index) async {
  //   if (widget.user.id == "0") {
  //     Fluttertoast.showToast(
  //         msg: "Please register an account",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         fontSize: 14.0);
  //     return;
  //   }
  //   Product product = Product.fromJson(productList[index].toJson());
  //   loadSingleSeller(index);
  //   //todo update seller object with empty object.
  //   ProgressDialog progressDialog = ProgressDialog(
  //     context,
  //     blur: 5,
  //     message: const Text("Loading..."),
  //     title: null,
  //   );
  //   progressDialog.show();
  //   Timer(const Duration(seconds: 1), () {
  //     if (seller.id != "0") {
  //       progressDialog.dismiss();
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (content) => BuyerProductDetails(
  //                     user: widget.user,
  //                     product: product,
  //                     seller: seller,
  //                   )));
  //     }
  //     progressDialog.dismiss();
  //   });
  // }

  void _loadSearchDialog() {
    searchController.text = "";
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return StatefulBuilder(
            builder: (context, StateSetter setState) {
              return AlertDialog(
                title: const Text(
                  "Search ",
                ),
                content: SizedBox(
                  //height: screenHeight / 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            labelText: 'Search',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      search = searchController.text;
                      Navigator.of(context).pop();
                      _loadResults(search, 1);
                    },
                    child: const Text("Search"),
                  )
                ],
              );
            },
          );
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
          _loadResults("all", 1);
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

  // loadSingleSeller(int index) {
  //   http.post(Uri.parse("${ServerConfig.SERVER}/php/load_seller.php"),
  //       body: {"sellerid": productList[index].userId}).then((response) {
  //     var jsonResponse = json.decode(response.body);
  //     if (response.statusCode == 200 && jsonResponse['status'] == "success") {
  //       seller = User.fromJson(jsonResponse['data']);
  //     }
  //   });
  // }
}
