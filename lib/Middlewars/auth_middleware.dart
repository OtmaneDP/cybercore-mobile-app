import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/components/custom_progress.dart';
import 'package:fluttertest/controllers/home_page_controller.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:fluttertest/helperclasses/jwt_validator.dart';
import 'package:fluttertest/pages/login_screen.dart';
import 'package:fluttertest/pages/main_screen.dart';

class AuthMiddleware {
  Future <Widget> handle() async {
    var isLogedIn = await Auth.isLogedIn();
    return isLogedIn == null
        ? MainScreen()
        : FutureBuilder(
            future: HomePageController().getView(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CustomeProgress();
              }
              return snapshot.data!;
            });
  }
}
