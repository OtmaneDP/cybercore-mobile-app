

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/cart_item.dart';
import 'package:fluttertest/components/custom_alert.dart';
import 'package:fluttertest/controllers/cart_page_controller.dart';
import 'package:fluttertest/controllers/product_controller.dart';
import 'package:fluttertest/pages/checkout_screen.dart';

class CartPage extends StatefulWidget{
  
  List? cartItems ;
 
  CartPage({
    super.key, 
    this.cartItems,
  });

  @override
  CartPageState createState(){
    return CartPageState();
  } 

}

class CartPageState extends State<CartPage>{


  @override
  void dispose(){
    
    super.dispose();
    CartPageController.updateCartItems(widget.cartItems!);
    print("despose cart page");
  }

  Widget build(BuildContext context){
   print("rebuild cart page");
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        centerTitle: true,
        actions: [
        //  IconButton(onPressed: null, icon: Icon(Icons.more_horiz_rounded),),
        ],
      ),
      body: Container(
        color: Colors.white70,
        child: Column(
          children: [
            Container(
              height: 530,
              child: ListView.builder(
                 itemCount: widget.cartItems!.length,
                 itemBuilder: (context,index){
                    return CartItem(
                     
                      item: widget.cartItems![index],
                      changeQontity: (newQontity){
                        setState(() {
                          int currentProductContete = widget.cartItems![index]["product"]["contete"];
                          int cartItemContete = widget.cartItems![index]["cart_item"]["contete"];
                          if( currentProductContete > cartItemContete){
                            widget.cartItems![index]["cart_item"]["contete"] = newQontity;
                          }
                        });
                      },
                      onDelete: (){
                       setState((){
                         
                          ProductController.deleteFromCart(productId: widget.cartItems![index]["product"]["id"]);
                           widget.cartItems!.removeAt(index);
                       });
                      },
                    );
                 }
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 115,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sub Totale:",style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.5,
                    ),),
                    Text("${_calculateAmount()} DZ",style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color:Color.fromARGB(221, 36, 36, 36),
                    ),),
                  ],
                ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivry fees: ",style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.5,
                    ),),
                    Text("0.00DZ",style: TextStyle(
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
                    Text("0%",style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(221, 36, 36, 36),
                    ),),
                  ],
                ),
               ],
              ),
            ),
            Divider(),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: MaterialButton(
                  padding: EdgeInsets.only(left: 40,right: 40,),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    if(widget.cartItems!.length > 0 ){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return CheckoutScreen(cachedCratItems: widget.cartItems,shipingFees: _getFees(),); 
                    }));
                    }else{
                      showDialog(context: context, builder: (context){
                        return CustomAlert(alertIcon: Icon(Icons.warning, color: Colors.white, size: 50,), 
                          stateMessage: "", 
                          stateDescription: "your cart has Empty", 
                          color: Colors.purple);
                      });
                    }
                  },
                  elevation: 1,
                  disabledColor: Colors.deepPurpleAccent,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  height: 60,
                  minWidth: 70,
                  child: Text("Checkout for ${_calculateAmount()} DZ",style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    ); 
  }   

  int _calculateAmount(){
    int subTotale = 0;
    for(Map item in widget.cartItems!){
      subTotale =  (item["cart_item"]["contete"]*item["product"]["price"]) + subTotale; 
    }
    return subTotale;
  }
  Map <String , int> _getFees(){
    Map <String , int> fees = {
      "sub_totale" : _calculateAmount(), 
      "delivery_fees" : 0, 
      "descount" : 0, 
    };
    return fees;
  }
} 