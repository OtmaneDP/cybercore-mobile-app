import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/pages/changepassword_page.dart';

class MyAccountPage extends StatefulWidget {
  bool messageNotifState = false;
  bool appNotifState = false;
  Map? userData; 
  MyAccountPage({
    super.key, 
    this.userData,
  });

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
                  child: CircleAvatar(child: Icon(Icons.person,size: 50,color: Colors.deepPurpleAccent,),),
                ),
                subtitle: Column(
                  children: [Text(widget.userData!["email"]), Text("#id ${widget.userData!["id"]}")],
                ),
              ),
            ),
            // Text(
            //   "Profile",
            //   style: TextStyle(
            //     color: Colors.black54,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 10, bottom: 10),
            //   padding: EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //     boxShadow: [
            //       BoxShadow(
            //         color: Color.fromARGB(255, 240, 240, 240),
            //         offset: Offset(0, 0),
            //         blurRadius: 5,
            //       ),
            //     ],
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(7),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "this is whene user created profile",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           color: Colors.black87,
            //         ),
            //       ),
            //       Divider(
            //         color: Colors.grey[200],
            //       ),
            //       Text(
            //         "this is whene user created profile",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           color: Colors.black87,
            //         ),
            //       ),
            //       Divider(
            //         color: Colors.grey[200],
            //       ),
            //       Text(
            //         "this is whene user created profile",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           color: Colors.black87,
            //         ),
            //       ),
            //       Divider(
            //         color: Colors.grey[200],
            //       ),
            //       Text(
            //         widget.userData!["email"],
            //         style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           color: Colors.black87,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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
                  InkWell(
                    onTap: (){
                      print("click");
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return ChangePasswordPage();
                      }));
                    },
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
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
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 15),
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
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: widget.appNotifState, 
                          onChanged: (value){
                            setState(() {
                              widget.appNotifState ? widget.appNotifState = false : widget.appNotifState = true;
                            });
                          },
                        ),
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
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                            trackOutlineWidth: MaterialStateProperty.all(0),
                            value: widget.messageNotifState,
                            onChanged: (value){
                              setState(() {
                                widget.messageNotifState ? widget.messageNotifState = false : widget.messageNotifState = true;
                              });
                            },
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
