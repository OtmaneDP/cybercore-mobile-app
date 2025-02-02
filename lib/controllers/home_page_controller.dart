

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/controllers/catigory_controller.dart';
import 'package:fluttertest/controllers/notification_controller.dart';
import 'package:fluttertest/controllers/product_controller.dart';
import 'package:fluttertest/pages/home_page.dart';

class HomePageController{



  Future <Widget> getView() async {
    try{

      String? productResponse = await ProductController.getAll();
      String? catigoryResponse = await CatigoryController.getAllCatigory();
      String? notifications = await NotificationController.getAll();

      Map allNotification = jsonDecode(notifications.toString());
      Map allCatigorys = jsonDecode(catigoryResponse.toString());
      Map allProducts = jsonDecode(productResponse.toString());
     
      return HomePage(
        products: allProducts["data"],
        catigorys: allCatigorys["data"],
        notifications: allNotification["data"],
      );
    }catch(e){
      return Container(
        color: Colors.red,
        child: Center(
          child:Text("Content have null value"),
        ),
      );
    }
 
   
  } 

}