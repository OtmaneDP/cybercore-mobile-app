



import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/costumDrawerChild.dart';
import 'package:fluttertest/pages/cart_page.dart';
import 'package:fluttertest/pages/favorite_page.dart';
import 'package:fluttertest/pages/myaccount.dart';

class CostumDrawer extends StatelessWidget{

  const CostumDrawer({super.key});

  Widget build(BuildContext){
      return Container(
        child: ListView(
          children: [
              Container(
                alignment: Alignment.center,
                height: 120,
                child: ListTile(
                  selectedTileColor: Colors.blue,
                  selectedColor: Colors.blue,
                  leading: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:Icon(Icons.person,color: Colors.deepPurpleAccent,),
                    ),
                  ),
                  title: Text("atmane@gmail.com"),
                  subtitle: Text("#id 52443635",style: TextStyle(
                    fontSize: 12,
                  ),),
                ),
              ),
              CostumDrawerChild(
                title: "My Account",
                icon: Icon(Icons.account_circle),
                destinationPage: MyAccountPage(),
              ),
              CostumDrawerChild(
                title: "Favorit",
                icon: Icon(Icons.favorite),
                destinationPage:FavoritePage(),
              ),
              CostumDrawerChild(
                title: "Cart",
                icon: Icon(Icons.shopping_cart),
                destinationPage:CartPage(),
              ),
              CostumDrawerChild(
                title: "Catigorys",
                icon: Icon(Icons.info),
                destinationPage:CartPage(),
              ),
              //  Expanded(
              //   child: Container(
              //     height: 450,
              //     alignment: Alignment.bottomCenter,
              //     child: MaterialButton(
              //       elevation: 2,
              //       disabledColor: Colors.deepPurpleAccent,
              //       minWidth: 200,
              //       height: 20,
              //       padding: EdgeInsets.all(18),
              //       textColor: Colors.white,
              //       child: Text("Log Out"),
              //       onPressed: null,
              //     ),
              //   ),
              // ),
        
          ],
        ),
      );
  }
}