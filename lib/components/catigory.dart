

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Catigory extends StatelessWidget{
  Map? catigoryInfo ;
  bool? isNewtworkImage = true;
  Catigory({
    super.key,
    this.catigoryInfo,
    this.isNewtworkImage,
  });
  @override
  Widget build(BuildContext context){
      return Container(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width:  80,
            height: 80,
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(50),
              child: getImage()
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              // border: Border.all(width: 2,color: Colors.deepPurpleAccent),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Color.fromARGB(255, 220, 220, 220),
                  blurRadius: 5,
                  spreadRadius: 2,
                )
              ],
            ),
          ),
          Text(
           catigoryInfo!["name"],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(190, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }



  getImage(){
    return isNewtworkImage == true ? 
    Image.network(
      this.catigoryInfo!["image"]["image_path"],
      fit: BoxFit.contain,
      ) : Image.asset(
            catigoryInfo!["image"]["image_path"],
            fit: BoxFit.contain,
        ); 
  }
}