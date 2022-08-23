import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_box/constants/Constants.dart';
import 'package:wall_box/controller/home_controller.dart';
import 'package:wall_box/controller/login_controller.dart';

class Home_view extends StatefulWidget {
  const Home_view({Key, key}) : super(key: key);

  @override
  _Home_viewState createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  home_controller controller = Get.put(home_controller());
  login_contoller login = Get.put(login_contoller());
  @override
  void initState() {
    setIp();
    login.login();

    controller.CheckAgain();
    controller.GetTransactions();
    controller.GetConn_state();
    controller.GetAuth_state();
    controller.GetCurrent_a();
    controller.GetTime_since_charging_started();
    controller.GetPower_w();
    controller.GetAuth_uid();
    // TODO: implement initState
    super.initState();
  }

  setIp() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('ip', ipAddress.toString());
  }

  getAuthStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getString('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getAuthStatus(),
          builder: (context, snapshot) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Theme.of(context).primaryColor,
                      height: 90,
                      width: sw,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${english ? 'Home Page' : 'Startseite'}',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10,
                                  color: Theme.of(context).primaryColor)),
                          child: Center(
                            child: Obx(() => Text(
                                  '${controller.Transaction_wh} kWh',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${english ? 'Connection Status' : 'Verbindungsstatus'}:  ',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Obx(() => Text(
                              '${controller.conn_state}',
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${english ? 'Authentication Status' : 'Authentifizierungsstatus'}:  ',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Obx(() => Text(
                              '${controller.auth_state}',
                              overflow: TextOverflow.fade,
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${english ? 'auth_id' : 'Aktuell angemeldet:'}:  ',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Obx(() => Text(
                              '${controller.auth_uid}',
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 10)
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${english ? 'Charging Current' : 'Ladestrom'}:',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(() => Center(
                                child: Text(
                                  '${controller.current_a.replaceAll(',', ' A\n') + ' A'}',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 10)
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${english ? 'Charging Time' : 'Ladedauer'}:',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(() => Center(
                                child: Text(
                                  controller.time_since_charging_start
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 10)
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${english ? 'Current Charging Power' : 'Aktuelle Ladeleistung'}:',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(() => Center(
                                child: Text(
                                  '${controller.power_w} kW',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  String formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(0, '2');
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }
}
