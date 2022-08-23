import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_box/constants/Urls.dart';
import 'package:wall_box/controller/globalVariables_controller.dart';
import 'package:wall_box/controller/statistiken_controller.dart';
import 'package:wall_box/controller/system_controller.dart';

import '../constants/Constants.dart';
import 'einstellungen_controller.dart';

class home_controller extends GetxController {
  var Transaction_wh = 0.0.obs;
  var conn_state = ''.obs;
  var auth_state = ''.obs;
  var current_a = '0.0'.obs;
  var time_since_charging_start = ''.obs;
  var power_w = 0.0.obs;
  var auth_uid = ''.obs;
  var amount_of_gasoline = 0.0.obs;
  statistiken_controller statistiken = Get.put(statistiken_controller());
  system_controller system = Get.put(system_controller());
  einstellungen_controller controller = Get.put(einstellungen_controller());

  CheckAgain() {
    Timer.periodic(Duration(seconds: 10), (timer) {
      // print(
      //     "Power Consumption = ${globalVariables_controller().power_consumption}");
      GetAuth_state();
      GetTransactions();
      GetTime_since_charging_started();
      GetPower_w();
      GetCurrent_a();
      GetConn_state();
      // GetAmountOfGasoline();
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
    });
  }

  GetTransactions() {
    // print(Uri.parse('http://$ipAddress$transaction_wh_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$transaction_wh_url'),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          Transaction_wh.value = double.parse(value.body) / 1000;
        }
      },
    );
  }

  // GetAmountOfGasoline() {
  //   // print(Uri.parse('http://$ipAddress$transaction_wh_url'));
  //   http
  //       .post(
  //     Uri.parse('http://$ipAddress$amount_of_gasoline'),
  //   )
  //       .then(
  //     (value) {
  //       if (value.statusCode == 200) {
  //         Transaction_wh.value = double.parse(value.body) / 1000;
  //       }
  //       print("object");
  //     },
  //   );
  // }

  GetAuth_uid() {
    // print(Uri.parse('http://$ipAddress$auth_uid_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$auth_uid_url'),
    )
        .then((value) {
      if (value.statusCode == 200) {
        SharedPreferences.getInstance().then((pref) {
          var data = pref.getString('${value.body}');
          if (data != null) {
            auth_uid.value = data.toString();
          } else {
            auth_uid.value = value.body.toString();
          }
        });
      }
    });
  }

  GetConn_state() {
    // print(Uri.parse('http://$ipAddress$conn_state_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$conn_state_url'),
    )
        .then((value) {
      if (value.statusCode == 200) {
        conn_state.value = value.body;
      }
    });
  }

  GetAuth_state() {
    // print(Uri.parse('http://$ipAddress$auth_state_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$auth_state_url'),
    )
        .then((value) {
      if (value.statusCode == 200) {
        auth_state.value = value.body;
        print("Auth State ${auth_state}");
      } else {
        print("Auth State ! = 200 ${auth_state}");
      }
    });
  }

  GetCurrent_a() {
    // print(Uri.parse('http://$ipAddress$current_a_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$current_a_url'),
    )
        .then((value) {
      if (value.statusCode == 200) {
        if (value.body == '')
          current_a.value = '0.0';
        else
          current_a.value = value.body;
      }
    });
  }

  GetTime_since_charging_started() {
    // print(Uri.parse('http://$ipAddress$time_since_charging_start_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$time_since_charging_start_url'),
    )
        .then((value) {
      // print("Time Since Charging Started: ${value.body}");
      if (value.statusCode == 200) {
        final d1 = Duration(
            seconds: int.parse(
                value.body.toString().replaceAll(new RegExp(r'[^0-9]'), '')));
        time_since_charging_start.value = value.body;
        time_since_charging_start.value =
            intoToTime(time_since_charging_start.value);
      }
    });
  }

  String intoToTime(String x) {
    int value = int.parse(x);
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    String hourLeft =
        h.toString().length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft =
        m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft =
        s.toString().length < 2 ? "0" + s.toString() : s.toString();

    String result = "$hourLeft:$minuteLeft:$secondsLeft";

    return result;
  }

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  GetPower_w() {
    // print(Uri.parse('http://$ipAddress$power_w_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$power_w_url'),
    )
        .then((value) {
      // print(value.statusCode);
      if (value.statusCode == 200) {
        power_w.value = double.parse(value.body) / 1000;
      }
    });
  }
}
