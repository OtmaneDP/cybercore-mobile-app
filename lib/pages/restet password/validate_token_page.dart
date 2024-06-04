

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/components/costuminputfield.dart';
import 'package:fluttertest/components/custom_alert.dart';
import 'package:fluttertest/controllers/resetpassword_controlle%20.dart';
import 'package:fluttertest/pages/restet%20password/reset_password_page.dart';

class ValidateTokenPage extends StatefulWidget{
   
  String? currentEmail;
  TextEditingController? resetTokenController = TextEditingController();
  List token = [0,0,0,0,0,0];
  GlobalKey <FormState> validateFormKey= GlobalKey();

  ValidateTokenPage({
    super.key, 
    this.currentEmail,
  });

  ValidateTokenPageState createState(){
    return ValidateTokenPageState(); 
  }
 
}

class ValidateTokenPageState extends State <ValidateTokenPage>{

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("Validate Token"),
      ),
      body: Form(
        key: widget.validateFormKey ,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.mark_email_unread_sharp,color: Colors.deepPurpleAccent,size: 60,),
              SizedBox(height: 30,),
              Text("Check Your Email",style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),),
              Text("we've sent the code to your Email",style: TextStyle(
                color: Colors.grey,
              ),), 
              SizedBox(height: 30,),
              Row(
                children : List.generate(12, (index) {
                  return index.isOdd ? SizedBox(width: 10,) : Expanded(
                    child: CostumInputField(
                      length: 1,
                      formate: [FilteringTextInputFormatter.allow(RegExp(r'^\d$'))],
                      isPassword: false,
                      placholder: "#",
                      onChange: (value) {
                          int insertIn = index ~/ 2;
                         
                        setState(() {
                          widget.token[insertIn] = value; 
                        });
                    },
                    validator: (value){
                      if(value!.isEmpty){
                         return "";
                      }
                      if(value.length > 1){
                        return "";
                      }
                    },    
                    )
                  );
                } ),
              ),
              SizedBox(height: 10,),
              SizedBox(height: 20,),
              Text("Code expire in : 03:12"),
              SizedBox(height: 20,),
              MaterialButton(
                onPressed: () async{
                
                if(widget.validateFormKey.currentState!.validate()){
                  widget.resetTokenController!.text = widget.token.join("");
                  var response = await ResetPasswordController.verifyToken(
                    token: widget.resetTokenController!.text, 
                    email: widget.currentEmail!,
                  );
                  var responseBody = jsonDecode(response);
                  print(responseBody);
                  if(responseBody["status_code"] == 202){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return ResetPasswordPage(
                        currentEmail: widget.currentEmail,
                        valideToken: widget.resetTokenController!.text,
                      );
                    }));
                  }
                  if(responseBody["status_code"] == 403){
                     showDialog(context: context, builder: (context){
                        return CustomAlert(
                          alertIcon: Icon(Icons.warning, size: 50,color: Colors.white,), 
                          stateMessage: "conflict", 
                          stateDescription: "invalide Token please try again ",
                          color: Colors.orange);
                     });
                  }
                }
                }, 
                child: Text("Verify"),
                color: Colors.deepPurpleAccent,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 90),
                height: 50,
             
              ), 
              SizedBox(height: 15,), 
              MaterialButton(
              onPressed: (){
                // on press logic 
              },
              color: Colors.white,
              elevation: 0.2,
              child: Text(
                "Send Again",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 70),
              height: 50,
              textColor: Colors.deepPurpleAccent,
              shape: Border.all(color: Colors.deepPurpleAccent, width: 1),
            ),
              
              
            ],),
          ),
        ),
      ),
    ); 
  }

}