



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountableIcon extends StatelessWidget{
   IconData? icon ; 
   int? counter ; 
   Function(int)? onClick ;
   int? index; 
   int? activeIconIndex; 

   CountableIcon({
    super.key, 
    this.icon , 
    this.counter,
    this.onClick, 
    this.index, 
    this.activeIconIndex,
   });
  
  @override 

  Widget build(BuildContext context){
    return   Container(
              child:Stack(
                clipBehavior: Clip.none,
                children: [
                   IconButton(
                  onPressed: () {
                    if(onClick != null){
                      onClick!.call(index!);
                    }
                  },
                  icon: Icon(this.icon!, color: index == activeIconIndex ? Colors.deepPurpleAccent :   Colors.grey)),
                  Visibility(
                    visible: this.counter == 0 || this.counter == 0  ? false : true,
                    child: Positioned(
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.red, 
                          borderRadius: BorderRadius.circular(50)),
                          child: Text("${this.counter}",style: TextStyle(color: Colors.white,fontSize: 9.5,fontWeight: FontWeight.w700),),
                      ),
                    ),
                  ),
                ],
              ),
            );
  }


}