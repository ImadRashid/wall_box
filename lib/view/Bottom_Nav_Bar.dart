import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_box/view/Einstellungen_view.dart';
import 'package:wall_box/view/Faq_view.dart';
import 'package:wall_box/view/Home_view.dart';
import 'package:wall_box/view/Statistiken_view.dart';
import 'package:wall_box/view/System_view.dart';

import '../constants/Constants.dart';
import 'Welcome_view.dart';

class Bottom_Nav_Bar extends StatefulWidget {
  const Bottom_Nav_Bar({Key, key}) : super(key: key);

  @override
  _Bottom_Nav_BarState createState() => _Bottom_Nav_BarState();
}

class _Bottom_Nav_BarState extends State<Bottom_Nav_Bar> {
  var selectedIndex = 0;
  List pages = [
    Home_view(),
    Statistiken_view(),
    System_view(),
    Hife_Faq_view(),
    Einstellungen_view(),
  ];
  @override
  void initState() {
    setFirstInstall();
    // TODO: implement initState
    super.initState();
  }

  setFirstInstall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('exists', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (val) {
          setState(() {
            selectedIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              size: 25,
            ),
            label: english ? 'Home' : 'Startseite',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.slider_horizontal_3,
                size: 24,
              ),
              label: english ? 'Statistics' : 'Statistiken'),
          BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: selectedIndex == 2
                            ? Theme.of(context).primaryColor
                            : Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.key,
                  size: 15,
                ),
              ),
              label: !english ? 'System' : 'System'),
          BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: selectedIndex == 3
                              ? Theme.of(context).primaryColor
                              : Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    FontAwesomeIcons.info,
                    size: 15,
                  )),
              label: english ? 'Help & Faq' : 'Hilfe & FAQ'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 20,
            ),
            label: english ? 'Settings' : 'Einstellungen',
          ),
        ],
      ),
      body: pages.elementAt(selectedIndex),
    );
  }
}
