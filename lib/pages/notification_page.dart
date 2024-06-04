

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/components/notification_item.dart';
import 'package:fluttertest/controllers/notification_controller.dart';

class NotificationPage extends  StatefulWidget{
  
  List? notifications;
  NotificationPage({
    super.key, 
    required this.notifications,
  });


  NotificationPageState createState(){
    return NotificationPageState(); 
  } 

}


class NotificationPageState extends State <NotificationPage>{


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: ListView.builder(
          itemCount: widget.notifications!.length,
          itemBuilder: (context, index){
            return  NotificationItem(
              notification: widget.notifications![index],
            );
          },
        ),
      ),
      
    );
  }
}