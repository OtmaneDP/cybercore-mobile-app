import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/Middlewars/auth_middleware.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:fluttertest/pages/changepassword_page.dart';
import 'package:fluttertest/pages/home_page.dart';
import 'package:fluttertest/pages/login_screen.dart';
import 'package:fluttertest/pages/main_screen.dart';
import 'package:fluttertest/pages/product_details.dart';
import 'package:fluttertest/pages/restet%20password/send_email_page.dart';
import 'package:fluttertest/pages/signup_screen.dart';

void main() {
  runApp(TextChange());
}

class TextChange extends StatefulWidget{
  const TextChange({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextChangeState();
  }
}
class TextChangeState extends State<TextChange>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MainScreen(),
    );
  } 

  Widget _getTextSpan(){
    return RichText(
        text: TextSpan(
          text: 'Don\'t have an account?', style: TextStyle(color: Colors.black, fontSize: 18),
          children: [
            TextSpan(text: 'Sign in', style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 18),
              recognizer: TapGestureRecognizer()..onTap = (){
                print("hellow world");
              }
            ),
          ],
        ),
    );
  }
}
