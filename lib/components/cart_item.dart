import 'package:flutter/material.dart';

class CartItem extends StatefulWidget{
  
  int? contity;
  Map? item;
  final Function(int)? changeQontity;
  CartItem({
    super.key, 
    this.contity,
    this.item,
    this.changeQontity,
  });

  CartItemState createState(){
    return CartItemState();
  }
  
}


class CartItemState extends State<CartItem>{
   
   
  Widget build(BuildContext){
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
                                  if(widget.item!["contete"] > 1){
                                    widget.item!["contete"] = widget.item!["contete"] - 1;
                                    widget.changeQontity!.call(widget.item!["contete"]);
                                  }
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
                              child: Text(widget.item!["contete"].toString(),style: TextStyle(
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
                                  if(widget.item!["contete"] >= 1){
                                    widget.item!["contete"] = widget.item!["contete"] + 1;
                                    widget.changeQontity!.call(widget.item!["contete"]);
                                  }
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