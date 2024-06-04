

import 'dart:convert';

import 'package:fluttertest/helperclasses/apirequestgenirator.dart';
import 'package:fluttertest/helperclasses/auth.dart';
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

}