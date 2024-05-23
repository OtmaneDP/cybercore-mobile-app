import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class JwtValidator{


  static Map <String , dynamic> getJsonJwtPayload(String token) {
    
    RegExp regex = RegExp(r'\.(.*)\.');
    Match  matche = regex.firstMatch(token)!;
    String payload = matche.group(1)! + "=";
    payload = utf8.decode(base64Decode(payload));

    return jsonDecode(payload);
  }

  static bool hasExpired(int timeExpirtion){

    DateTime now = DateTime.now();
    int currentTimeStempe = now.millisecondsSinceEpoch;

    return currentTimeStempe > timeExpirtion ?  false : true ;
  }
}