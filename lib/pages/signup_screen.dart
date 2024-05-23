
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/costuminputfield.dart';
import 'package:fluttertest/controllers/authcontroller.dart';
import 'package:fluttertest/helperclasses/inpute_validator.dart';

class SignUpScreen extends StatefulWidget{
  SignUpScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpScreenState();
  }
}

class SignUpScreenState  extends State<SignUpScreen>{

  TextEditingController passwordController  = TextEditingController();  
  TextEditingController confirmePasswordController  = TextEditingController();  
  TextEditingController emailController = TextEditingController();  
  GlobalKey <FormState> signUpKey = GlobalKey();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("sign up"),
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
            Expanded(child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:Form(
                key: signUpKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login to Your Account",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    CostumInputField(
                      controller: emailController,
                      label: Text("Username/E-mail"),
                      prefixIcon: Icon(Icons.person,color: Colors.grey,),
                      isPassword: false,
                      validator:(value){return InputValidator().emailValidator(value);},
                      onChange: (value) => setState(() {emailController.text = value;}),
                    ),
                    CostumInputField(
                      controller: passwordController,
                      label: Text("password"),
                      prefixIcon: Icon(Icons.https,color: Colors.grey,),
                      sufixIcon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                      isPassword: true,
                      validator:(value) => value!.isEmpty ? "pssword field is required" : null,
                      onChange: (value) => setState(() {passwordController.text = value;}),
                    ),
                    CostumInputField(
                      controller: confirmePasswordController,
                      label: Text(" conferme your password"),
                      prefixIcon: Icon(Icons.https,color: Colors.grey,),
                      sufixIcon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                      isPassword: true,
                      onChange: (value) => setState(() {confirmePasswordController.text = value;}),
                      validator: (value){
                        if(value!.isEmpty){
                          return "the conf_password is required ";
                        }
                        return passwordController.text != value ? "check you password value" : null;
                      },
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: MaterialButton(
                        onPressed: (){
                          if(signUpKey.currentState!.validate()){
                            String email = emailController.text; 
                            String password = passwordController.text;
                            AuthController(context).register(email, password);
                          }
                        },
                        child: Text(
                          "Sign Up",
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
                  ],
                ),
              ),
            )),
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
          ],
        ),
      )
    );
  }
}