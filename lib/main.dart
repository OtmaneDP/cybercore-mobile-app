

import 'dart:ffi';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/pages/home_page.dart';

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
  List<String> questions= ["question1","question2","question3","question4","question5"];
  List<Text> answers = [];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: HomePage(),
    );
  }

    
}
