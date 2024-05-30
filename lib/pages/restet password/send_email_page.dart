

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendEmailPage extends StatefulWidget{
  
  SendEmailPage({super.key});

  SendEmailPageState createState(){
    return SendEmailPageState();
  }
}

class SendEmailPageState extends State <SendEmailPage>{

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Send Email Page"),
        ),
      ),

    );
  }
}