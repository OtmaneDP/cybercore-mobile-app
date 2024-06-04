

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertest/components/costuminputfield.dart';
import 'package:fluttertest/controllers/resetpassword_controlle%20.dart';
import 'package:fluttertest/helperclasses/inpute_validator.dart';
import 'package:fluttertest/pages/changepassword_page.dart';
import 'package:fluttertest/pages/main_screen.dart';

class ResetPasswordPage extends StatefulWidget{
  
  String? currentEmail ; 
  String? valideToken;

  TextEditingController newPassworddController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey();

  ResetPasswordPage({
    super.key, 
    this.currentEmail, 
    this.valideToken,
  });

  ResetPasswordPageState createState(){
    return ResetPasswordPageState();
  }


}

class ResetPasswordPageState extends State <ResetPasswordPage>{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset password"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: 400,
          height: 500,
          child: Form(
            key: widget.resetPasswordFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Reset your password",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "Please enter your new password",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
               
                CostumInputField(
                  isPassword: true,
                  label: Text(
                    "new password",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.https,
                    color: Colors.grey,
                  ),
                  onChange: (value) => setState(() {
                    widget.newPassworddController.text = value;
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "the new password field is required";
                    }
                    return InputValidator.isValidPassword(value) == false &&
                            value.length <= 6
                        ? "invalid password"
                        : null;
                  },
                ),
                CostumInputField(
                  isPassword: true,
                  label: Text(
                    "confirme your password",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.https,
                    color: Colors.grey,
                  ),
                  sufixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                  onChange: (value) => setState(() {
                    widget.confirmPasswordController.text = value;
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "the confirm password is required";
                    }
                    if (value != widget.newPassworddController.text) {
                      return "checke your password";
                    }
                  },
                ),
                 Row(
                  children: [
                    Icon(Icons.check_circle_rounded,
                        color: Colors.deepPurpleAccent),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Your password must contain : ",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Opacity(
                      opacity: widget.newPassworddController.text.length >= 6
                          ? 1
                          : 0,
                      child: Icon(Icons.check_circle_rounded,
                          color: Colors.deepPurpleAccent),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "At Least 6 charecters",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: widget.newPassworddController.text.length >= 6
                              ? Colors.black
                              : Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Opacity(
                      opacity: InputValidator.isValidPassword(
                              widget.newPassworddController.text)
                          ? 1
                          : 0,
                      child: Icon(Icons.check_circle_rounded,
                          color: Colors.deepPurpleAccent),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Contain number",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: InputValidator.isValidPassword(
                                widget.newPassworddController.text)
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(alignment: Alignment.center,  
                  child: MaterialButton(
                    color: Colors.deepPurpleAccent,
                    textColor: Colors.white,
                    height: 50,
                    padding: EdgeInsets.only(left: 50,right: 50),
                    onPressed: () async{
                      if(widget.resetPasswordFormKey.currentState!.validate()){
                        var response = await ResetPasswordController.resetPassword(
                          email: widget.currentEmail, 
                          token: widget.valideToken, 
                          newPassword: widget.newPassworddController.text,
                        );
                        var responseBody = jsonDecode(response);
                        if(responseBody["status_code"] == 202){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                             return MainScreen();
                          }));
                        }
                      }
                    }, 
                    child: Text("Done",style: TextStyle(
                       fontSize: 16,
                    ),)),
                ),
              ],
            ),
          ),
        ),
      ),
    ); 
  } 

}