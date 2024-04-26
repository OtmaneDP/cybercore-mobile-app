import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/costumdrawer.dart';
import 'package:fluttertest/components/product.dart';
import 'package:fluttertest/pages/login_page.dart';
import 'package:fluttertest/pages/product_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

@override
class HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextFormField(
            cursorWidth: 0.4,
            cursorHeight: 21,
            cursorColor: Colors.grey,
            style: TextStyle(
              fontSize: 13,
            ),
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[100],
              hoverColor: Colors.grey[200],
            ),
          ),
          leadingWidth: 30,
      ),
       drawer: Drawer(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: CostumDrawer(),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white70,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 20,),
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(190, 0, 0, 0),
              ),
            ),
            Container(
              height: 130,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                padding: EdgeInsets.only(top: 2),
                scrollDirection: Axis.horizontal,
                children: [
                  _getCategorie(),
                  _getCategorie(),
                  _getCategorie(),
                  _getCategorie(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "lest Steeling",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(190, 0, 0, 0),
              ),
            ),
            const Divider(
              height: 7,
              endIndent: 200,
              indent: 2,
              thickness: 0.6,
              color: Colors.black38,
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 13,
                crossAxisSpacing: 5,
                childAspectRatio: 0.7,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  _toDetails(Product(
                      title: "Nike cascet", imagePath: "images/pc.webp"));
                },
                child: Product(
                  title: "Nike cascet",
                  imagePath: "images/test.png",
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: null, icon: Icon(Icons.home_outlined, color: Colors.black)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2,color: Colors.deepPurpleAccent),
              ),
              child:Stack(
                clipBehavior: Clip.none,
                children: [
                   IconButton(
                  onPressed: (){
                    print("test");
                  },
                  icon: Icon(Icons.shopping_cart_outlined, color: Colors.deepPurpleAccent)),
                  Positioned(
                    right: -7,
                    child: Container(
                      alignment: Alignment.center,
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.red, 
                        borderRadius: BorderRadius.circular(50)),
                        child: Text("1",style: TextStyle(color: Colors.white,fontSize: 9.5,fontWeight: FontWeight.w700),),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: null,
                icon: Icon(Icons.notifications_none_sharp, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  void _toDetails(Product product) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProductDetails(product: product);
    }));
  }

  Widget _getCategorie() {
    return Container(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            child: ClipRRect(child: Image.asset("images/test.jpg",fit: BoxFit.fill,), borderRadius: BorderRadius.circular(50),),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Color.fromARGB(255, 220, 220, 220),
                  blurRadius: 4,
                )
              ],
            ),
          ),
          Text(
            "Laptop",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(190, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
