

import 'dart:ffi';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Catigory extends StatelessWidget{
  Map? catigoryInfo ;
  bool? isNewtworkImage = true;
  int? activeCatigory;
  int? index ;
  Function(int)? onACtive; 
  Catigory({
    super.key,
    this.catigoryInfo,
    this.isNewtworkImage,
    this.index,
    this.onACtive,
    this.activeCatigory,
  });
  @override
  Widget build(BuildContext context){
      return InkWell(
        onTap: (){
          onACtive!.call(index!);
        },
        child: Container(
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
                color: Color.fromARGB(255, 250, 250, 250),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 2.5,color:activeCatigory == index ? const Color.fromARGB(255, 130, 85, 255) : const Color.fromARGB(255, 229, 229, 229)),
              ),
            ),
            Text(
             catigoryInfo!["name"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ],
        ),
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