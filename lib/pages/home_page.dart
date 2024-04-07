

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/pages/login_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  HomePageState createState(){
    return HomePageState();
  }
}
@override
class HomePageState extends State<HomePage>{

    Widget build(BuildContext context){
           return Scaffold(
             appBar: AppBar(
                title: Text("first child",),
                backgroundColor:Color.fromARGB(255, 243, 243, 243),
                elevation: 5,
                shadowColor: Color.fromARGB(255, 255, 255, 255),
             ),
             body: Container(
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(255, 255, 249, 249),
              child: ListView(
                children: [
                    Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color:Colors.black),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        TextFormField()
                      ],),
                    ),
                ],
              ),
               
             ),
             bottomNavigationBar: Container(
               decoration: BoxDecoration(
                 color: Color.fromARGB(255, 236, 236, 236),
                 boxShadow: [
                    BoxShadow(
                      offset: Offset(0,10) ,
                      color:Colors.black,
                      blurRadius: 10,
                    ),
                 ],
               ),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: null, icon: Icon(Icons.home,color: Colors.blue,),
                     mouseCursor: MaterialStateMouseCursor.clickable,
                     splashColor: Colors.grey,
                  ),
                  IconButton(onPressed: null, icon: Icon(Icons.store,color: Colors.blue),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    splashColor: Colors.grey,
                  ),
                  IconButton(onPressed: null, icon:Icon(Icons.notifications,color: Colors.blue),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    splashColor: Colors.grey,
                  )
                ],
               ),
             ),
           );
    }


}