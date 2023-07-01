//write a flutter bottom tab navigation with 2 tab and one button in between the tab?

import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../models/Palette.dart';

import '../screens/activityscreen.dart';
import '../screens/profilescreen.dart';
import '../screens/testscreen.dart';

// import '../screens/sskmscreen.dart';

// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({super.key, required this.user});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> tabchildren;
  int _currentIndex = 0;
  String maintitle = "Activity";
  late double screenHeight, screenWidth, resWidth;

  @override
  void initState() {
    super.initState();
    tabchildren = [
      ActivityScreen(
        user: widget.user,
      ),
      // SskmScreen(user: widget.user),
      ProfileScreen(
        user: widget.user,
      ),
    ];
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
        body: tabchildren[_currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TestScreen(user: widget.user)));
          },
          child: Icon(Icons.book),
          backgroundColor: Palette.kToDark.shade100,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Color.fromARGB(255, 255, 255, 255),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Color.fromARGB(255, 128, 94, 94),
            textTheme: Theme.of(context).textTheme.copyWith(
                  caption: new TextStyle(color: Colors.grey),
                ),
          ),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Palette.kToDark.shade200,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.star,
                    size: resWidth * 0.07,
                  ),
                  label: "Activity"),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.book, size: resWidth * 0.07), label: "Summary"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: resWidth * 0.07),
                  label: "Profile")
            ],
          ),
        ));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 0) {
        maintitle = "Activity";
      }
      if (_currentIndex == 1) {
        maintitle = "Profile";
      }
      // if (_currentIndex == 2) {
      //   maintitle = "SSKM";
      // }
    });
  }
}
