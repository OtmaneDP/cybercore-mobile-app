

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/components/costuminputfield.dart';
import 'package:fluttertest/pages/restet%20password/validate_token_page.dart';

class SendEmailPage extends StatefulWidget{
  
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
          Form(child:Column(children:[
            CostumInputField(
              isPassword: false, 
              prefixIcon: Icon(Icons.email,color: Colors.grey,),
              placholder: "example@gmail.com",
            ),
            SizedBox(height: 20,),
            Text("the reset token will be send it to your email",style: TextStyle(
              color: Colors.grey,
            ),),
            SizedBox(height: 20,),
            MaterialButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context){
                  return ValidateTokenPage(); 
                }));
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