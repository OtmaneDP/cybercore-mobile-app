



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/costumDrawerChild.dart';
import 'package:fluttertest/components/custom_progress.dart';
import 'package:fluttertest/controllers/authcontroller.dart';
import 'package:fluttertest/controllers/cart_page_controller.dart';
import 'package:fluttertest/controllers/favorite_controller.dart';
import 'package:fluttertest/controllers/product_controller.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:fluttertest/pages/cart_page.dart';
import 'package:fluttertest/pages/favorite_page.dart';
import 'package:fluttertest/pages/login_screen.dart';
import 'package:fluttertest/pages/main_screen.dart';
import 'package:fluttertest/pages/myaccount.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CostumDrawer extends StatefulWidget{
    CostumDrawer({super.key});

    CostumDrawerState createState(){
      return CostumDrawerState();
    }

  Future <List> getData() async{
    var userInfo = await Auth.user(); 
    var favoriteProducts = await FavoriteController.getFavoriteProducts();
    var cart = await ProductController.getCartItems();

    return [userInfo, favoriteProducts , cart];
  }

}

class CostumDrawerState extends State <CostumDrawer>{
  
  Widget build(BuildContext){
      return Container(
        child: FutureBuilder (future: widget.getData() , builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return CustomeProgress();
          }
          if(snapshot.connectionState == ConnectionState.done){
            var data = jsonDecode(snapshot.data![0].toString());
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
                 counted : false,
                title: "My Account",
                icon: Icon(Icons.account_circle),
                destinationPage: MyAccountPage(userData: data["data"],
               
              ),
              ),
              CostumDrawerChild(
                title: "Favorit",
                icon: Icon(Icons.favorite),
                destinationPage:FavoriteController().getView(),
                counter: jsonDecode(snapshot.data![1].toString())["data"].length,
              ),
              CostumDrawerChild(
                title: "Cart",
                icon: Icon(Icons.shopping_cart),
                destinationPage:CartPageController().getView(),
                counter: jsonDecode(snapshot.data![2].toString())["data"].length ,
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
                    onPressed: () async{
                      var response = await AuthController.logOut();
                      var responseBody = jsonDecode(response);
                      if(responseBody["status_code"] == 202){
                        final storage = await SharedPreferences.getInstance();
                        storage.remove("user_access_token");
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                        return MainScreen();
                      }));
    }
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