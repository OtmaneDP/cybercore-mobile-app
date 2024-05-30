

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/costuminputfield.dart';
import 'package:fluttertest/components/custom_alert.dart';
import 'package:fluttertest/controllers/Order_page_controller.dart';
import 'package:fluttertest/helperclasses/inpute_validator.dart';
import 'package:fluttertest/pages/cart_page.dart';

class CheckoutScreen extends StatefulWidget{
  GlobalKey <FormState> orderFormKey = GlobalKey();
  Map <String , int> shipingFees ;
  List? cachedCratItems;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fullAddressController = TextEditingController();
  final TextEditingController phonNumberController = TextEditingController();
  CheckoutScreen({
    super.key, 
    this.cachedCratItems,
    required this.shipingFees,
  });

  CheckoutScreenState createState(){
    return CheckoutScreenState(); 
  }
}

class CheckoutScreenState extends State<CheckoutScreen>{
  
  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Checkout"),
      ),
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: widget.orderFormKey,
          child: ListView(
            shrinkWrap: true,
            children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                 
              ),
              child: Image.asset("images/p (8).png"),
            ),
            SizedBox(height: 20,),
            Row(children: [
              Expanded(child: Text("Name")),
              SizedBox(width: 50,),
              Expanded(child: Text("Last Name",style: TextStyle(height: 3),)),
            ],),
            Row(children: [
              Expanded(child: CostumInputField(
                controller: widget.nameController,
                isPassword: false,
                label: Text("Name",style: TextStyle(fontSize: 14),),
                validator: (value){
                   if(value!.isEmpty){
                     return "name filed is required";
                   }
                  return InputValidator().invalidCharactersValidator(
                    value,
                   "th name input field have invalid characters");
                },
                onChange: (value) => setState(() {
                    widget.nameController.text = value;
                }),
              )),
              SizedBox(width: 50,),
              Expanded(child: CostumInputField(
                controller: widget.lastNameController,
                isPassword: false,
                label: Text("last Name",style: TextStyle(fontSize: 14),),
                 validator: (value){
                   if(value!.isEmpty){
                      return "last name input field is required";
                   }
                  return InputValidator().invalidCharactersValidator(value, "the lastname field have invalid charachters");
                  
                },
                 onChange: (value) => setState(() {
                   widget.lastNameController.text = value;
                 }),
              )),
            ],),
            SizedBox(height: 10,),
            Text("full address",style: TextStyle(height: 3),),
            CostumInputField(
              controller: widget.fullAddressController,
              isPassword: false,
              label: Text("Street Address",style: TextStyle(fontSize: 14),),
               validator: (value){
                if(value!.isEmpty){
                  return  "strret Address field is required";
                }
                 return InputValidator().invalidCharactersValidator(value, "this input field have invalid charachters");
                },
                 onChange: (value) => setState(() {
                   widget.fullAddressController.text = value;
                 }),
            ),
            SizedBox(height: 10,),
            
            SizedBox(height: 10,),
            Text("Phon Number",style: TextStyle(height: 3),),
            CostumInputField(
              controller: widget.phonNumberController,
              isPassword: false,
              prefixIcon: Icon(Icons.phone,size: 17,color: Colors.black54,),
              label: Text("+23",style: TextStyle(fontSize: 14),),
                validator: (value){
                  if(value!.isEmpty){
                    return "phon number field is required";
                  }
                  return InputValidator().phonNumberValidator(value);
                },
                 onChange: (value) => setState(() {
                  widget.phonNumberController.text = value;
                 }),
            ),
             SizedBox(height: 10,),
            SizedBox(height: 25,),
             Container(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 4),
                height: 115,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color:Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub Totale: ",style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.5,
                      ),),
                      Text("${widget.shipingFees["sub_totale"]} DZ",style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color:Color.fromARGB(221, 36, 36, 36),
                      ),),
                    ],
                  ),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivry free: ",style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.5,
                      ),),
                      Text("${widget.shipingFees["delivery_fees"]} DZ",style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(221, 36, 36, 36),
                      ),),
                    ],
                  ),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Descount: ",style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.5,
                      ),),
                      Text("${widget.shipingFees["descount"]}%",style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(221, 36, 36, 36),
                      ),),
                    ],
                  ),
                 ],
                ),
              ),
            SizedBox(height: 25,),
            Container(
              width: 200,
              alignment: Alignment.center,
              child: MaterialButton(
                color: Colors.deepPurpleAccent,
                child: Text("Place Order"),
                onPressed:() async{
                  if(widget.orderFormKey.currentState!.validate()){
                     Map customerInfo = {
                    "name" : widget.nameController!.text, 
                    "last_name": widget.lastNameController!.text, 
                    "phon_number" : widget.phonNumberController!.text,
                    "full_address": widget.fullAddressController!.text,
                    "amount" : widget.shipingFees["sub_totale"], 
                  };
                  // place order
                  bool orderState = await OrderPageController.placeOrder(widget.cachedCratItems, customerInfo) ;
                  showDialog(context: context, builder: (context){
                    
                    return orderState == true ? 
                      CustomAlert(
                        alertIcon: Icon(Icons.done), 
                        stateMessage: "Success", 
                        stateDescription: "Place Order withe succefully", 
                        color: Colors.green) :  CustomAlert(
                        alertIcon: Icon(Icons.warning,color: Colors.white,), 
                        stateMessage: "Problem", 
                        stateDescription: "somthing wrong please try again", 
                        color: Colors.deepOrangeAccent,);
                  });
                  
                  }
                  
                },
                textColor: Colors.white,
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 50),
              ),
            ),
            SizedBox(height: 20,),
          ],),
        ),  
      ),
    ); 
  }
  
} 