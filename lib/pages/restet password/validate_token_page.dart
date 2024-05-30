

import 'package:flutter/material.dart';
import 'package:fluttertest/components/costuminputfield.dart';
import 'package:fluttertest/pages/restet%20password/reset_password_page.dart';

class ValidateTokenPage extends StatefulWidget{
  
  ValidateTokenPage({super.key});

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
      body: Container(
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
              children : List.generate(8, (index) {
                return index.isOdd ? SizedBox(width: 25,) : Expanded(
                  child: CostumInputField(
                    isPassword: false,
                    placholder: "#",
                  )
                );
              } ),
            ),
            SizedBox(height: 20,),
            Text("Code expire in : 03:12"),
            SizedBox(height: 20,),
            MaterialButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return ResetPasswordPage();
              }));
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
    ); 
  }

}