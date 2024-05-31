

import 'dart:convert';


import 'package:fluttertest/components/custom_alert.dart';
import 'package:fluttertest/controllers/home_page_controller.dart';
import 'package:fluttertest/helperclasses/apirequestgenirator.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:fluttertest/models/user_model.dart';
import 'package:fluttertest/pages/home_page.dart';
import 'package:http/http.dart' as http;
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class  AuthController {
  BuildContext? context ; 
  AuthController(
    this.context
  );
  // static String? errorMessages;
  
  Future <bool> login(String email, String password) async{
    // user not  authurized by default  
    bool isAuthurized  = false;

    var url = Uri.parse(ApiRequestGenirator().genirateUrl("login"));
    var response = await http.post(url,
      headers: {
        "Accept" : "application/json",
      },
      body: {
        'email': email,
        'password': password
      }
    );
      var responseBody = jsonDecode(response.body); 
      if(responseBody["status_code"] == 202){

        // store token in shared prefrences
        Auth.storeToken(responseBody["access_token"]);
        isAuthurized = true;
      }else if(responseBody["status_code"] == 401){
        showDialog(context: context!,builder: (context){
          return CustomAlert(
              alertIcon: Icon(Icons.error,color: Colors.white,size: 50,),
              color: Colors.red,
              stateDescription: "username or password encorrect.. !",
              stateMessage: "Error",
          );
        });
      }
      return isAuthurized;
  }

  // Future<String> logOut() async{
  //   var url = Uri.parse(ApiRequestGenirator().genirateUrl("logout"));
  //   var response = await http.post(url,
  //     headers: {
  //       "Accept" : "application/json",
  //     },
  //     body: {
  //       "token" : 'token',
  //     }  
  //   );
  //   return response.body;
  // }

  Future <bool> register(String email, String password) async{
    bool isRegistred = false;
    var url = Uri.parse(ApiRequestGenirator().genirateUrl("register"));
    var response = await http.post(url,headers: {
      "Accept": "application/json",
    },
    body:{
      "email": email, 
      "password": password, 
    });
    var responseBody = jsonDecode(response.body);

    if(responseBody["status_code"] == 202){
      // this if hase success state
      showDialog(context: context! , builder: (context){
          return  CustomAlert(alertIcon: Icon(Icons.done, color: Colors.white,),
                         stateMessage: "Success", 
                         stateDescription: "Registred withe successfully press ok to login", 
                         color: Colors.green);
      });
    }
    if(responseBody["status_code"] == 409){
      // have conflite such as dublicated entrys 
      showDialog(context: context!,builder: (context){
          return CustomAlert(
              alertIcon: Icon(Icons.error,color: Colors.white,size: 50,),
              color: Colors.orange,
              stateDescription: "this invalid email try withe other email",
              stateMessage: "conflict",
          );
        });
    }
    return isRegistred;
  }

  static Future <Map?> changePassword({required String currentPassword, required String newPassword}) async{

    String? userToken = await Auth.getUserAccessToken();
    String? userInfo = await Auth.user();

    Map user = jsonDecode(userInfo.toString());
    userToken = userToken.toString();

    var url  = Uri.parse(ApiRequestGenirator().genirateUrl("changepassword"));
    var response = await http.post(url,headers:{"Accept" : "application/json"},
      body: {
        "user_id": user["data"]["id"].toString(), 
        "current_password": currentPassword, 
        "new_password": newPassword, 
        "token": userToken, 
      }
    ); 
    var responseBody = jsonDecode(response.body);

    return responseBody;

  }
}



