import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/product.dart';
import 'package:fluttertest/pages/cart_page.dart';

class ProductDetails extends StatelessWidget {
  final Product? product;
  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: Color.fromARGB(255, 236, 236, 236),
      //     boxShadow: [
      //       BoxShadow(
      //         offset: Offset(0, 10),
      //         color: Colors.black,
      //         blurRadius: 10,
      //       ),
      //     ],
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(
      //           onPressed: null, icon: Icon(Icons.home, color: Colors.blue)),
      //       IconButton(
      //           onPressed: null,
      //           icon: Icon(Icons.store_rounded, color: Colors.blue)),
      //       IconButton(
      //           onPressed: null,
      //           icon: Icon(Icons.notifications, color: Colors.blue)),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        title: Text("Details Product"),
        // actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15,right: 7,bottom: 5),
        color: Colors.white70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Container(
                height: 250,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      color: Color.fromARGB(31, 100, 100, 100),
                      blurRadius: 5,
                    ),
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                  "images/test.png",
                  fit: BoxFit.contain,
                ),
                ),
              ),
              Positioned(
                bottom: -20,
                right: 10,
                child: IconButton(
                  onPressed: (){
                    return null;
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 100,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ponther S4 Lite",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              "Gaming Laptop",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 255, 230, 0),
                                ),
                                Icon(Icons.star,
                                    color: Color.fromARGB(255, 255, 230, 0)),
                                Icon(Icons.star,
                                    color: Color.fromARGB(255, 255, 230, 0)),
                                Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "3000 DZ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Select Ram Size",
              style: TextStyle(fontSize: 17, color: Colors.black87),
            ),
            _getRamCheckBoxes(),
            _getRadiosButton(),
            Text(
              "Description",
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
            _getDescriptionSpace(),
            _getFloatButtons(context)
          ],
        ),
      ),
    );
  }

  Widget _getRamCheckBoxes() {
    return Container(
      height: 60,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: null,
            child: Text("8 GB"),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("16 GB"),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("32 GB"),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getRadiosButton() {
    return Container(
      height: 50,
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(value: false, groupValue: true, onChanged: null),
          Radio(value: false, groupValue: true, onChanged: null),
          Radio(value: false, groupValue: true, onChanged: null),
          Radio(value: false, groupValue: true, onChanged: null)
        ],
      ),
    );
  }

  Widget _getDescriptionSpace() {
    return Expanded(
      child: ListView(
        children: [
          Text(
            "sdfkdsjfksdjfkdsflsdfkdsfksdfssqdqsdqsdsqdqsdsqdsqdqsdsqdqsdsdfkdsjfksdjfkdsflsdfkdsfksdfssqdqsdqsdsdfdsfsd",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
          Text(
            "sdfkdsjfksdjfkdsflsdfkdsfksdfssqdqsdqsddfdsfsdfsd",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
          Text(
            "sdfkdsjfksdjfkdsflsdfkdsfksdfssqdqsdqsddsfsdfds",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
          Text(
            "sdfkdsjfksdjfkdsflsdfkdsfksdfssqdqsdqsd",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
          Text(
            "sdfkdsjfksdjfkdsflsdfkdsfksdfssqdqsdqsdfdsfsdfsdfdsfsd",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
          Text(
            "sdfkdsjfksdjfkdsflsdfkdsfksdfssqdqsdqsd",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getFloatButtons(context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            onPressed: null,
            disabledColor: Colors.white,
            color: Colors.white,
            child: Text("Boy Now",style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
            minWidth: 150,
            height: 45,
            textColor: Colors.deepPurpleAccent,
            shape: Border.all(color: Colors.deepPurpleAccent, width: 1),
          ),
          MaterialButton(
            color: Colors.deepPurpleAccent,
            disabledColor: Colors.deepPurpleAccent,
            child: Text("Add To Cart"),
            minWidth: 150,
            height: 45,
            textColor: Colors.white,
            onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (rout){
                return CartPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
