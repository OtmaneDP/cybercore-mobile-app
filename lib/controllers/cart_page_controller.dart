


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertest/controllers/product_controller.dart';
import 'package:fluttertest/helperclasses/apirequestgenirator.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:fluttertest/pages/cart_page.dart';
import 'package:http/http.dart' as http;

class CartPageController{


   
  static Future <String> updateCartItems(List updatedData) async {
    
    var url = Uri.parse(ApiRequestGenirator().genirateUrl("cartItems/update"));

    String? userToken = await Auth.getUserAccessToken();
    String? userInfo = await Auth.user();

    Map user = jsonDecode(userInfo.toString());
    userToken = userToken.toString();

    var response = await http.post(url, headers:{"Accept" : "application/json"},
      body: {
        "user_id": user["data"]["id"].toString(), 
        "updated_cart" : jsonEncode(updatedData),
        "token" : userToken,
      },
    );
    return response.body; 
  }
  
  getView(){

  return FutureBuilder(future: ProductController.getCartItems(), builder: (context,snapshot){
      Map? cartItems = jsonDecode(snapshot.data.toString());

      return CartPage(cartItems : cartItems!["data"]);
  });

 }


}