

import 'package:fluttertest/helperclasses/apirequestgenirator.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:http/http.dart' as http;
class ProductController{


  static Future <String?> getAll()async{
    String? userToken = await Auth.getUserAccessToken();
    userToken = userToken.toString();
    var url = Uri.parse(ApiRequestGenirator().genirateUrl("product/all?token=${userToken}")); 
    var response = await http.get(url,
      headers: {"Accept":"application/json"},
    );
    return response.body;
  }

}