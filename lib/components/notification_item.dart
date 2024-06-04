import 'package:flutter/material.dart';
import 'package:fluttertest/controllers/notification_controller.dart';


class NotificationItem extends StatefulWidget {
  
   Map? notification;
  
  NotificationItem({
    super.key,
    this.notification,  
  });
  NotificationItemState createState(){
    return NotificationItemState();
  }
}


class NotificationItemState extends State <NotificationItem> {
  bool visiblity = true;
 

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visiblity,
      child: Container(
      
        decoration: BoxDecoration(
          color: Colors.white, 
          border: Border.all(width: 1, color: Color.fromARGB(255, 223, 223, 223)),
        ),
        child: ExpansionTile(
          backgroundColor: Colors.white,
          shape: Border.all(
              width: 1, color: const Color.fromARGB(255, 220, 220, 220)),
          title: RichText(
          text: TextSpan(
            text: "${widget.notification!["title"]} .", style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.w600),
            children: [
              TextSpan(text: '11m', style: TextStyle(
                color: Colors.grey,
                fontSize: 13),
              ),
            ],
          ),
         ),
          leading: Image.asset(
            "images/test.png",
            width: 30,
            height: 30,
          ),
          subtitle: Text(
            widget.notification!["content"],
            style: TextStyle(
                fontSize: 10, color: Color.fromARGB(255, 106, 106, 106), fontWeight: FontWeight.w600),
          ),
          children: [
            MaterialButton(
              onPressed: (){
                setState(() {
                  NotificationController.delete(notificationId: widget.notification!["id"]);
                  visiblity = false;
                });
              },
              child: Text("Done",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
              textColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4), 
                side: BorderSide(color: Colors.deepPurpleAccent, width: 1),
              ),
            ),
          ],
          childrenPadding: EdgeInsets.only(right: 20,bottom: 10),
          expandedAlignment: Alignment.centerRight,
        ),
      ),
    );
  }
}
