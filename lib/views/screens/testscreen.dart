import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../../models/user.dart';
import '../../models/result.dart';
import '../../serverconfig.dart';

import 'activityscreen.dart';

import 'package:connectivity/connectivity.dart';

import 'resultscreen.dart';

class TestScreen extends StatefulWidget {
  final User user;

  const TestScreen({super.key, required this.user});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _formKey = GlobalKey<FormState>();

  //SSKM Questions indentical Score
  String? _answer1;
  String? _answer2;
  String? _answer3;
  String? _answer4;
  String? _answer5;
  String? _answer6;
  String? _answer7;
  String? _answer8;

  String? _answer9;
  String? _answer10;
  String? _answer11;
  String? _answer12;
  String? _answer13;
  String? _answer14;
  String? _answer15;
  String? _answer16;

  String _isAlways = 'yes';
  String _score = '0';
  String _result = '-';
  //n-result > 14, tahap negatif
  //s-result has 'sentiasa', tahap positif but need cure
  //p-result <= 14, tahap positif

  late double screenHeight, screenWidth;

  @override
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("SSKM Mental Test")),
      body: SizedBox(
        height: screenHeight * 0.88,
        width: screenHeight * 0.9,
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: Card(
            color: Color.fromARGB(255, 234, 199, 199),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Untuk setiap soalana yang berikut sila pilih satu jawapan yang mengganbarkan pengalaman atau perasaan anda dengan paling tepat dan tandakan (/) di dalam kotak yang disediakan.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "For each of the following questions please select the answer that best describes your experience or feeling and select the box provided.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 90, 88, 88),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "\nDi dalam tempoh satu bulan yang lepas pernahkah anda mempunyai pengalaman atau perasaan yang berikut:",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "In the past one month have you had any of the following experiences or feelings:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 90, 88, 88),
                        fontSize: 16,
                      ),
                    ),
                    //Card of questions group
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //card of question 1
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text("Sedih (atau susah hati)"),
                                    Text("Sad (or distressed)"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer1,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer1 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer1 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer1,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer1 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer1 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer1,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer1 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer1 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer1,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer1 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer1 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 2
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text("Mudah marah"),
                                    Text("Easy to get angry"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer2,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer2 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer2 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer2,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer2 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer2 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer2,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer2 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer2 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer2,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer2 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer2 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 3
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text("Tidak minat bercakap"),
                                    Text("No interest in conversation"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer3,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer3 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer3 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer3,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer3 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer3 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer3,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer3 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer3 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer3,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer3 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer3 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 4
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text("Kerap terjaga dari tidur"),
                                    Text("Frequently awake from sleep"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer4,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer4 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer4 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer4,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer4 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer4 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer4,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer4 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer4 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer4,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer4 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer4 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 5
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text("Sakit-sakit badan/sendi"),
                                    Text("Body/joint pain"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer5,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer5 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer5 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer5,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer5 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer5 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer5,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer5 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer5 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer5,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer5 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer5 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 6
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text(
                                        "Hilang minat pada perkara yang biasa diminati"),
                                    Text("Lost interest in usual interestsp"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer6,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer6 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer6 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer6,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer6 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer6 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer6,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer6 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer6 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer6,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer6 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer6 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 7
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text("Menangis atau rasa hendak menangis"),
                                    Text("Crying or feeling about to cry"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer7,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer7 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer7 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer7,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer7 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer7 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer7,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer7 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer7 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer7,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer7 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer7 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 8
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text("Rasa sunyi"),
                                    Text("Feeling of loneliness"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer8,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer8 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer8 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer8,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer8 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer8 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer8,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer8 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer8 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer8,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer8 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer8 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 9
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text(
                                        "Takut terhadap sesuatu objek atau keadaan"),
                                    Text("Fear of an object or situation"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer9,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer9 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer9 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer9,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer9 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer9 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer9,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer9 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer9 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer9,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer9 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer9 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 10
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text(
                                        "Badan lemah, lesu atau tidak bertenaga"),
                                    Text(
                                        "Body weakness, tiredness or lack of energy"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer10,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer10 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer10 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer10,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer10 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer10 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer10,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer10 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer10 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer10,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer10 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer10 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 11
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text(
                                      "Tidak suka bercampur dengan orang lain (menyendiri)",
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                        "Doesn't like to mix with other people (alone)"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer11,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer11 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer11 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer11,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer11 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer11 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer11,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer11 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer11 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer11,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer11 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer11 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 12
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text("Perasaan ingin mati"),
                                    Text("Feelings of wanting to die"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer12,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer12 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer12 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer12,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer12 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer12 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer12,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer12 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer12 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer12,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer12 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer12 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 13
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text(
                                        "Kurang daya ingatan atau mudah terlupa"),
                                    Text("Memory loss or forgetfulness"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer13,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer13 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer13 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer13,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer13 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer13 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer13,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer13 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer13 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer13,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer13 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer13 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 14
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text("Otot tegang"),
                                    Text("Muscle strains"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer14,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer14 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer14 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer14,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer14 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer14 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer14,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer14 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer14 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer14,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer14 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer14 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 15
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text(
                                        "Keyakinan pada diri sendiri yang berlebihan"),
                                    Text("Excessive self-confidence"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer15,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer15 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer15 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer15,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer15 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer15 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer15,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer15 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer15 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer15,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer15 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer15 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //card of question 16
                            Card(
                              color: Color.fromARGB(255, 208, 224, 234),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: screenWidth * 0.7),
                                    Text(
                                      "Buah fikiran yang pantas, seolah berlumba-lumba",
                                      textAlign: TextAlign.center,
                                    ),
                                    Text("Quick thoughts, as if racing"),
                                    Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: Text('Tiada\nNone'),
                                          value: '0',
                                          groupValue: _answer16,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer16 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer16 == '0'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title:
                                              Text('Kadang-kadang\nSometimes'),
                                          value: '1',
                                          groupValue: _answer16,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer16 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer16 == '1'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Kerap\nOften'),
                                          value: '2',
                                          groupValue: _answer16,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer16 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer16 == '2'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text('Sentiasa\nAlways'),
                                          value: '3',
                                          groupValue: _answer16,
                                          onChanged: (value) {
                                            setState(() {
                                              _answer16 = value;
                                            });
                                          },
                                          dense: true,
                                          tileColor: _answer16 == '3'
                                              ? Color.fromARGB(
                                                  255, 234, 199, 199)
                                              : null,
                                          selectedTileColor: Color.fromARGB(
                                              255, 234, 199, 199),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: Colors.white,
                                          // checkColor:
                                          // Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(
                              255, 209, 152, 152), // Background color
                        ),
                        onPressed: () async {
                          _checkInternet();
                        },
                        child: const Text('Submit')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: "Please connect to internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
      return;
    } else {
      _submitAnswerDialog();
    }
  }

  void _submitAnswerDialog() {
    // print("$_selectedSchool");
    // String score = _score;
    // String level = _level;
    // String alway = _isAlways;
    // String result = _result;

    List answerList = [
      _answer1,
      _answer2,
      _answer3,
      _answer4,
      _answer5,
      _answer6,
      _answer7,
      _answer8,
      _answer9,
      _answer10,
      _answer11,
      _answer12,
      _answer13,
      _answer14,
      _answer15,
      _answer16
    ];
    if (answerList.contains(null)) {
      Fluttertoast.showToast(
          msg: "Please answer all the questions before submit.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
      return;
    }
    //Calculate the sum of all Answer
    List<double> dblList = answerList.map((str) => double.parse(str)).toList();
    double sumOfAnswer =
        dblList.fold(0, (previousValue, element) => previousValue + element);
    print(sumOfAnswer);

    if (sumOfAnswer > 14) {
      _result = 'negative';
      //result = negative
    } else {
      _result = 'positive';
      //result = positive
    }
    _score = sumOfAnswer.toString();

    //Identify weather there is 'sentiasa' is choosen

    if (answerList.contains('3')) {
      print('yes,has sentiasa');
      _isAlways = '1';
    } else {
      print('no,do not have sentiasa');
      _isAlways = '0';
    }
    print(_isAlways);

    //If everything good proceed with dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Submit the Result?",
            style: TextStyle(),
          ),
          content: const Text("Are you sure?", style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _insertResult(_score, _result, _isAlways);
                Result result = Result(
                  resultid: '00',
                  id: widget.user.id,
                  sskmscore: _score,
                  sskmlevel: _result,
                  sskmsentiasa: _isAlways,
                  resultdate: '00',
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(result: result),
                  ),
                );
                // _showResult;
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

  void _insertResult(String score, String result, String isAlways) {
    http.post(Uri.parse("${ServerConfig.SERVER}/php/insert_result.php"), body: {
      "userid": widget.user.id,
      "score": score,
      "level": result,
      "sentiasa": isAlways,
    }).then((response) {
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['status'] == "success") {
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14.0);
        // Navigator.of(context).pop();
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
  }

  void _showResult() {
    Result result = Result(
      resultid: '1',
      id: '2',
      sskmscore: '3',
      sskmlevel: '4',
      sskmsentiasa: '5',
      resultdate: '6',
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(result: result),
      ),
    );
  }
}
