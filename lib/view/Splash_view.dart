import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_box/constants/Constants.dart';
import 'package:wall_box/view/Bottom_Nav_Bar.dart';
import 'Welcome_view.dart';

class Splash_view extends StatefulWidget {
  const Splash_view({Key, key}) : super(key: key);

  @override
  _Splash_viewState createState() => _Splash_viewState();
}

class _Splash_viewState extends State<Splash_view> {
  @override
  void initState() {
    checkFirstInstall().then((value) => {
          value == true
              ? Future.delayed(Duration(seconds: 1)).then((value) =>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Welcome_view())))
              : Future.delayed(Duration(seconds: 1)).then((value) =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Bottom_Nav_Bar())))
        });
    super.initState();
  }

  Future<bool> checkFirstInstall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var check = pref.getBool('exists');
    ipAddress = pref.getString('ip');
    print(pref.getString('ip'));
    if (check != null && check == true) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    sh = MediaQuery.of(context).size.height;
    sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/splash.png',
            ),
          )),
        ),
      ),
    );
  }
}
