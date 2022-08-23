import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:wall_box/constants/Constants.dart';
import 'package:wall_box/constants/Urls.dart';

class login_contoller {
  // Future<bool> autoLogin() async {
  //   // print("URI Parse: ${Uri.parse('http://$ipAddress$login_url')}");
  //   var auth = 'Basic ' + base64Encode(utf8.encode('operator:yellow_zone'));
  //   http
  //       .get(Uri.parse('http://$ipAddress$login_url'), headers: {
  //         HttpHeaders.authorizationHeader: '$auth',
  //         HttpHeaders.contentTypeHeader: 'application/json',
  //       })
  //       .timeout(
  //         Duration(seconds: 4),
  //       )
  //       .then(
  //         (value) {
  //           // print(value.body);
  //           if (value.statusCode == 200) {
  //             authToken = jsonDecode(value.body)['token'];
  //             return true;
  //           } else {
  //             print("object");
  //             return false;
  //           }
  //         },
  //       )
  //       .onError(
  //         (error, stackTrace) {
  //           print("Could not login");
  //           return false;
  //         },
  //       );
  // }

  login() async {
    // print("URI Parse: ${Uri.parse('http://$ipAddress$login_url')}");
    var auth = 'Basic ' + base64Encode(utf8.encode('operator:yellow_zone'));
    http.get(Uri.parse('http://$ipAddress$login_url'), headers: {
      HttpHeaders.authorizationHeader: '$auth',
      HttpHeaders.contentTypeHeader: 'application/json',
    })
        // .timeout(
        //   Duration(seconds: 4),
        // )
        .then(
      (value) {
        // print(value.body);
        if (value.statusCode == 200) {
          authToken = jsonDecode(value.body)['token'];
        } else {
          print("object");
        }
      },
      // )
      // .onError((error, stackTrace) {
      //   print("Could not login");
      // }
    );
  }
}
