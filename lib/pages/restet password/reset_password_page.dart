

import 'package:flutter/material.dart';
import 'package:fluttertest/components/costuminputfield.dart';
import 'package:fluttertest/pages/changepassword_page.dart';

class ResetPasswordPage extends StatefulWidget{

  ResetPasswordPage({super.key});

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
                  isPassword: false,
                  prefixIcon: Icon(Icons.https,color: Colors.grey,),
                  label: Text("password",style: TextStyle(
                    fontSize: 15,
                  ),),
                ),
                CostumInputField(
                  isPassword: true,
                  label: Text("new password",style: TextStyle(
                    fontSize: 15,
                  ),),
                  prefixIcon: Icon(Icons.https,color: Colors.grey,),
                ),
                CostumInputField(
                  isPassword: true,
                  label: Text("confirme your password",style: TextStyle(
                    fontSize: 15,
                  ),),
                  prefixIcon: Icon(Icons.https,color: Colors.grey,),
                  sufixIcon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                ),
                Row(children: [
                  Icon(Icons.check_circle_rounded, color:Colors.deepPurpleAccent),
                  SizedBox(width: 10,),
                  Text("Your password must contain : ",style: TextStyle(fontSize: 17,color: Colors.grey),),
                ],),
                Row(children: [
                  Opacity(
                    opacity: 0,
                    child: Icon(Icons.check_circle_rounded, color:Colors.deepPurpleAccent),
                  ),
                  SizedBox(width: 10,),
                  Text("At Least 6 charecters" ,style: TextStyle(fontWeight: FontWeight.w600),),
                ],),
                Row(children: [
                  Opacity(opacity: 1,
                    child:Icon(Icons.check_circle_rounded, color:Colors.grey),),
                    SizedBox(width: 10,),
                    Text("Your password must contain"),
                ],),
                Container(alignment: Alignment.center,  
                  child: MaterialButton(
                    color: Colors.deepPurpleAccent,
                    textColor: Colors.white,
                    height: 50,
                    padding: EdgeInsets.only(left: 50,right: 50),
                    onPressed: (){
                      print("hellow wolrd");
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