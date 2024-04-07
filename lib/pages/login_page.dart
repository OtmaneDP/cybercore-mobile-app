

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

  const LoginPage({super.key});

  LoginPageState createState(){
    return LoginPageState();
  }
  
}
class LoginPageState extends State<LoginPage>{

   
   Widget build(BuildContext context){

        return Scaffold(
           appBar: AppBar(
                title: Text("last  child"),
                backgroundColor: Colors.lightBlueAccent,
                elevation: 10,
                shadowColor: Color.fromARGB(255, 3, 1, 1),
             ),
          body: Container(
            alignment: Alignment.center,
            child:Text ("login page"),
          ),
        );
   }
   
}