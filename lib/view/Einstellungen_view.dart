import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_box/constants/Constants.dart';
import 'package:wall_box/controller/einstellungen_controller.dart';
import 'package:wall_box/controller/globalVariables_controller.dart';
import '../controller/home_controller.dart';
import '../controller/statistiken_controller.dart';
import '../controller/system_controller.dart';

class Einstellungen_view extends StatefulWidget {
  const Einstellungen_view({Key, key}) : super(key: key);

  @override
  _Einstellungen_viewState createState() => _Einstellungen_viewState();
}

class _Einstellungen_viewState extends State<Einstellungen_view> {
  einstellungen_controller controller = Get.put(einstellungen_controller());
  home_controller home = Get.put(home_controller());
  statistiken_controller statistiken = Get.put(statistiken_controller());
  system_controller system = Get.put(system_controller());
  // globalVariables_controller global = Get.put(globalVariables_controller());

  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();
  TextEditingController c7 = TextEditingController();
  TextEditingController c8 = TextEditingController();
  TextEditingController c9 = TextEditingController();
  TextEditingController c10 = TextEditingController();
  TextEditingController c11 = TextEditingController();

  globalVariables_controller con = Get.put(globalVariables_controller());

  @override
  void initState() {
    controller.GetSig_current();
    controller.GetAverage_electricity_cost();
    controller.GetAverage_co2_electricity();
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
                height: 90,
                width: sw,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        english ? 'Settings' : 'Einstellungen',
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
                height: 10,
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 1, blurRadius: 10)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english ? 'Charging current\t\t' : 'Ladestrom\t\t\t\t\t',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {},
                          child: Container(
                            height: 20,
                            child: Obx(
                              () => TextField(
                                controller: c1,
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.number,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 14),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  suffixIcon: const Text("A"),
                                  hintText: '${controller.sig_current.value}',
                                  hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                                onSubmitted: (value) {
                                  if (value.isEmpty || int.parse(value) >= 16) {
                                    Fluttertoast.showToast(
                                        msg: 'Value cannot be more than 16 A');

                                    c1.text = "0";
                                  } else {
                                    controller.sig_current.value =
                                        value.toString();

                                    controller.SendLadestrom(value);
                                    print('hello' +
                                        double.parse(value.toString())
                                            .toString());
                                    print(controller.sig_current.value
                                        .toString());
                                    c1.clear();
                                    c1.text = value;

                                    home.GetAuth_state();
                                    home.GetTransactions();
                                    home.GetTime_since_charging_started();
                                    home.GetPower_w();
                                    home.GetCurrent_a();
                                    home.GetConn_state();
                                    statistiken.GetEquilant_cost_of_gasoline();
                                    statistiken.GetCost_saving();
                                    statistiken.GetCost_of_charging_session();
                                    statistiken.GetCo2_fuel();
                                    statistiken.GetCo2_nature();
                                    statistiken.GetCo2_power();
                                    system.GetRcmb_value();
                                    system.GetRcmb_state();
                                    system.GetRcmb_max();
                                    system.GetMeterReading();
                                    system.GetMax_current();
                                    system.GetFirmware_ver();
                                    system.GetErrors();
                                    system.GetAuth_uid();
                                    system.GetCharging_state();
                                    system.GetAmbient_temp();
                                    controller.GetSig_current();
                                    controller.GetAverage_electricity_cost();
                                    controller.GetAverage_co2_electricity();
                                    controller.GetAuth_state();
                                    setState(() {});
                                  }
                                },
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english ? 'Free Charging' : 'Freies Laden',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 110,
                      child: FlutterSwitch(
                        width: 60.0,
                        height: 35.0,
                        toggleSize: 20.0,
                        value: status,
                        borderRadius: 30.0,
                        padding: 8.0,
                        activeColor: Theme.of(context).primaryColor,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                            controller.SetFreeCharging_On_Off(val);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english
                          ? 'Learning Mode \nin the RFID-Chip'
                          : 'RFID Chip anlernen',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 110,
                      child: FlutterSwitch(
                        width: 60.0,
                        height: 35.0,
                        toggleSize: 20.0,
                        value: status1,
                        borderRadius: 30.0,
                        padding: 8.0,
                        activeColor: Theme.of(context).primaryColor,
                        onToggle: (val) {
                          setState(() {
                            status1 = val;
                            controller.SetWhitelistLearning_On_Off(val);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 1, blurRadius: 10)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english
                          ? 'Percentage\nPhotovoltaic power\t'
                          : 'Anteil\nPhotovoltaikstrom\t',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              padding: EdgeInsets.symmetric(vertical: 10),
                            ),
                            onPressed: () {},
                            child: Container(
                              height: 20,
                              child: Obx(() => TextField(
                                    controller: c2,
                                    cursorColor: Colors.white,
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 14),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        suffixIcon: const Text(
                                          "%",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        hintText:
                                            '${con.share_of_photovoltaics_in_charging_electricity.value}',
                                        hintStyle: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                    onSubmitted: (value) {
                                      con.share_of_photovoltaics_in_charging_electricity
                                              .value =
                                          double.parse(value.toString());
                                      print('hello' +
                                          double.parse(value.toString())
                                              .toString());
                                      print(con
                                          .share_of_photovoltaics_in_charging_electricity
                                          .value
                                          .toString());
                                      c2.text = value.toString();
                                      home.GetAuth_state();
                                      home.GetTransactions();
                                      home.GetTime_since_charging_started();
                                      home.GetPower_w();
                                      home.GetCurrent_a();
                                      home.GetConn_state();
                                      statistiken
                                          .GetEquilant_cost_of_gasoline();
                                      statistiken.GetCost_saving();
                                      statistiken.GetCost_of_charging_session();
                                      statistiken.GetCo2_fuel();
                                      statistiken.GetCo2_nature();
                                      statistiken.GetCo2_power();
                                      system.GetRcmb_value();
                                      system.GetRcmb_state();
                                      system.GetRcmb_max();
                                      system.GetMeterReading();
                                      system.GetMax_current();
                                      system.GetFirmware_ver();
                                      system.GetErrors();
                                      system.GetAuth_uid();
                                      system.GetCharging_state();
                                      system.GetAmbient_temp();
                                      controller.GetSig_current();
                                      controller.GetAverage_electricity_cost();
                                      controller.GetAverage_co2_electricity();
                                      controller.GetAuth_state();
                                      setState(() {});
                                    },
                                  )),
                            ))),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english
                          ? 'Photovoltaic Costs    '
                          : 'Photovoltaik Kosten ',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {},
                          child: Container(
                            height: 20,
                            child: Obx(() => TextField(
                                  controller: c3,
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      suffixIcon: const Text("€/kWh"),
                                      hintText:
                                          '${con.photovoltaic_costs.value}',
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 14),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  onSubmitted: (value) {
                                    // print("Photo Voltaic Cost ===> $value");

                                    con.photovoltaic_costs.value =
                                        double.parse(value.toString());

                                    // print('hello' +
                                    //     double.parse(value.toString())
                                    //         .toString());
                                    // print(
                                    //     "Photo voltaic cost value saved==> ${con.photovoltaic_costs.value.toString()}");
                                    c3.text = value.toString();
                                    //  c3.text = value.toString() + '[€/kWh]';
                                    home.GetAuth_state();
                                    home.GetTransactions();
                                    home.GetTime_since_charging_started();
                                    home.GetPower_w();
                                    home.GetCurrent_a();
                                    home.GetConn_state();
                                    statistiken.GetEquilant_cost_of_gasoline();
                                    statistiken.GetCost_saving();
                                    statistiken.GetCost_of_charging_session();
                                    statistiken.GetCo2_fuel();
                                    statistiken.GetCo2_nature();
                                    statistiken.GetCo2_power();
                                    system.GetRcmb_value();
                                    system.GetRcmb_state();
                                    system.GetRcmb_max();
                                    system.GetMeterReading();
                                    system.GetMax_current();
                                    system.GetFirmware_ver();
                                    system.GetErrors();
                                    system.GetAuth_uid();
                                    system.GetCharging_state();
                                    system.GetAmbient_temp();
                                    controller.GetSig_current();
                                    controller.GetAverage_electricity_cost();
                                    controller.GetAverage_co2_electricity();
                                    controller.GetAuth_state();
                                    setState(() {});
                                  },
                                )),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english ? 'Electricity Costs\t\t' : 'Stromkosten \t\t\t ',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {},
                          child: Container(
                            height: 20,
                            child: Obx(() => TextField(
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 14),
                                  textAlign: TextAlign.center,
                                  controller: c4,
                                  decoration: InputDecoration(
                                      suffixIcon: const Text("€/kWh"),
                                      hintText:
                                          '${con.electricity_costs.value}',
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 14),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  onSubmitted: (value) {
                                    con.electricity_costs.value =
                                        double.parse(value.toString());
                                    controller.average_electricity_costs.value =
                                        double.parse(value.toString());
                                    // print('hello' +
                                    //     double.parse(value.toString())
                                    //         .toString());
                                    // print(
                                    //     con.electricity_costs.value.toString());
                                    // c4.text = value + '[€/kWh]';
                                    c4.text = value;
                                    home.GetAuth_state();
                                    home.GetTransactions();
                                    home.GetTime_since_charging_started();
                                    home.GetPower_w();
                                    home.GetCurrent_a();
                                    home.GetConn_state();
                                    statistiken.GetEquilant_cost_of_gasoline();
                                    statistiken.GetCost_saving();
                                    statistiken.GetCost_of_charging_session();
                                    statistiken.GetCo2_fuel();
                                    statistiken.GetCo2_nature();
                                    statistiken.GetCo2_power();
                                    system.GetRcmb_value();
                                    system.GetRcmb_state();
                                    system.GetRcmb_max();
                                    system.GetMeterReading();
                                    system.GetMax_current();
                                    system.GetFirmware_ver();
                                    system.GetErrors();
                                    system.GetAuth_uid();
                                    system.GetCharging_state();
                                    system.GetAmbient_temp();
                                    controller.GetSig_current();
                                    controller.GetAverage_electricity_cost();
                                    controller.GetAverage_co2_electricity();
                                    controller.GetAuth_state();
                                    setState(() {});
                                  },
                                )),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 1, blurRadius: 10)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english
                          ? 'Ø Electricity Costs\t\t'
                          : 'Ø Stromkosten \t\t ',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue.shade900,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {},
                          child: Text(
                            '${double.parse(controller.average_electricity_costs.value.toString()).toStringAsFixed(2)} [€/kWh]',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      !english
                          ? 'Benzinkosten\t\t\t\t'
                          : 'gasoline costs\t\t  ',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {},
                          child: Container(
                            height: 20,
                            child: Obx(() => TextField(
                                  controller: c5,
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      suffixIcon: const Text("€"),
                                      hintText: '${con.gasoline_costs.value}',
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 14),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  onSubmitted: (value) {
                                    con.gasoline_costs.value =
                                        double.parse(value);
                                    // print('hello' +
                                    //     double.parse(value.toString())
                                    //         .toString());
                                    // print(con.gasoline_costs.value.toString());
                                    c5.text = value;
                                    home.GetAuth_state();
                                    home.GetTransactions();
                                    home.GetTime_since_charging_started();
                                    home.GetPower_w();
                                    home.GetCurrent_a();
                                    home.GetConn_state();
                                    statistiken.GetEquilant_cost_of_gasoline();
                                    statistiken.GetCost_saving();
                                    statistiken.GetCost_of_charging_session();
                                    statistiken.GetCo2_fuel();
                                    statistiken.GetCo2_nature();
                                    statistiken.GetCo2_power();
                                    system.GetRcmb_value();
                                    system.GetRcmb_state();
                                    system.GetRcmb_max();
                                    system.GetMeterReading();
                                    system.GetMax_current();
                                    system.GetFirmware_ver();
                                    system.GetErrors();
                                    system.GetAuth_uid();
                                    system.GetCharging_state();
                                    system.GetAmbient_temp();
                                    controller.GetSig_current();
                                    controller.GetAverage_electricity_cost();
                                    controller.GetAverage_co2_electricity();
                                    controller.GetAuth_state();
                                    setState(() {});
                                  },
                                )),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english ? 'Power consumption\t' : 'Energieverbrauch\t',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {},
                          child: Container(
                            height: 20,
                            child: Obx(() => TextField(
                                  controller: c6,
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      suffixIcon: const Text("kWh/100km"),
                                      hintText:
                                          '${con.power_consumption.value}',
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 14),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  onSubmitted: (value) {
                                    con.power_consumption.value =
                                        double.parse(value.toString());
                                    // print('hello' +
                                    //     double.parse(value.toString())
                                    //         .toString());
                                    // print(
                                    //     con.power_consumption.value.toString());

                                    con.power_consumption.value =
                                        double.parse(value);

                                    c6.text = value;
                                    home.GetAuth_state();
                                    home.GetTransactions();
                                    home.GetTime_since_charging_started();
                                    home.GetPower_w();
                                    home.GetCurrent_a();
                                    home.GetConn_state();
                                    statistiken.GetEquilant_cost_of_gasoline();
                                    statistiken.GetCost_saving();
                                    statistiken.GetCost_of_charging_session();
                                    statistiken.GetCo2_fuel();
                                    statistiken.GetCo2_nature();
                                    statistiken.GetCo2_power();
                                    system.GetRcmb_value();
                                    system.GetRcmb_state();
                                    system.GetRcmb_max();
                                    system.GetMeterReading();
                                    system.GetMax_current();
                                    system.GetFirmware_ver();
                                    system.GetErrors();
                                    system.GetAuth_uid();
                                    system.GetCharging_state();
                                    system.GetAmbient_temp();
                                    controller.GetSig_current();
                                    controller.GetAverage_electricity_cost();
                                    controller.GetAverage_co2_electricity();
                                    controller.GetAuth_state();
                                    setState(() {});
                                  },
                                )),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english ? 'Gasoline consumption\t' : 'Benzinverbrauch\t ',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {},
                          child: Container(
                            height: 20,
                            child: Obx(() => TextField(
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 14),
                                  textAlign: TextAlign.center,
                                  controller: c7,
                                  decoration: InputDecoration(
                                      suffixIcon: const Text("l/100km"),
                                      hintText:
                                          '${con.gasoline_consumption.value}',
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 14),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  onSubmitted: (value) {
                                    con.gasoline_consumption.value =
                                        double.parse(value);
                                    // print('hello' +
                                    //     double.parse(value.toString())
                                    //         .toString());
                                    // print(con.gasoline_consumption.value
                                    //     .toString());
                                    c7.text = value;
                                    home.GetAuth_state();
                                    home.GetTransactions();
                                    home.GetTime_since_charging_started();
                                    home.GetPower_w();
                                    home.GetCurrent_a();
                                    home.GetConn_state();
                                    statistiken.GetEquilant_cost_of_gasoline();
                                    statistiken.GetCost_saving();
                                    statistiken.GetCost_of_charging_session();
                                    statistiken.GetCo2_fuel();
                                    statistiken.GetCo2_nature();
                                    statistiken.GetCo2_power();
                                    system.GetRcmb_value();
                                    system.GetRcmb_state();
                                    system.GetRcmb_max();
                                    system.GetMeterReading();
                                    system.GetMax_current();
                                    system.GetFirmware_ver();
                                    system.GetErrors();
                                    system.GetAuth_uid();
                                    system.GetCharging_state();
                                    system.GetAmbient_temp();
                                    controller.GetSig_current();
                                    controller.GetAverage_electricity_cost();
                                    controller.GetAverage_co2_electricity();
                                    controller.GetAuth_state();
                                    setState(() {});
                                  },
                                )),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CO2 ${english ? 'Gasoline' : 'Benzin\t'}      ',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              padding: EdgeInsets.symmetric(vertical: 10),
                            ),
                            onPressed: () {},
                            child: Container(
                              height: 20,
                              child: Obx(() => TextField(
                                    controller: c8,
                                    cursorColor: Colors.white,
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 14),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        suffixIcon: const Text("gCO2/l"),
                                        hintText: '${con.gasoline_CO2.value}',
                                        hintStyle: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                    onSubmitted: (value) {
                                      con.gasoline_CO2.value =
                                          double.parse(value.toString());
                                      print('hello' +
                                          double.parse(value.toString())
                                              .toString());
                                      print(con.gasoline_CO2.value.toString());
                                      c8.text = value;
                                      home.GetAuth_state();
                                      home.GetTransactions();
                                      home.GetTime_since_charging_started();
                                      home.GetPower_w();
                                      home.GetCurrent_a();
                                      home.GetConn_state();
                                      statistiken
                                          .GetEquilant_cost_of_gasoline();
                                      statistiken.GetCost_saving();
                                      statistiken.GetCost_of_charging_session();
                                      statistiken.GetCo2_fuel();
                                      statistiken.GetCo2_nature();
                                      statistiken.GetCo2_power();
                                      system.GetRcmb_value();
                                      system.GetRcmb_state();
                                      system.GetRcmb_max();
                                      system.GetMeterReading();
                                      system.GetMax_current();
                                      system.GetFirmware_ver();
                                      system.GetErrors();
                                      system.GetAuth_uid();
                                      system.GetCharging_state();
                                      system.GetAmbient_temp();
                                      controller.GetSig_current();
                                      controller.GetAverage_electricity_cost();
                                      controller.GetAverage_co2_electricity();
                                      controller.GetAuth_state();
                                      setState(() {});
                                    },
                                  )),
                            ))),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CO2 Diesel           ',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {},
                          child: Container(
                            height: 20,
                            child: Obx(() => TextField(
                                  controller: c9,
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      suffixIcon: const Text("gCO2/l"),
                                      hintText: '${con.diesel_CO2.value}',
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 14),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  onSubmitted: (value) {
                                    con.diesel_CO2.value =
                                        double.parse(value.toString());
                                    print('hello' +
                                        double.parse(value.toString())
                                            .toString());
                                    print(con.diesel_CO2.value.toString());
                                    c9.text = value;
                                    home.GetAuth_state();
                                    home.GetTransactions();
                                    home.GetTime_since_charging_started();
                                    home.GetPower_w();
                                    home.GetCurrent_a();
                                    home.GetConn_state();
                                    statistiken.GetEquilant_cost_of_gasoline();
                                    statistiken.GetCost_saving();
                                    statistiken.GetCost_of_charging_session();
                                    statistiken.GetCo2_fuel();
                                    statistiken.GetCo2_nature();
                                    statistiken.GetCo2_power();
                                    system.GetRcmb_value();
                                    system.GetRcmb_state();
                                    system.GetRcmb_max();
                                    system.GetMeterReading();
                                    system.GetMax_current();
                                    system.GetFirmware_ver();
                                    system.GetErrors();
                                    system.GetAuth_uid();
                                    system.GetCharging_state();
                                    system.GetAmbient_temp();
                                    controller.GetSig_current();
                                    controller.GetAverage_electricity_cost();
                                    controller.GetAverage_co2_electricity();
                                    controller.GetAuth_state();
                                    setState(() {});
                                  },
                                )),
                          )),
                    )
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CO2 ${english ? 'electricity' : 'Elektrizität'}    ',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {},
                          child: Container(
                            height: 20,
                            child: Obx(() => TextField(
                                  controller: c10,
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: const Text("gCO2/kWh"),
                                      ),
                                      hintText: '${con.electricity_CO2.value}',
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 14),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  onSubmitted: (value) {
                                    con.electricity_CO2.value =
                                        double.parse(value.toString());
                                    print('hello' +
                                        double.parse(value.toString())
                                            .toString());
                                    print(con.electricity_CO2.value.toString());
                                    c10.text = value;
                                    home.GetAuth_state();
                                    home.GetTransactions();
                                    home.GetTime_since_charging_started();
                                    home.GetPower_w();
                                    home.GetCurrent_a();
                                    home.GetConn_state();
                                    statistiken.GetEquilant_cost_of_gasoline();
                                    statistiken.GetCost_saving();
                                    statistiken.GetCost_of_charging_session();
                                    statistiken.GetCo2_fuel();
                                    statistiken.GetCo2_nature();
                                    statistiken.GetCo2_power();
                                    system.GetRcmb_value();
                                    system.GetRcmb_state();
                                    system.GetRcmb_max();
                                    system.GetMeterReading();
                                    system.GetMax_current();
                                    system.GetFirmware_ver();
                                    system.GetErrors();
                                    system.GetAuth_uid();
                                    system.GetCharging_state();
                                    system.GetAmbient_temp();
                                    controller.GetSig_current();
                                    controller.GetAverage_electricity_cost();
                                    controller.GetAverage_co2_electricity();
                                    controller.GetAuth_state();
                                    setState(() {});
                                  },
                                )),
                          )),
                    )
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CO2 Photovoltaics   ',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              padding: EdgeInsets.symmetric(vertical: 10),
                            ),
                            onPressed: () {},
                            child: Container(
                              height: 20,
                              child: Obx(() => TextField(
                                    controller: c11,
                                    cursorColor: Colors.white,
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 14),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        suffixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: const Text("gCO2/kWh"),
                                        ),
                                        hintText:
                                            '${con.photovoltaics_CO2.value}',
                                        hintStyle: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                    onSubmitted: (value) {
                                      c11.text = value;
                                      con.photovoltaics_CO2.value =
                                          double.parse(value.toString());
                                      print('hello' +
                                          double.parse(value.toString())
                                              .toString());
                                      print(con.photovoltaics_CO2.value
                                          .toString());
                                      home.GetAuth_state();
                                      home.GetTransactions();
                                      home.GetTime_since_charging_started();
                                      home.GetPower_w();
                                      home.GetCurrent_a();
                                      home.GetConn_state();
                                      statistiken
                                          .GetEquilant_cost_of_gasoline();
                                      statistiken.GetCost_saving();
                                      statistiken.GetCost_of_charging_session();
                                      statistiken.GetCo2_fuel();
                                      statistiken.GetCo2_nature();
                                      statistiken.GetCo2_power();
                                      system.GetRcmb_value();
                                      system.GetRcmb_state();
                                      system.GetRcmb_max();
                                      system.GetMeterReading();
                                      system.GetMax_current();
                                      system.GetFirmware_ver();
                                      system.GetErrors();
                                      system.GetAuth_uid();
                                      system.GetCharging_state();
                                      system.GetAmbient_temp();
                                      controller.GetSig_current();
                                      controller.GetAverage_electricity_cost();
                                      controller.GetAverage_co2_electricity();
                                      controller.GetAuth_state();
                                      setState(() {});
                                    },
                                  )),
                            ))),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english
                          ? 'Average CO2 \nelectricity\t\t\t '
                          : 'Durchschnittlicher \nCO2 Strom',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade900,
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        onPressed: () {},
                        child: Obx(() => Text(
                              '${controller.average_co2_electricity.value} [gCO2/kWh]',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 14),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english ? 'Choose Combustion' : 'Verbrennung wählen',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 130,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {
                            setState(() {
                              con.disel = !con.disel;
                            });
                            home.GetAuth_state();
                            home.GetTransactions();
                            home.GetTime_since_charging_started();
                            home.GetPower_w();
                            home.GetCurrent_a();
                            home.GetConn_state();
                            statistiken.GetEquilant_cost_of_gasoline();
                            statistiken.GetCost_saving();
                            statistiken.GetCost_of_charging_session();
                            statistiken.GetCo2_fuel();
                            statistiken.GetCo2_nature();
                            statistiken.GetCo2_power();
                            system.GetRcmb_value();
                            system.GetRcmb_state();
                            system.GetRcmb_max();
                            system.GetMeterReading();
                            system.GetMax_current();
                            system.GetFirmware_ver();
                            system.GetErrors();
                            system.GetAuth_uid();
                            system.GetCharging_state();
                            system.GetAmbient_temp();
                            controller.GetSig_current();
                            controller.GetAverage_electricity_cost();
                            controller.GetAverage_co2_electricity();
                            controller.GetAuth_state();
                            setState(() {});
                          },
                          child: Text(
                            '${con.disel == false ? "Gasoline" : "Diesel"}',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english ? 'Assign Name to RFID' : 'Namen zuweisen zu',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 110,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => startDialog());
                          },
                          child: Text(
                            'Start',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'IP-Address Wallbox',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 25),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {},
                          child: Container(
                              height: 20,
                              child: TextField(
                                cursorColor: Colors.white,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText:
                                        '${ipAddress.toString().split(":")[0]}',
                                    hintStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      // color: Colors.white.withOpacity(0.4),
                                      fontSize: 14,
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                                onSubmitted: (value) {
                                  ipAddress = value;
                                  print(ipAddress.toString());
                                  setIp();
                                  home.GetAuth_state();
                                  home.GetTransactions();
                                  home.GetTime_since_charging_started();
                                  home.GetPower_w();
                                  home.GetCurrent_a();
                                  home.GetConn_state();
                                  statistiken.GetEquilant_cost_of_gasoline();
                                  statistiken.GetCost_saving();
                                  statistiken.GetCost_of_charging_session();
                                  statistiken.GetCo2_fuel();
                                  statistiken.GetCo2_nature();
                                  statistiken.GetCo2_power();
                                  system.GetRcmb_value();
                                  system.GetRcmb_state();
                                  system.GetRcmb_max();
                                  system.GetMeterReading();
                                  system.GetMax_current();
                                  system.GetFirmware_ver();
                                  system.GetErrors();
                                  system.GetAuth_uid();
                                  system.GetCharging_state();
                                  system.GetAmbient_temp();
                                  controller.GetSig_current();
                                  controller.GetAverage_electricity_cost();
                                  controller.GetAverage_co2_electricity();
                                  controller.GetAuth_state();
                                  setState(() {});
                                },
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sw,
                padding: EdgeInsets.all(10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      english ? 'Language' : 'Sprache',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 130,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {
                            setState(() {
                              english = !english;
                            });
                            controller.changeLanguage();
                          },
                          child: Text(
                            '${english == true ? 'English' : 'German'}',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setIp() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('ip', ipAddress.toString());
  }
}

class startDialog extends StatelessWidget {
  startDialog({Key, key}) : super(key: key);
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 380,
        width: sw,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              english
                  ? '1. Log in to your Wallbox with your RFID chip.'
                  : '1. Melden Sie sich mit Ihrem RFID-Chip an Ihre Wallbox an.',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              english
                  ? '2. Enter your name here:\t\t\t'
                  : '2. Geben Sie Ihren Namen hier ein:',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                fillColor: Colors.grey.shade100,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                hintText: '...',
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              english ? '3. Press Ok' : '3. Drücken Sie OK',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        onPressed: () {
                          if (controller.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: !english
                                    ? 'Bitte Namen eingeben'
                                    : 'Please enter name');
                          } else {
                            einstellungen_controller()
                                .SetNameToRFID_uid(controller.text);
                          }
                        },
                        child: Text(
                          'OK',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 20),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          english ? 'Cancel' : 'Abbrechen',
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
}
