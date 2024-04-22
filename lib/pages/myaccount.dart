import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/main.dart';

class MyAccountPage extends StatefulWidget {
  MyAccountPage({super.key});

  MyAccountPageState createState() {
    return MyAccountPageState();
  }
}

class MyAccountPageState extends State<MyAccountPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Account"),
      ),
      body: Container(
        color: Colors.white30,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              child: ListTile(
                title: Container(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(),
                ),
                subtitle: Column(
                  children: [Text("Otmane"), Text("#id 5474748849")],
                ),
              ),
            ),
            Text(
              "Profile",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 240, 240, 240),
                    offset: Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ot mane",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[200],
                  ),
                  Text(
                    "Ot mane",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[200],
                  ),
                  Text(
                    "Algier",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[200],
                  ),
                  Text(
                    "atmane@gmail.com",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Settings",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 240, 240, 240),
                    offset: Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Privecy & Data",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right,color: Colors.black54,),
                    ],
                  ),
                 Divider(
                    color: Colors.grey[200],
                  ),
                  Text(
                    "Change Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Notification",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 240, 240, 240),
                    offset: Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "App Notification",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      Switch(
                        value: false, 
                        dragStartBehavior: DragStartBehavior.down,
                        onChanged: (val){
                          val = true ;
                        },
                        trackOutlineWidth: MaterialStateProperty.all(1),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Messages Notifications",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      Switch(
                        value: true,
                        onChanged: (value){
                          value = true;
                        },
                        activeColor: Colors.deepPurpleAccent[100],
                        trackOutlineWidth: MaterialStateProperty.all(1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Container(
            //     alignment: Alignment.center,
            //     child: MaterialButton(
            //       disabledColor: Colors.deepPurpleAccent,
            //       minWidth: 200,
            //       height: 20,
            //       padding: EdgeInsets.all(18),
            //       textColor: Colors.white,
            //       child: Text("Log Out"),
            //       onPressed: null,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
