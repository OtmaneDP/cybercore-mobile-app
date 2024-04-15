


import 'package:fluttertest/pages/login_page.dart';
import 'package:fluttertest/pages/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Product extends StatefulWidget{
    Color heartColor = Colors.white;
    String? imagePath;
    String? title;
  Product({
    super.key,
    required this.imagePath,
    required this.title,
  });
  @override
  ProductState createState(){
    return ProductState();
  }
 

}

class ProductState extends State<Product>{
 
    
   @override
   Widget build(BuildContext context){
          return Container(
            padding: const EdgeInsets.all(4),
            width: 20,
            height: 20,
              child: Card(
                elevation: 4,
                shadowColor:const Color.fromARGB(255, 241, 241, 241),
                child: Column(
                  children: [
                    _getImageContainer(),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title!,style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 83, 83, 83),
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MaterialButton(
                                  disabledColor: Color.fromARGB(255, 227, 212, 75),
                                  textColor: Colors.white70,
                                  child: Text(
                                    "2000 DZ",
                                    style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: null,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.heart_broken,
                                    color: widget.heartColor,
                                  ),
                                  onPressed: () => {
                                    setState(() {
                                      widget.heartColor == Colors.white  ? 
                                      widget.heartColor = Color.fromARGB(255, 255, 92, 80) : // Or 
                                      widget.heartColor =  Colors.white ;
                                    })
                                  },
                                ),
                              ],
                            ),        
                        ],),
                      ),
                    )
                  ],
                ),
              ),
            );
   }

 Widget _getImageContainer(){
   
    return Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 250, 250, 250),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12)),
        ),
      child: Image.asset(
        widget.imagePath!,
        fit: BoxFit.contain,
      ),
    );
 }
}