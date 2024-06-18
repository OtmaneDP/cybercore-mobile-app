
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/product.dart';
import 'package:fluttertest/pages/product_details.dart';

class FavoritePage extends StatefulWidget{
  
  List? favoritedProducts;
  FavoritePage({
    super.key, 
    required this.favoritedProducts,
  });
  
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
                child:  GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: widget.favoritedProducts!.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                     
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                        return ProductDetails(productInfo: widget.favoritedProducts![index]);
                      }));
                    },
                    child: Product(
                        heartColor: Colors.red,
                        productInfo: widget.favoritedProducts![index],
                        isNewtworkImage: true,
                        onFavorite: (value){
                          setState(() {
                            widget.favoritedProducts![index]["favorited"] = value;
                            widget.favoritedProducts!.removeAt(index);
                          });
                        },
                      ),
                  );
                },  
              ),
              ),
            )
          ],
        ),
        ),
    );
  }

}