

import 'package:fluttertest/helperclasses/apirequestgenirator.dart';
import 'package:http/http.dart' as http;

class ResetPasswordController{



  static Future <String> sendToken({required String email}) async{
    var url = Uri.parse(ApiRequestGenirator().genirateUrl("sendtoken"));
    var response = await http.post(url,
      headers: {
        "Accept" : "application/json",
      },
      body: {
        'email': email,
      }
    );
    print(response.body);
    return response.body;
  }

  static Future <String > verifyToken({required String token , required String email}) async{
    var url = Uri.parse(ApiRequestGenirator().genirateUrl("verifytoken"));
    var response = await http.post(url,
      headers: {
        "Accept" : "application/json",
      },
      body: {
        'email': email,
        'reset_token': token
      }
    );
    return response.body;
  }
  static Future <String > resetPassword({String? token , String? email, String? newPassword}) async{

    var url  = Uri.parse(ApiRequestGenirator().genirateUrl("resetpassword"));
    var response = await http.post(url,headers:{"Accept" : "application/json"},
      body: {
        "reset_token": token, 
        "email": email, 
        "reset_password": newPassword, 
      }
    ); 
    return response.body;
  }



}