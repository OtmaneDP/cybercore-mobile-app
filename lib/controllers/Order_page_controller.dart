
import 'dart:convert';

import 'package:fluttertest/helperclasses/apirequestgenirator.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:http/http.dart' as http;
class OrderPageController{

  static Future <bool>  placeOrder(List? cartItems,Map customer) async {
    String? userToken = await Auth.getUserAccessToken();
    String? userInfo = await Auth.user();

    Map user = jsonDecode(userInfo.toString());
    userToken = userToken.toString();
    List? preparedData = OrderPageController.prparingItemInfo(cartItems);
  
    var url = Uri.parse(ApiRequestGenirator().genirateUrl("order/placeOrder")); 
    var response = await  http.post(url, headers:{"Accept" : "application/json"},
    body:{

      "token" : userToken,
      "cart_cached_items" : jsonEncode(preparedData),
      "user_id" : user["data"]["id"].toString(),
      "name" : customer["name"], 
      "last_name" : customer["last_name"], 
      "phon_number" : customer["phon_number"], 
      "address_city": customer["full_address"],
      "amount" : customer["amount"].toString(), 
    }, 
    );

    var responseBody = jsonDecode(response.body.toString());
    if(responseBody["status_code"] == 202){
      return true;
    }
    return false;
  }
  
  static List? prparingItemInfo(List? items){
    List filtredProduct = [] ; 

    for(Map item in items!){
      filtredProduct.add(
        {
          "cart_item" : item["cart_item"], 
          "no_modifyed_item": {
            "product_id" : item["product"]["id"], 
            "contete" : item["product"]["contete"],
          }
        },
      );
    }
    return filtredProduct;
  }


}