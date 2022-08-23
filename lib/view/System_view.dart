import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_box/constants/Constants.dart';
import 'package:wall_box/controller/system_controller.dart';
import 'package:wall_box/widgets/systemItem.dart';

import '../controller/home_controller.dart';

class System_view extends StatefulWidget {
  const System_view({Key,key}) : super(key: key);

  @override
  _System_viewState createState() => _System_viewState();
}

class _System_viewState extends State<System_view> {
  system_controller controller=Get.put(system_controller());
  home_controller home=Get.put(home_controller());

  @override
  void initState() {
    controller.GetCharging_state();
    controller.GetMax_current();
    controller.GetRcmb_state();
    controller.GetErrors();
    controller.GetAmbient_temp();
    controller.GetAuth_uid();
    controller.GetRcmb_max();
    controller.GetRcmb_value();
    controller.GetFirmware_ver();
    controller.GetMeterReading();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                height:90,
                width: sw,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('System',style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
           Obx(()=>   systemItemWidget(title: 'Firmware version:',description: '${controller.firmware_ver}',)),
        Obx(()=>systemItemWidget(title: !english?'RCMB der Zustand:':'RCMB State:',description: '${controller.rcmb_state}',)),
        Obx(()=>     systemItemWidget(title: english?'Error:':'Fehler:',description: '${controller.errors}',)),
            Obx(()=>  systemItemWidget(title: english?'Calculated Ambient Temperature:':'Berechnete Umgebungstemperatur:',description: '${controller.ambient_temp} °C',)),
              Obx(()=>systemItemWidget(title:  english?'Charge Mode:':'Lademodus:',description: '${controller.charging_state}',)),
              Obx(()=>systemItemWidget(title:  english?'Meter Reading:':'Zählerstand:',description: '${controller.meter_wh} kWh',)),
        Obx(()=>systemItemWidget(title:  english?'Maximum Charging Current:':'Maximaler Ladestrom:',description: '${controller.max_current} A',)),
            Obx(()=>  systemItemWidget(title:  english?'Currently Registered RFID-Card:':'Aktuell angemeldete RFID-Karte:',description: '${home.auth_uid}',)),
             Obx(()=> systemItemWidget(title:  english?'Current Fault Current:':'Aktueller Fehlerstrom:',description: '${controller.rcmb_value.replaceAll(',', ' A\n') + ' A'}',)),
            Obx(()=>  systemItemWidget(title:  english?'Maximum Fault Current:':'Maximaler Fehlerstrom:',description: '${controller.rcmb_max.replaceAll(',', ' A\n') + ' A'}',)),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
