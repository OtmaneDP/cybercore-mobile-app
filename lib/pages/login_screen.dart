import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/costuminputfield.dart';
import 'package:fluttertest/components/custom_progress.dart';
import 'package:fluttertest/controllers/authcontroller.dart';
import 'package:fluttertest/controllers/home_page_controller.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:fluttertest/helperclasses/inpute_validator.dart';
import 'package:fluttertest/models/user_model.dart';
import 'package:fluttertest/pages/restet%20password/send_email_page.dart';
import 'package:fluttertest/pages/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> loginKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 170,
              child: Text(
                "Cyber Core",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
            ),
            Container(
              height: 300,
              width: MediaQuery.sizeOf(context).width - 50,
              child: Form(
                key: loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login to Your Account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    CostumInputField(
                      controller: emailController,
                      label: Text("Username"),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      isPassword: false,
                      onChange: (value) {
                        setState(() {
                          emailController.text = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "the email field is required";
                        }
                        return !InputValidator().isEmail(value)
                            ? "the input field value must be an email"
                            : null;
                      },
                    ),
                    CostumInputField(
                      controller: passwordController,
                      label: Text("password"),
                      prefixIcon: Icon(
                        Icons.https,
                        color: Colors.grey,
                      ),
                      sufixIcon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                      isPassword: true,
                      validator: (value) {
                        // if(errorMessage!.isNotEmpty){
                        //   return errorMessage;
                        // }
                        return value!.isEmpty
                            ? "password field is required"
                            : null;
                      },
                      onChange: (value) {
                        setState(() {
                          passwordController.text = value;
                        });
                      },
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: MaterialButton(
                        onPressed: () async {
                          if (loginKey.currentState!.validate()) {
                            String email = emailController.text;
                            String password = passwordController.text;
                            BuildContext? currentContext = context;
                            // send login request withe user credentiales
                            if (await AuthController(context)
                                .login(email, password)) {
                              Widget homePage =
                                  await HomePageController().getView();
                              Navigator.of(currentContext!).pushReplacement(MaterialPageRoute(builder: (context){
                                 return FutureBuilder(future: HomePageController().getView(), builder: (context,AsyncSnapshot <Widget?> snapshot){
                                    if(snapshot.connectionState == ConnectionState.waiting){
                                      return CustomeProgress();
                                    }
                                    return snapshot.data!;
                                 });
                              }));
                            }
                          }
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        color: Colors.deepPurpleAccent,
                        minWidth: MediaQuery.sizeOf(context).width,
                        height: 60,
                        textColor: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: 'Do you forget your password?',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          children: [
                            TextSpan(
                                text: 'Reset',
                                style: TextStyle(
                                    color: Colors.deepPurpleAccent, fontSize: 14),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                       return SendEmailPage();
                                    }));
                                  }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "or Sign with",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              height: 100,
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 215, 215, 215),
                            offset: Offset(0, 0),
                            blurRadius: 5,
                          ),
                        ]),
                    child: Image.asset(
                      "images/facebook.png",
                    ),
                    width: 45,
                    height: 42,
                  ),
                  Container(
                    child: Image.asset("images/google.png"),
                    width: 45,
                    height: 42,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 215, 215, 215),
                            offset: Offset(0, 0),
                            blurRadius: 5,
                          ),
                        ]),
                  ),
                  Container(
                    child: Image.asset("images/git.png"),
                    width: 45,
                    height: 42,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 215, 215, 215),
                            offset: Offset(0, 0),
                            blurRadius: 5,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account?',
                style: TextStyle(color: Colors.black87, fontSize: 15),
                children: [
                  TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent, fontSize: 15),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return SignUpScreen();
                          }));
                        }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
