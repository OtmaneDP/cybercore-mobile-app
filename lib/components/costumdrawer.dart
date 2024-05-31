



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/costumDrawerChild.dart';
import 'package:fluttertest/controllers/cart_page_controller.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:fluttertest/pages/cart_page.dart';
import 'package:fluttertest/pages/favorite_page.dart';
import 'package:fluttertest/pages/main_screen.dart';
import 'package:fluttertest/pages/myaccount.dart';


class CostumDrawer extends StatefulWidget{
    const CostumDrawer({super.key});

    CostumDrawerState createState(){
      return CostumDrawerState();
    }

}

class CostumDrawerState extends State <CostumDrawer>{
  
  Widget build(BuildContext){
      return Container(
        child: FutureBuilder (future: Auth.user(), builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Container();
          }
          if(snapshot.connectionState == ConnectionState.done){
            var data = jsonDecode(snapshot.data.toString());
            return  ListView(
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
                  title: Text(data["data"]["email"]),
                  subtitle: Text("#id ${data["data"]["id"]}",style: TextStyle(
                    fontSize: 12,
                  ),),
                ),
              ),
              CostumDrawerChild(
                title: "My Account",
                icon: Icon(Icons.account_circle),
                destinationPage: MyAccountPage(userData: data["data"],),
              ),
              CostumDrawerChild(
                title: "Favorit",
                icon: Icon(Icons.favorite),
                destinationPage:FavoritePage(),
              ),
              CostumDrawerChild(
                title: "Cart",
                icon: Icon(Icons.shopping_cart),
                destinationPage:CartPageController().getView(),
              ),
              CostumDrawerChild(
                title: "Catigorys",
                icon: Icon(Icons.info),
                destinationPage:CartPage(),
              ),
               CostumDrawerChild(
                title: "Main Screen",
                icon: Icon(Icons.info),
                destinationPage:MainScreen(),
              ),
               Expanded(
                child: Container(
                  height: 400,
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    elevation: 2,
                    color: Colors.deepPurpleAccent,
                    minWidth: 200,
                    height: 20,
                    padding: EdgeInsets.all(18),
                    textColor: Colors.white,
                    child: Text("Log Out"),
                    onPressed: (){
                      // on press logic 
                    },
                  ),
                ),
              ),
        
          ],
            );
          }
          return Container();
        }),
      );
  }
}