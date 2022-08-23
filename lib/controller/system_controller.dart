import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';
import 'package:wall_box/constants/Urls.dart';

import '../constants/Constants.dart';

class system_controller extends GetxController {
  var charging_state = ''.obs;
  var max_current = ''.obs;
  var rcmb_state = ''.obs;
  var rcmb_max = ''.obs;
  var rcmb_value = ''.obs;
  var errors = ''.obs;
  var ambient_temp = ''.obs;
  var auth_uid = ''.obs;
  var auth_name = ''.obs;
  var firmware_ver = ''.obs;
  var meter_wh = ''.obs;

  GetCharging_state() {
    // print(Uri.parse('http://$ipAddress$type2_state_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$type2_state_url'),
    )
        .then((value) {
      if (value.statusCode == 200) {
        if (value.body == 'a') {
          charging_state.value = 'Not connected';
        } else if (value.body == 'b') {
          charging_state.value = 'B EV connected. Ready to charge';
        } else if (value.body == 'c') {
          charging_state.value = 'EV charging';
        } else if (value.body == 'd') {
          charging_state.value = 'EV charging, ventilation required ';
        } else if (value.body == 'e') {
          charging_state.value = 'Error ';
        }
      }
    });
  }

  GetMax_current() {
    // print(Uri.parse('http://$ipAddress$max_current_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$max_current_url'),
    )
        .then((value) {
      // print(value.statusCode);
      if (value.statusCode == 200) {
        max_current.value = value.body;
      }
    });
  }

  GetFirmware_ver() {
    // print(Uri.parse('http://$ipAddress$firmware_ver_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$firmware_ver_url'),
    )
        .then((value) {
      // print(value.statusCode);
      if (value.statusCode == 200) {
        firmware_ver.value = value.body;
      }
    });
  }

  GetMeterReading() {
    // print(Uri.parse('http://$ipAddress$meter_wh_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$meter_wh_url'),
    )
        .then((value) {
      // print(value.statusCode);
      if (value.statusCode == 200) {
        meter_wh.value = (int.parse(value.body
                    .toString()
                    .replaceAll(new RegExp(r'[^0-9]'), '')) /
                1000)
            .toString();
      }
    });
  }

  GetRcmb_state() {
    // print(Uri.parse('http://$ipAddress$rcmb_state_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$rcmb_state_url'),
    )
        .then((value) {
      // print(value.statusCode);
      if (value.statusCode == 200) {
        rcmb_state.value = value.body;
      }
    });
  }

  GetRcmb_max() {
    // print(Uri.parse('http://$ipAddress$rcmb_max_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$rcmb_max_url'),
    )
        .then((value) {
      // print(value.statusCode);
      if (value.statusCode == 200) {
        rcmb_max.value = value.body;
      }
    });
  }

  GetRcmb_value() {
    // print(Uri.parse('http://$ipAddress$rcmb_values_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$rcmb_values_url'),
    )
        .then((value) {
      // print(value.statusCode);
      if (value.statusCode == 200) {
        rcmb_value.value = value.body;
      }
    });
  }

  GetAmbient_temp() {
    // print(Uri.parse('http://$ipAddress$ambient_temp_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$ambient_temp_url'),
    )
        .then((value) {
      // print("auth_uid:" + value.statusCode.toString());
      if (value.statusCode == 200) {
        ambient_temp.value = value.body;
      }
    });
  }

  GetAuth_uid() {
    // print(Uri.parse('http://$ipAddress$auth_uid_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$auth_uid_url'),
    )
        .then((value) {
      // print(value.statusCode);
      if (value.statusCode == 200) {
        auth_uid.value = value.body;
        SharedPreferences.getInstance().then((value) => {
              auth_name.value =
                  value.getString(auth_uid.value.toString()).toString()
            });
      }
    });
  }

  GetErrors() {
    // print(Uri.parse('http://$ipAddress$Errors_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$Errors_url'),
    )
        .then(
      (value) {
        // print("h" + value.statusCode.toString());
        if (value.statusCode == 200) {
          var translate = GoogleTranslator();
          english
              ? translate
                  .translate(value.body, to: 'en')
                  .then((value) => {errors.value = value.text})
              : errors.value = value.body;
        }
      },
    );
  }
}
