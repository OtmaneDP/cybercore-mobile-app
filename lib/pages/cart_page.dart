

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartPage extends StatefulWidget{

  CartPage({super.key});
  int contity = 1;
  CartPageState createState(){

    return CartPageState();
  } 


}

class CartPageState extends State<CartPage>{

  Widget build(BuildContext context){
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
                 itemCount: 3,
                 itemBuilder: (context,index){
                    return _getProduct();
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
                    Text("Sub Totale: ",style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.5,
                    ),),
                    Text("3000 DZ",style: TextStyle(
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
                    Text("5.00DZ",style: TextStyle(
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
                    Text("40%",style: TextStyle(
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
                    print("hellow world");
                  },
                  elevation: 1,
                  disabledColor: Colors.deepPurpleAccent,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  height: 60,
                  minWidth: 70,
                  child: Text("Checkout for 4000 DZ",style: TextStyle(
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

  Widget _getProduct(){
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.only(left: 10,bottom: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          ),
        )
      ),
      child: Row(
        children: [
         Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset("images/test.png",
              fit: BoxFit.contain,
            ),
            ),
          ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.only(right: 10,left: 10),
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pc Laptop Dell",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),),
                    Icon(Icons.cancel,color: Colors.grey[300],)
                  ],
                ),
                Text("1 TB",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black45
                ),),
                Expanded(child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("570.00 DZ",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.5,
                      ),),
                      Container(
                        width: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [ 
                            MaterialButton(
                              disabledColor:Colors.blue,
                              color: Colors.white,
                              elevation: 1,
                              minWidth: 40,
                              height: 40,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.black12),
                              ),
                              onPressed: (){
                                setState(() {
                                  widget.contity > 0 ? widget.contity-- : widget.contity = 0;
                                });
                              },
                              child: Text("-",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400],
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10,right: 10),
                              child: Text(widget.contity.toString(),style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87
                              ),
                              ),
                            ),
                             MaterialButton(
                              disabledColor: Colors.blue,
                              color: Colors.white,
                              minWidth: 40,
                              height: 40,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.deepPurpleAccent),
                              ),
                              onPressed: (){
                                setState(() {
                                  widget.contity++;
                                });
                              },
                              child: Text("+",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurpleAccent,
                                fontSize: 18,
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          )),
        ]
       
      ),
    );
  }
} 