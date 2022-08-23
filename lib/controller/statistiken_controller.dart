import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wall_box/constants/Urls.dart';
import 'package:wall_box/controller/globalVariables_controller.dart';
import 'package:wall_box/controller/home_controller.dart';

import '../constants/Constants.dart';

class statistiken_controller extends GetxController {
  var stromkosten = 0.00.obs;
  var kraftstoffkosten = 0.00.obs;
  var einsoarungen = 0.00.obs;
  var co2_power = 0.00.obs;
  var co2_fuel = 0.00.obs;
  var co2_nature = 0.00.obs;
  globalVariables_controller con = Get.put(globalVariables_controller());

  // home_controller home_cont = Get.put(home_controller());

  ///transaction_wh is divided by 1000 when fetched
  GetCost_of_charging_session() {
    var average_electricity_cost = ((con.photovoltaic_costs.value *
                con.share_of_photovoltaics_in_charging_electricity.value) /
            100) +
        ((con.electricity_costs *
                (100 -
                    con.share_of_photovoltaics_in_charging_electricity.value)) /
            100);
    //  print('average_electricity_cost:'+average_electricity_cost.toString());
    var cost_of_charging_session =
        (home_controller().Transaction_wh) * average_electricity_cost;
    stromkosten.value = cost_of_charging_session;
    con.cost_of_charging_session.value = cost_of_charging_session;
  }

  ///transaction_wh is divided by 1000 when fetched
  GetEquilant_cost_of_gasoline() {
    var power_charged_distance =
        (home_controller().Transaction_wh.value / con.power_consumption.value) *
            10;
    //  print('power_charged_distance:'+power_charged_distance.toString());
    var amount_ofgasoline =
        (power_charged_distance * con.gasoline_consumption.value) / 100;
    //  print('amount_ofgasoline:'+amount_ofgasoline.toString());
    kraftstoffkosten.value = amount_ofgasoline * con.gasoline_costs.value;
    con.equivalent_cost_of_gasoline.value = kraftstoffkosten.value;
  }

  GetCost_saving() {
    var average_electricity_cost = ((con.photovoltaic_costs.value *
                con.share_of_photovoltaics_in_charging_electricity.value) /
            100) +
        ((con.electricity_costs *
                (100 -
                    con.share_of_photovoltaics_in_charging_electricity.value)) /
            100);
    // print('average_electricity_cost:'+average_electricity_cost.toString());
    ///calculated
    var cost_of_charging_session =
        (home_controller().Transaction_wh) * average_electricity_cost;
    var power_charged_distance =
        (home_controller().Transaction_wh.value / con.power_consumption.value) *
            10;
    // print('power_charged_distance:'+power_charged_distance.toString());
    var amount_ofgasoline =
        (power_charged_distance * con.gasoline_consumption.value) / 100;
    // print('amount_ofgasoline:'+amount_ofgasoline.toString());
    ///calculated
    var equilant_cost_of_gasoline =
        amount_ofgasoline * con.gasoline_costs.value;
    // einsoarungen.value = equilant_cost_of_gasoline * cost_of_charging_session;
    einsoarungen.value = con.equivalent_cost_of_gasoline.value -
        con.cost_of_charging_session.value;
  }

  GetCo2_fuel() {
    var power_charged_distance =
        (home_controller().Transaction_wh.value / con.power_consumption.value) *
            10;
    // print('power_charged_distance:'+power_charged_distance.toString());
    var amount_ofgasoline =
        (power_charged_distance * con.gasoline_consumption.value) / 100;
    // print('amount_ofgasoline:'+amount_ofgasoline.toString());
    var equilant_co2_gasoline;
    con.disel == true
        ? equilant_co2_gasoline =
            (amount_ofgasoline * con.diesel_CO2.value) / 1000
        : equilant_co2_gasoline =
            (amount_ofgasoline * con.gasoline_CO2.value) / 1000;
    // print('equilant_co2_gasoline:'+equilant_co2_gasoline.toString());
    co2_fuel.value = equilant_co2_gasoline;
  }

  GetCo2_power() {
    var average_co2_electricity = ((con.photovoltaics_CO2 *
                con.share_of_photovoltaics_in_charging_electricity.value) /
            100) +
        ((con.electricity_CO2 *
                (100 -
                    con.share_of_photovoltaics_in_charging_electricity.value)) /
            100);
    // print("average_co2_electricity:"+average_co2_electricity.toString());
    co2_power.value =
        home_controller().Transaction_wh * (average_co2_electricity / 1000);
  }

  GetCo2_nature() {
    var power_charged_distance =
        (home_controller().Transaction_wh.value / con.power_consumption.value) *
            10;
    // print('power_charged_distance:'+power_charged_distance.toString());
    var amount_ofgasoline =
        (power_charged_distance * con.gasoline_consumption.value) / 100;
    // print('amount_ofgasoline:'+amount_ofgasoline.toString());
    ///calculated
    var equilant_co2_gasoline =
        (amount_ofgasoline * con.gasoline_CO2.value) / 1000;
    // print('equilant_co2_gasoline:'+equilant_co2_gasoline.toString());
    var average_co2_electricity = ((con.photovoltaics_CO2 *
                con.share_of_photovoltaics_in_charging_electricity.value) /
            100) +
        ((con.electricity_CO2 *
                (100 -
                    con.share_of_photovoltaics_in_charging_electricity.value)) /
            100);
    // print("average_co2_electricity:"+average_co2_electricity.toString());
    ///calculated
    var co2_for_electricity =
        home_controller().Transaction_wh * (average_co2_electricity / 1000);
    co2_nature.value = equilant_co2_gasoline - co2_for_electricity;
  }
}
