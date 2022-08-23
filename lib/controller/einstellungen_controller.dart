import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';
import 'package:wall_box/constants/Urls.dart';
import 'package:wall_box/controller/system_controller.dart';

import '../constants/Constants.dart';
import 'globalVariables_controller.dart';
import 'home_controller.dart';
import 'package:wall_box/controller/home_controller.dart';

class einstellungen_controller extends GetxController {
  var stromkosten = '0,00'.obs;
  var sig_current = '0'.obs;
  var gasoline_costs = '0'.obs;
  var average_electricity_costs = 0.0.obs;
  var average_co2_electricity = 0.0.obs;

  globalVariables_controller con = Get.put(globalVariables_controller());

  GetAuth_state() {
    // print("IP Address===> $ipAddress\n");

    // print(
    //     "URL CALL RESULT====> ${Uri.parse('http://$ipAddress$auth_state_url')}");
    http
        .post(
      Uri.parse('http://$ipAddress$auth_state_url'),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          // auth_state.value = value.body;
          // print("AUTH STATE = ${value.body}");
        }
      },
    );
  }

  GetAverage_electricity_cost() {
    // print("Average Electricity calculations called");

    // print(
    //   "Values are \n PhotoValtaic Cost =  ${con.photovoltaic_costs.value}\n Photovoltaic Share = ${con.share_of_photovoltaics_in_charging_electricity.value}\n",
    // );
    var average_electricity_cost = ((con.photovoltaic_costs.value *
                con.share_of_photovoltaics_in_charging_electricity.value) /
            100) +
        ((con.electricity_costs *
                (100 -
                    con.share_of_photovoltaics_in_charging_electricity.value)) /
            100);
    // print('average_electricity_cost:'+average_electricity_cost.toString());
    average_electricity_costs.value = average_electricity_cost;
    con.cost_of_charging_session.value =
        (home_controller().Transaction_wh) * average_electricity_cost;

    // print(
    //     "$average_electricity_cost\n${home_controller().Transaction_wh}\n Cost of charging session = ${con.cost_of_charging_session}");

    // con.electricity_costs.value = average_electricity_cost;
    // print("Result = ${average_electricity_costs.value}");
  }

  GetSig_current() {
    // print(Uri.parse('http://$ipAddress$sig_current_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$sig_current_url'),
    )
        .then(
      (value) {
        // print(value.statusCode);
        if (value.statusCode == 200) {
          sig_current.value = value.body;
        }
      },
    );
  }

  GetAverage_co2_electricity() {
    var average_co2_electricitys = ((con.photovoltaics_CO2 *
                con.share_of_photovoltaics_in_charging_electricity.value) /
            100) +
        ((con.electricity_CO2 *
                (100 -
                    con.share_of_photovoltaics_in_charging_electricity.value)) /
            100);
    // print("average_co2_electricity:"+average_co2_electricitys.toString());
    average_co2_electricity.value = average_co2_electricitys;
  }

  SetFreeCharging_On_Off(bool value) {
    var auth = 'Basic ' + base64Encode(utf8.encode('operator:yellow_zone'));
    var cond;
    value == true ? cond = 'on' : cond = 'off';
    // print(Uri.parse('http://$ipAddress$FreeCharging_vehicleif_url?FreeCharging_vehicleif=$cond&SUBMITTYPE=0d'));
    var url =
        'http://$ipAddress$FreeCharging_vehicleif_url?FreeCharging_vehicleif=$cond&SUBMITTYPE=0d';
    var headers = {
      HttpHeaders.authorizationHeader: '$auth',
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    };
    http.post(Uri.parse(url), headers: headers).then(
      (value) {
        // print('hello' + value.statusCode.toString());
        // print(value.body);
        if (value.statusCode == 200) {
          Fluttertoast.showToast(
              msg: !english
                  ? 'Geschaltetes freies Laden'
                  : 'Switched Free Charging $cond');
        } else {
          Fluttertoast.showToast(
            msg: english
                ? 'Failed to Switch Free Charging $cond'
                : 'Freies Laden konnte nicht umgeschaltet werden $cond',
          );
        }
        // var get = http.get(Uri.parse(url), headers: headers).then((value) {
        //   print(value.statusCode);
        // });
      },
    );
  }

  SetWhitelistLearning_On_Off(bool value) {
    var auth = 'Basic ' + base64Encode(utf8.encode('operator:yellow_zone'));
    var cond;
    value == true ? cond = 'on' : cond = 'off';
    // print(Uri.parse(
    //     'http://$ipAddress$FreeCharging_vehicleif_url?FLLFillMode_fll=${value == true ? 1 : 0}&SUBMITTYPE=0d'));
    http.post(
        Uri.parse(
            'http://$ipAddress$FreeCharging_vehicleif_url?FLLFillMode_fll=1&SUBMITTYPE=0d'),
        headers: {
          HttpHeaders.authorizationHeader: '$auth',
          HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
        }).then((value) {
      // print('hello' + value.statusCode.toString());
      // print(value.body);
      if (value.statusCode == 200) {
        Fluttertoast.showToast(
          msg: english ? 'Switched $cond' : 'Geschaltet $cond',
        );
      } else {
        Fluttertoast.showToast(
            msg: english
                ? 'Failed to Switch $cond'
                : 'Wechsel fehlgeschlagen $cond');
      }
    });
  }

  SendLadestrom(var value) {
    var auth = 'Basic ' + base64Encode(utf8.encode('operator:yellow_zone'));
    var cond;
    // print(Uri.parse('http://$ipAddress$FreeCharging_vehicleif_url?OperatorCurrentLimit_vehicleif=$value&SUBMITTYPE=0d'));
    http.post(
        Uri.parse(
            'http://$ipAddress$FreeCharging_vehicleif_url?OperatorCurrentLimit_vehicleif=$value&SUBMITTYPE=0d'),
        headers: {
          HttpHeaders.authorizationHeader: '$auth',
          HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
        }).then((value) {
      // print('hello' + value.statusCode.toString());
      // print(value.body);
    });
  }

  SetNameToRFID_uid(var name) async {
    home_controller home = Get.put(home_controller());
    // print(Uri.parse('http://$ipAddress$auth_uid_url'));
    http
        .post(
      Uri.parse('http://$ipAddress$auth_uid_url'),
    )
        .then((value) {
      if (value.statusCode == 200) {
        SharedPreferences.getInstance().then((pref) {
          pref.setString('${value.body}', '${value.body}').then((p0) {
            var data = pref.getString('${value.body}');
            if (data != null) {
              home.auth_uid.value = data.toString();
            } else {
              home.auth_uid.value = value.body.toString();
            }
          });
        });
      }
    });
    Fluttertoast.showToast(
        msg: english ? 'Name updated' : 'Namen aktualisiert');
  }

  changeLanguage() {}
}
