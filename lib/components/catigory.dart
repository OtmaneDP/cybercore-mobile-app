

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Catigory extends StatelessWidget{
  Map? catigoryInfo ;
  bool? isNewtworkImage = true;
  bool? isSlected ;
  Catigory({
    super.key,
    this.catigoryInfo,
    this.isNewtworkImage,
    this.isSlected = false,
  });
  @override
  Widget build(BuildContext context){
      return Container(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width:  70,
            height: 70,
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(50),
              child: getImage()
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: isSlected! ?  Border.all(width: 2,color: Color.fromARGB(133, 124, 77, 255)) : null,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Color.fromARGB(123, 143, 102, 255),
                  blurRadius: 2,
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