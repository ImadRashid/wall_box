import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_box/constants/Constants.dart';
import 'package:wall_box/view/Bottom_Nav_Bar.dart';
import '../constants/Urls.dart';
import 'Welcome_view.dart';

class Splash_view extends StatefulWidget {
  const Splash_view({Key, key}) : super(key: key);

  @override
  _Splash_viewState createState() => _Splash_viewState();
}

class _Splash_viewState extends State<Splash_view> {
  @override
  void initState() {
    print("Init Called");
    checkFirstInstall()
        // .then((ipExists) async {
        //   if (!ipExists) {
        //     print("Ip isn't found");
        //     Future.delayed(Duration(seconds: 1)).then((value) =>
        //         Navigator.of(context)
        //             .push(MaterialPageRoute(builder: (context) => Welcome_view())));
        //   } else {
        //     print("Ip found");
        //     final status = await autoLogin();
        //     status
        //         ? Future.delayed(Duration(seconds: 1)).then((value) =>
        //             Navigator.of(context).push(
        //                 MaterialPageRoute(builder: (context) => Bottom_Nav_Bar())))
        //         : Future.delayed(Duration(seconds: 1)).then((value) =>
        //             Navigator.of(context).push(
        //                 MaterialPageRoute(builder: (context) => Welcome_view())));
        //   }
        // })
        ;
    super.initState();
  }

  Future<bool> autoLogin() async {
    print("Auto Login Called");
    print("URI Parse: ${Uri.parse('http://$ipAddress$login_url')}");
    var auth = 'Basic ' + base64Encode(utf8.encode('operator:yellow_zone'));

    try {
      final status =
          await http.get(Uri.parse('http://$ipAddress$login_url'), headers: {
        HttpHeaders.authorizationHeader: '$auth',
        HttpHeaders.contentTypeHeader: 'application/json',
      }).then(
        (value) {
          // print(value.body);
          if (value.statusCode == 200) {
            authToken = jsonDecode(value.body)['token'];
            // value.body.
            return true;
          } else {
            print("object");
            return false;
          }
        },
      ).catchError((error) {
        print("CATCH error $error");
        return false;
      });

      print("AFTER AWAIT STATUS CODE == ${status}");
      return status != 200 ? false : true;
    } catch (e) {
      print("Try CATHCH MESSAGE: $e");
      return false;
    }
    // return false;
  }

  checkFirstInstall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var check = pref.getBool('exists');
    ipAddress = pref.getString('ip');
    print("Ip has been found:: ${pref.getString('ip')}");
    if (check != null && check == true) {
      final result = await autoLogin();
      if (result) {
        Future.delayed(Duration(seconds: 1)).then((value) =>
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Bottom_Nav_Bar())));
      } else {
        Future.delayed(Duration(seconds: 1)).then((value) =>
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Welcome_view())));
      }
      // return false;

    } else {
      Future.delayed(Duration(seconds: 1)).then((value) => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Welcome_view())));
      // return true;

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
