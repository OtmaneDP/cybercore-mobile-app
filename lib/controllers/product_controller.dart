

import 'dart:convert';

import 'package:fluttertest/helperclasses/apirequestgenirator.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:http/http.dart' as http;

class ProductController{


  static Future <String?> getAll()async{
    String? userToken = await Auth.getUserAccessToken();
    String? userInfo = await Auth.user();
    
    userToken = userToken.toString();
    Map user = jsonDecode(userInfo.toString());
    var userId = user["data"]["id"];

    var url = Uri.parse(ApiRequestGenirator().genirateUrl("product/all?token=${userToken}&user_id=${userId}")); 
    var response = await http.get(url,
      headers: {"Accept":"application/json"},
    );
    return response.body;
  }

  static Future <String?> addToCart({required int productId, required String color}) async{
    String? userToken = await Auth.getUserAccessToken();
    String? userInfo = await Auth.user();

    Map user = jsonDecode(userInfo.toString());
    userToken = userToken.toString();
    
    var url = Uri.parse(ApiRequestGenirator().genirateUrl("product/addToCart")); 
    var  response = await http.post(url,
      headers: {"Accept":"application/json"},
      body: {
        "user_id" : user["data"]["id"].toString(),
        "product_id": productId.toString(), 
        "color" : color , 
        "token" : userToken,
      }
    );
    
    Map responseBody = jsonDecode(response.body); 
    if(responseBody["status_code"] == 202){
      print("products added to cart withe succedully...");
    }else{

      print("somthing error try again ");
    }
    print(response.body);
    return response.body;

  }
  static List createProductItemArray(Map? products){
    List productItems = [];
    for(int i =0 ; i < products!["data"].length; i++){
      productItems.add({ 
        "product_id" : products["data"][i]["product_id"], 
        "contete" : products["data"][i]["contete"],
      });
    }
    return productItems;
  }

  static Future <String ?> getCartItems() async{
    String? userInfo = await Auth.user();

    Map user = jsonDecode(userInfo.toString());
    String? userToken = await Auth.getUserAccessToken();

    String userId = user["data"]["id"].toString();
    userToken = userToken.toString();

    var url = Uri.parse(ApiRequestGenirator().genirateUrl("product/inCartItems?user_id=${userId}&token=${userToken}")); 
    var response = await http.get(url,
      headers: {"Accept":"application/json"},
    );

    return response.body;
  }

  static Future <String?> deleteFromCart({required int productId}) async{
    String? userInfo = await Auth.user();

    Map user = jsonDecode(userInfo.toString());
    String? userToken = await Auth.getUserAccessToken();

    String userId = user["data"]["id"].toString();
    userToken = userToken.toString();

    var url = Uri.parse(ApiRequestGenirator().genirateUrl("product/deleteFromCart"));
    var response =await  http.post(url,headers: {"Accept" : "application/json"},
       body: {
          "user_id": userId, 
          "product_id":  productId.toString(),
          "token": userToken, 
       }
    );
    print(response.body);
    return response.body;
  }
}