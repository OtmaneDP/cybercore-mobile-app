import 'package:flutter/material.dart';

class CartItem extends StatefulWidget{
  
  Map? item;
  final Function(int)? changeQontity;
  final Function? onDelete;
  CartItem({
    super.key, 
    this.item,
    this.changeQontity,
    this.onDelete,
  });

  CartItemState createState(){
    return CartItemState();
  }
  
}


class CartItemState extends State<CartItem>{
  bool visibility = true;
   
  Widget build(BuildContext){
    return Visibility(
      visible: visibility,
      child: Container(
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
                child: Image.network(widget.item!["product"]["images"][0]["image_path"],
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
                      Text(widget.item!["product"]["name"],style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),),
                     IconButton(onPressed: (){
                        setState(() {
                          visibility = false;
                        });
                        widget.onDelete!();
                     }, 
                     icon:  Icon(Icons.cancel,color: Colors.grey[300],)),
                    ],
                  ),
                  Text("On Stock",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurpleAccent
                  ),),
                  Expanded(child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${widget.item!["product"]["price"].toString()} DZ",style: TextStyle(
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
                                    if(widget.item!["cart_item"]["contete"] > 1){
                                      widget.item!["cart_item"]["contete"] = widget.item!["cart_item"]["contete"] - 1;
                                      widget.changeQontity!.call(widget.item!["cart_item"]["contete"]);
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
                                child: Text(widget.item!["cart_item"]["contete"].toString(),style: TextStyle(
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
                                    
                                    if(widget.item!["cart_item"]["contete"] >= 1 && widget.item!["cart_item"]["contete"] < widget.item!["product"]["contete"] ){
                                      widget.item!["cart_item"]["contete"] = widget.item!["cart_item"]["contete"] + 1;
                                      widget.changeQontity!.call(widget.item!["cart_item"]["contete"]);
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
      ),
    );
  } 


}