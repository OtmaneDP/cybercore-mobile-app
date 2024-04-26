
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/product.dart';

class FavoritePage extends StatefulWidget{

  FavoritePage({super.key});

  @override
  FavoritePageState createState(){
    return FavoritePageState();
  }
}

class FavoritePageState extends State<FavoritePage>{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorit"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child:Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1,color: Colors.grey)),
              ),
            ),
            Expanded(
              child: Container(
                child:  GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                  ),
              
                children: [
                  Product(imagePath: "images/test.png", title: "product"),
                  Product(imagePath: "images/test.png", title: "product"),
                  Product(imagePath: "images/test.png", title: "product"),
                  Product(imagePath: "images/test.png", title: "product"),
                   Product(imagePath: "images/test.png", title: "product"),
                  Product(imagePath: "images/test.png", title: "product"),
              
                ],
              ),
              ),
            )
          ],
        ),
        ),
    );
  }

}