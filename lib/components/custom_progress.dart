import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeProgress extends StatelessWidget {
  CustomeProgress({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: CircularProgressIndicator());
  }
}
