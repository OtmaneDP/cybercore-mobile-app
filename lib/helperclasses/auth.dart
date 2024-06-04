

import 'dart:convert';

import 'package:fluttertest/helperclasses/apirequestgenirator.dart';
import 'package:fluttertest/helperclasses/jwt_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' ;

class Auth {

  static String  tokenKey = "user_access_token";

  static Future <String?> isLogedIn() async{
   
    final storage = await SharedPreferences.getInstance();
    String? userToken = storage.getString(tokenKey);
    
    if(userToken == null){
      return null;
    }
    Map  expireAt = JwtValidator.getJsonJwtPayload(userToken);

    if(JwtValidator.hasExpired(expireAt["exp"])){
      storage.remove(tokenKey);
      return null;
    }
    return userToken;
  }

  static Future <bool> storeToken(String token) async{
    final storage = await SharedPreferences.getInstance();
    await storage.setString("user_access_token", token);
    return true;
  }

  static Future <String?> user() async{
    var storage = await SharedPreferences.getInstance();

    var url =  Uri.parse(ApiRequestGenirator().genirateUrl("me"));
    var response = await http.post(url,
      headers:{"Accept": "application/json"},
      body: {
        "token" :  storage.getString(tokenKey),
      },
    );
    return response.body;
    
  }
  static Future <String?> getUserAccessToken() async{ 

    final storage = await SharedPreferences.getInstance();
    String? userToken = storage.getString(tokenKey);
    return userToken;

  }

  
}