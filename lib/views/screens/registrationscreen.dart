import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../../serverconfig.dart';
import '../../models/user.dart';

class RegistrationScreen extends StatefulWidget {
  final User user;
  const RegistrationScreen({super.key, required this.user});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late double screenHeight, screenWidth, resWidth;
  bool isVisble = true;
  bool isStaff = false;
  bool isStudent = true;

  @override
  void initState() {
    super.initState();
    loadEula();
  }

  _RegistrationScreenState() {
    _selectedSchool = _schoolList[0];
    _selectedProgramme = _programmeList[0];
    _selectedDepartment = _departmentList[0];
  }

//Staff and Student
  String userRole = 'Student';

  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passEditingController = TextEditingController();
  final TextEditingController _pass2EditingController = TextEditingController();

//Staff
  final TextEditingController _staffidEditingController =
      TextEditingController();

  final _departmentList = ["PKU", "UAssist", "Library", "Sport-Centre"];
  String? _selectedDepartment = "";

//Student
  final TextEditingController _matricEditingController =
      TextEditingController();

  final _schoolList = ["CAS", "COLGIS"];
  String? _selectedSchool = "";

  final _programmeList = [
    "Bachelor of Information Tecnology",
    "Bachelor of Multimedia"
  ];
  String? _selectedProgramme = "";

  bool _isChecked = false;
  bool _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  String eula = "";

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
        appBar: AppBar(title: const Text("Registration Form")),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: screenWidth * 0.4,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      userRole = 'Student';
                      isStaff = false;
                      isStudent = true;
                      setState(() {});
                    },
                    icon: Icon(Icons.account_box),
                    label: Text('Student'),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.4,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      userRole = 'Staff';
                      isStaff = true;
                      isStudent = false;
                      setState(() {});
                    },
                    icon: Icon(Icons.medical_information),
                    label: Text('Staff'),
                  ),
                ),
              ]),
              Card(
                elevation: 8,
                margin: const EdgeInsets.all(8),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                          controller: _nameEditingController,
                          keyboardType: TextInputType.text,
                          validator: (val) => val!.isEmpty || (val.length < 3)
                              ? "Name must be longer than 3"
                              : null,
                          decoration: const InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(),
                              icon: Icon(Icons.person),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.0),
                              ))),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                          controller: _emailEditingController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) => val!.isEmpty ||
                                  !val.contains("@") ||
                                  !val.contains(".")
                              ? "A valid email is required"
                              : null,
                          decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(),
                              icon: Icon(Icons.email),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.0),
                              ))),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),

                      //Staff ID
                      Visibility(
                        visible: isStaff,
                        child: TextFormField(
                            controller: _staffidEditingController,
                            validator: (val) => val!.isEmpty || (val.length < 6)
                                ? "Please enter valid staff id"
                                : null,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                labelText: 'Staff ID',
                                labelStyle: TextStyle(),
                                icon: Icon(Icons.assignment_ind),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1.0),
                                ))),
                      ),
                      Visibility(
                        visible: isStaff,
                        child: const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                      ),

                      Visibility(
                        visible: isStaff,
                        child: DropdownButtonFormField(
                            value: _selectedDepartment,
                            items: _departmentList
                                .map((e) =>
                                    DropdownMenuItem(child: Text(e), value: e))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedDepartment = val as String;
                              });
                            },
                            decoration: const InputDecoration(
                                labelText: 'Department',
                                labelStyle: TextStyle(color: Colors.black),
                                icon: Icon(
                                  Icons.stadium,
                                  color: Colors.grey,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1.0),
                                ))),
                      ),
                      Visibility(
                        visible: isStaff,
                        child: const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                      ),
                      Visibility(
                        visible: isStudent,
                        child: TextFormField(
                            controller: _matricEditingController,
                            validator: (val) => val!.isEmpty || (val.length < 6)
                                ? "Please enter valid matric number"
                                : null,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                labelText: 'Matric Number',
                                labelStyle: TextStyle(),
                                icon: Icon(Icons.assignment_ind),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1.0),
                                ))),
                      ),
                      Visibility(
                        visible: isStudent,
                        child: const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                      ),
                      Visibility(
                        visible: isStudent,
                        child: DropdownButtonFormField(
                            value: _selectedSchool,
                            items: _schoolList
                                .map((e) =>
                                    DropdownMenuItem(child: Text(e), value: e))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedSchool = val as String;
                              });
                            },
                            decoration: const InputDecoration(
                                labelText: 'School',
                                labelStyle: TextStyle(color: Colors.black),
                                icon: Icon(
                                  Icons.school,
                                  color: Colors.grey,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1.0),
                                ))),
                      ),

                      Visibility(
                        visible: isStudent,
                        child: const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                      ),

                      Visibility(
                        visible: isStudent,
                        child: DropdownButtonFormField(
                            isExpanded: true,
                            value: _selectedProgramme,
                            items: _programmeList
                                .map((e) => DropdownMenuItem(
                                    child: Text(e,
                                        overflow: TextOverflow.ellipsis),
                                    value: e))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedProgramme = val as String;
                              });
                            },
                            decoration: const InputDecoration(
                                labelText: 'Programme',
                                labelStyle: TextStyle(color: Colors.black),
                                icon: Icon(
                                  Icons.stadium,
                                  color: Colors.grey,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1.0),
                                ))),
                      ),
                      Visibility(
                        visible: isStudent,
                        child: const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                      ),

                      TextFormField(
                          controller: _passEditingController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) => validatePassword(val.toString()),
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(),
                            icon: const Icon(Icons.password),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                          controller: _pass2EditingController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            labelText: 'Re-Password',
                            labelStyle: const TextStyle(),
                            icon: const Icon(Icons.password),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: showEula,
                              child: const Text('Agree with terms',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        minWidth: 115,
                        height: 50,
                        elevation: 10,
                        onPressed: _checkInternet,
                        color: Theme.of(context).colorScheme.primary,
                        child: const Text('Register'),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        )));
  }

  String? validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{10,}$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        Fluttertoast.showToast(
            msg:
                "Password must include 10 characters, 1 uppercase, 1 lowercase and 1 digit.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14.0);
        return 'Enter valid password';
      } else {
        return null;
      }
    }
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
      print(connectivityResult);
      return;
    } else {
      print('connection');
      print(connectivityResult);
      _registerAccountDialog();
    }
  }

  void _registerAccountDialog() {
    // print("$_selectedSchool");
    String _role = userRole;

    String _name = _nameEditingController.text;
    String _email = _emailEditingController.text;

    String _staffid = _staffidEditingController.text;
    String? _department = _selectedDepartment;

    String _matric = _matricEditingController.text;
    String? _school = _selectedSchool;
    String? _programme = _selectedProgramme;

    String _passa = _passEditingController.text;
    String _passb = _pass2EditingController.text;

    if (!_formKey.currentState!.validate()) {
      Fluttertoast.showToast(
          msg: "Please complete the registration form first",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
      return;
    }
    if (!_isChecked) {
      Fluttertoast.showToast(
          msg: "Please Accept Term",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
      return;
    }
    if (_passa != _passb) {
      Fluttertoast.showToast(
          msg: "Please check your passsword",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
      return;
    }

    //If everything good proceed with dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Register new account?",
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
                _registerUser(_role, _name, _email, _staffid, _department!,
                    _matric, _school!, _programme!, _passa);
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

  loadEula() async {
    WidgetsFlutterBinding.ensureInitialized();
    eula = await rootBundle.loadString('assets/images/eula.txt');
  }

  showEula() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "EULA",
            style: TextStyle(),
          ),
          content: SizedBox(
            height: 300,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                      child: RichText(
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                        text: eula),
                  )),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Close",
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  //Pass the data to the server
  void _registerUser(
      String role,
      String name,
      String email,
      String staffid,
      String department,
      String matric,
      String school,
      String programme,
      String pass) {
    try {
      // http.post(
      //     Uri.parse(
      //         "http://192.168.58.227/homestay_raya/php/register_user.php"),
      if (role == 'Student') {
        staffid = 'na';
        department = 'na';
      }
      if (role == 'Staff') {
        matric = 'na';
        school = 'na';
        programme = 'na';
      }

      http.post(Uri.parse("${ServerConfig.SERVER}/php/register_user.php"),
          body: {
            "role": role,
            "name": name,
            "email": email,
            "staffid": staffid,
            "department": department,
            "matric": matric,
            "school": school,
            "programme": programme,
            "password": pass,
            "register": "register"
          }).then((response) {
        //print(response.body);
        var data = jsonDecode(response.body);
        if (response.statusCode == 200 && data['status'] == "success") {
          Fluttertoast.showToast(
              msg: "Success",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 14.0);
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
    } catch (e) {
      print(e.toString());
    }
  }
}
