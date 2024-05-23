

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAlert extends StatelessWidget{
   
  final  Icon alertIcon;
  final String stateMessage;
  final String stateDescription;
  final Color color;

  const CustomAlert({
    super.key,
    required this.alertIcon,
    required this.stateMessage, 
    required this.stateDescription, 
    required this.color,
  });
  
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      content: Container(
        height: 100,
        child:this.alertIcon,
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:this.color,
      ),
      ),
      contentPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
      actionsPadding: EdgeInsets.all(10),
      actions: [
        Container(

          alignment: Alignment.center,
          child: Column(children: [
            Text(this.stateMessage,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),), 
            Text(this.stateDescription),
          ],),
        ),
        Container(
          height: 50,
          alignment: Alignment.bottomCenter,
          child: MaterialButton(
            textColor: Colors.white,
            color: Colors.deepPurpleAccent,
            onPressed:(){
              Navigator.of(context).pop();
            },
            child:Text("Ok",style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
          
          ),),),
        )
      ],
    ); 
  }

}