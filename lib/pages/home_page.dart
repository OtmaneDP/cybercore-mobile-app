import 'dart:ffi';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/catigory.dart';
import 'package:fluttertest/components/costumdrawer.dart';
import 'package:fluttertest/components/product.dart';
import 'package:fluttertest/controllers/authcontroller.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:fluttertest/pages/login_screen.dart';
import 'package:fluttertest/pages/product_details.dart';

class HomePage extends StatefulWidget {

  List?  products ;
  List?  catigorys;
  HomePage({
    super.key,
    this.products,
    this.catigorys
  });
  

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
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(33, 124, 77, 255),
                // border: Border.all(width: 1,color: Colors.black12), 
                borderRadius: BorderRadius.circular(5),
              ),
              child: Stack(clipBehavior: Clip.none, children: [
                Positioned(right: 0, top: -8, child:Image.asset("images/test.png",height: 190,)),
                Positioned(right: 130, bottom: 0, child:Image.asset("images/test.png",height: 115,)),
                Positioned(bottom: 10,left: 10,child: MaterialButton(onPressed: null, child: Text("New Store"),disabledColor: Colors.blue,textColor: Colors.white,))
              ],),
            ),
            SizedBox(height: 10,),
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(190, 0, 0, 0),
              ),
            ),
            Container(
              height: 110,
              padding: EdgeInsets.only(top: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.catigorys!.length,
                itemBuilder: (context, index) => Catigory(
                  catigoryInfo: widget.catigorys![index],
                  isSlected: index == 0 ? true : false ,
                  isNewtworkImage: true,
                ),
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
              itemCount: widget.products!.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  _toDetailsPage(widget.products![index]);
                },
                child: Product(
                  productInfo: widget.products![index],
                  isNewtworkImage: true,
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
                onPressed: ()async{
                  // await Auth.user();
                },
                icon: Icon(Icons.notifications_none_sharp, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  void _toDetailsPage(Map productInfo) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProductDetails(productInfo: productInfo);
    }));
  }
}
