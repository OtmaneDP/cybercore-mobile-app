

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertest/components/custom_progress.dart';
import 'package:fluttertest/helperclasses/apirequestgenirator.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:fluttertest/pages/notification_page.dart';
import 'package:http/http.dart' as http;
class NotificationController{


  static Future <String> getAll() async{
     String? userInfo = await Auth.user();

    Map user = jsonDecode(userInfo.toString());
    String? userToken = await Auth.getUserAccessToken();

    String userId = user["data"]["id"].toString();
    userToken = userToken.toString();

    var url = Uri.parse(ApiRequestGenirator().genirateUrl("notification/getAll?user_id=${userId}&token=${userToken}")); 
    var response = await http.get(url, headers:{"Accept": "application/json"});
    
    return response.body;
  }
  static Future <String> delete({required int notificationId}) async{
    String? userInfo = await Auth.user();

    Map user = jsonDecode(userInfo.toString());
    String? userToken = await Auth.getUserAccessToken();

    String userId = user["data"]["id"].toString();
    userToken = userToken.toString();
     var url = Uri.parse(ApiRequestGenirator().genirateUrl("notification/delete")); 
    var response = await http.delete(url, headers: {"Accept" : "application/json"},
      body: {
        "user_id" : userId, 
        "notification_id" : notificationId.toString(), 
        "token" : userToken 
      }
    ); 
    print(response.body);
    return response.body;
  }
   static Future <String> update({required int isRead}) async{
    String? userInfo = await Auth.user();

    Map user = jsonDecode(userInfo.toString());
    String? userToken = await Auth.getUserAccessToken();

    String userId = user["data"]["id"].toString();
    userToken = userToken.toString();
     var url = Uri.parse(ApiRequestGenirator().genirateUrl("notification/update")); 
    var response = await http.post(url, headers: {"Accept" : "application/json"},
      body: {
        "user_id" : userId, 
        "is_read" : isRead.toString(),
        "token" : userToken,
      }
    ); 
    
    return response.body;
  }


  getView() {
    return FutureBuilder(future: getAll(), builder: (context, snapshot){
      var data = jsonDecode(snapshot.data.toString());
       if (snapshot.connectionState == ConnectionState.waiting) {
        // While data is loading
        return CustomeProgress();
      }
       return NotificationPage(notifications: data["data"]);
    });
     
  }

}