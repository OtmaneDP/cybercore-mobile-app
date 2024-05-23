

import 'package:flutter/cupertino.dart';

class CheckoutScreen extends StatefulWidget{


  CheckoutScreen({super.key});

  @override
  CheckoutScreenState createState() {
    // TODO: implement createState
    return CheckoutScreenState();
  }




}

class CheckoutScreenState extends State<CheckoutScreen>{

  Widget build(BuildContext context){
    return Container(
      child:Center(
        child : Text("Checkout page")
      ),
    );
  }

}