import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/costuminputfield.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage();

  @override
  ChangePasswordPageState createState() {
    return ChangePasswordPageState();
  }
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Go Back",style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w600,
        ),),
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
                  prefixIcon: Icon(Icons.https,color: Colors.grey,),
                  label: Text("password",style: TextStyle(
                    fontSize: 15,
                  ),),
                ),
                CostumInputField(
                  label: Text("new password",style: TextStyle(
                    fontSize: 15,
                  ),),
                  prefixIcon: Icon(Icons.https,color: Colors.grey,),
                  sufixIcon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                ),
                CostumInputField(
                  label: Text("confirme your password",style: TextStyle(
                    fontSize: 15,
                  ),),
                  prefixIcon: Icon(Icons.https,color: Colors.grey,),
                  sufixIcon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                ),
                Container(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width:305,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            child:Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Text("Your password most contain: ",style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),),
                        ],
                       ),
                     ),
                      Container(
                        width: 225,
                        padding: EdgeInsets.only(left: 40),
                        child: Text("At least of 6 charachters",style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                    ],
                  ),
                ),
                Container(alignment: Alignment.center,  
                  child: MaterialButton(
                    color: Colors.deepPurpleAccent,
                    textColor: Colors.white,
                    height: 50,
                    padding: EdgeInsets.only(left: 50,right: 50),
                    onPressed: (){
                      print("hellow wolrd");
                    }, 
                    child: Text("Save Change",style: TextStyle(
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
