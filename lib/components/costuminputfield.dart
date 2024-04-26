


import 'dart:ffi';

import 'package:flutter/material.dart';

class CostumInputField extends StatelessWidget{
  final String? placholder;
  final Icon? sufixIcon;
  final Icon? prefixIcon;
  final Text? textErorr;
  final Text? label;
  static  OutlineInputBorder border =  OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 1,
              color: Colors.deepPurpleAccent,   
          ));

  const CostumInputField({
    super.key,
    this.placholder,
    this.sufixIcon,
    this.prefixIcon,
    this.textErorr,
    this.label
  });

  @override
  Widget build(BuildContext context){

       return  TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    label: this.label,
                    border: CostumInputField.border,
                    enabledBorder: CostumInputField.border,
                    focusedBorder:  CostumInputField.border,
                    prefixIcon: Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.only(left: 20),
                      child: this.prefixIcon,
                    ),
                    hintText: this.placholder,
                    suffixIcon:Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.only(right: 20),
                      child: this.sufixIcon,
                    ),
                    labelStyle: TextStyle(
                       color: Colors.grey
                    ), 
                  ),
                );
  
  }




}