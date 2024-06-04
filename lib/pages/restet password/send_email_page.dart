

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/components/costuminputfield.dart';
import 'package:fluttertest/components/custom_alert.dart';
import 'package:fluttertest/controllers/resetpassword_controlle%20.dart';
import 'package:fluttertest/helperclasses/inpute_validator.dart';
import 'package:fluttertest/pages/restet%20password/validate_token_page.dart';

class SendEmailPage extends StatefulWidget{

  TextEditingController emailController = TextEditingController(); 
  GlobalKey <FormState> resetFormKey = GlobalKey();
  SendEmailPage({super.key});

  SendEmailPageState createState(){
    return SendEmailPageState();
  }
}

class SendEmailPageState extends State <SendEmailPage>{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Email"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.email_outlined,
            size: 80,
            color: Colors.deepPurpleAccent,
          ),
          SizedBox(height: 40,),
          Text("Do You Forget Your Password ?",style: TextStyle(
            fontSize: 22,
            fontWeight:FontWeight.w600,
          ),),
          Text("Enter Your email to Reset your Password", style: TextStyle(
            color: Colors.grey,
          ) ,),
          SizedBox(height: 30,),
          Form(
            key: widget.resetFormKey,
            child:Column(children:[
            CostumInputField(
              isPassword: false, 
              prefixIcon: Icon(Icons.email,color: Colors.grey,),
              placholder: "example@gmail.com",
              onChange: (value){
                setState(() {
                  widget.emailController.text = value!;
                });
              },
              validator: (value){
                return InputValidator().emailValidator(value);
              },
            ),
            SizedBox(height: 20,),
            Text("the reset token will be send it to your email",style: TextStyle(
              color: Colors.grey,
            ),),
            SizedBox(height: 20,),
            MaterialButton(
              onPressed: ()async {
                if(widget.resetFormKey.currentState!.validate()){
                  var response =  await ResetPasswordController.sendToken(email: widget.emailController.text);
                  var responseBody = jsonDecode(response);
                  if(responseBody["status_code"] == 403){
                     showDialog(context: context, builder:  (context){
                        return CustomAlert(
                          alertIcon: Icon(Icons.warning_amber_rounded,color: Colors.white,size:50,), 
                          stateMessage: "Conflict", 
                          stateDescription: "this email Address is indefined", 
                          color: Colors.orange);
                     });
                  }
                  if(responseBody["status_code"] == 202){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                    return ValidateTokenPage(currentEmail: widget.emailController.text,); 
                  }));
                  }
                }
              },
              color: Colors.deepPurpleAccent,
              child: Text("Send",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),),
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 80),
              height: 45,
            ),
          ],)),

        ],),
      ),

    );
  }
}