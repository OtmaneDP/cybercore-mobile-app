

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertest/components/custom_progress.dart';
import 'package:fluttertest/helperclasses/apirequestgenirator.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:fluttertest/pages/favorite_page.dart';

import 'package:http/http.dart' as http ;

import 'product_controller.dart';

class FavoriteController {


  static Future <String> addToFavorite({required int productId}) async{
    
    String? userToken = await Auth.getUserAccessToken();
    String? userInfo = await Auth.user();
    
    userToken = userToken.toString();
    Map user = jsonDecode(userInfo.toString());
    var userId = user["data"]["id"].toString(); 

    var url = Uri.parse(ApiRequestGenirator().genirateUrl("product/addToFavorite"));
    
    var response = await http.post(url,headers: {"Accept" : "application/json"}, 
      body: {
        "product_id": productId.toString(), 
        "user_id": userId, 
        "token" : userToken, 
      }
    ); 
    print(response.body);
    return response.body;

  }
  static Future <String> popFromFavorite({required int productId}) async{
    
    String? userToken = await Auth.getUserAccessToken();
    String? userInfo = await Auth.user();
    
    userToken = userToken.toString();
    Map user = jsonDecode(userInfo.toString());
    var userId = user["data"]["id"].toString(); 

    var url = Uri.parse(ApiRequestGenirator().genirateUrl("product/popFromFavorite"));
    
    var response = await http.post(url,headers: {"Accept" : "application/json"}, 
      body: {
        "product_id": productId.toString(), 
        "user_id": userId, 
        "token" : userToken, 
      }
    ); 
    return response.body;

  }
  static Future <String> getFavoriteProducts() async{
    
    String? userToken = await Auth.getUserAccessToken();
    String? userInfo = await Auth.user();
    
    userToken = userToken.toString();
    Map user = jsonDecode(userInfo.toString());
    var userId = user["data"]["id"].toString(); 

    var url = Uri.parse(ApiRequestGenirator().genirateUrl("product/favorite"));
    
    var response = await http.post(url,headers: {"Accept" : "application/json"}, 
      body: {
        "user_id": userId, 
        "token" : userToken, 
      }
    ); 

    return response.body;

  }

  getView(){
     return FutureBuilder(future: getFavoriteProducts(), builder: (context,snapshot){
      Map? favoritedProducts = jsonDecode(snapshot.data.toString());
       if (snapshot.connectionState == ConnectionState.waiting) {
        // While data is loading
        return CustomeProgress();
      }
      return FavoritePage(favoritedProducts: favoritedProducts!["data"],);
  });
  }
  

}