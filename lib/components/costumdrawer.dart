



import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertest/components/costumDrawerChild.dart';
import 'package:fluttertest/pages/favorit_page.dart';
import 'package:fluttertest/pages/myaccount.dart';

class CostumDrawer extends StatelessWidget{

  const CostumDrawer({super.key});

  Widget build(BuildContext){
      return ListView(
        children: [
            ListTile(
              selectedTileColor: Colors.blue,
              selectedColor: Colors.blue,
              leading: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("images/test.jpg"),
                ),
              ),
              title: Text("atmane@gmail.com"),
              subtitle: Text("#id 52443635",style: TextStyle(
                fontSize: 12,
              ),),
            ),
            CostumDrawerChild(
              title: "My Account",
              icon: Icon(Icons.account_circle),
              destinationPage: MyAccountPage(),
            ),
        ],
      );
  }
}