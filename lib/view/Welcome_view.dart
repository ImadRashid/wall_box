import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_box/constants/Constants.dart';
import 'package:wall_box/view/Bottom_Nav_Bar.dart';

import '../controller/login_controller.dart';

class Welcome_view extends StatefulWidget {
  const Welcome_view({Key, key}) : super(key: key);

  @override
  _Welcome_viewState createState() => _Welcome_viewState();
}

class _Welcome_viewState extends State<Welcome_view> {
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();

  TextEditingController ipController1 = TextEditingController();
  TextEditingController ipController2 = TextEditingController();
  TextEditingController ipController3 = TextEditingController();
  TextEditingController ipController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: sh * 0.35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/clip.png'))),
              child: Center(
                  child: Text(
                'Willkommen zu Ihrer neuenWallbox',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 30),
                textAlign: TextAlign.center,
                maxLines: 3,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child: Text(
                '''Bitte geben Sie die IP-Adresse Ihrer
Wallbox ein und drücken „OK“.
Sie können die IP- Adresse später
noch in den Einstellungen ändern.''',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 17),
                maxLines: 50,
              )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 60,
                    child: TextField(
                      focusNode: focus1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      controller: ipController1,
                      onChanged: (value) {
                        if (value.length == 3) {
                          // FocusScope.of(context).requestFocus(focus2);
                        }
                      },
                      // onSubmitted: (x) {
                      //   FocusScope.of(context).requestFocus(focus2);
                      // },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade300),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    child: TextField(
                      focusNode: focus2,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      controller: ipController2,
                      onChanged: (value) {
                        if (value.length == 3) {
                          // FocusScope.of(context).requestFocus(focus3);
                        }
                      },
                      // onSubmitted: (x) {
                      //   FocusScope.of(context).requestFocus(focus3);
                      // },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade300),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    child: TextField(
                      focusNode: focus3,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      controller: ipController3,
                      onChanged: (value) {
                        if (value.length == 3) {
                          // FocusScope.of(context).requestFocus(focus4);
                        }
                      },
                      // onSubmitted: (x) {
                      //   FocusScope.of(context).requestFocus(focus4);
                      // },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade300),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    child: TextField(
                      focusNode: focus4,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      controller: ipController4,
                      onChanged: (value) {
                        if (value.length >= 3) {
                          ipController4.text = ipController4.text;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: sw * 0.18, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () {
                        print(ipController1.text +
                            "." +
                            ipController2.text +
                            "." +
                            ipController3.text +
                            "." +
                            ipController4.text);
                        ipAddress = ipController1.text +
                            "." +
                            ipController2.text +
                            "." +
                            ipController3.text +
                            "." +
                            ipController4.text +
                            ':2222';
                        if (ipController1.text.isEmpty &&
                            ipController2.text.isEmpty &&
                            ipController3.text.isEmpty &&
                            ipController4.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Bitte geben Sie eine ein IP-Address');
                        } else {
                          setIp();
                          login_contoller().login();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Bottom_Nav_Bar(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'OK',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: sw * 0.18, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Abbrechen',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 20),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  setIp() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('ip', ipAddress.toString());
  }
}
