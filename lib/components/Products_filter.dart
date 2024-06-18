
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/product.dart';

import '../pages/product_details.dart';

class ProductsFilter extends StatelessWidget{
  final List? products; 
  final List? catigorys;
  List? filtredProducts = [];
  final int? activeCatigory;

  ProductsFilter({
    super.key, 
    this.products, 
    this.catigorys,
    this.activeCatigory,
  }){
    if(activeCatigory == -1){
      filtredProducts = products;
    }else{
      for(Map product in products!){
      if(product["catigory"]["id"] == catigorys![activeCatigory!]["id"]){
        filtredProducts!.add(product);
      }
    }
    }
  }

  @override
  Widget build(BuildContext context){
    return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 13,
                crossAxisSpacing: 5,
                childAspectRatio: 0.7,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filtredProducts!.length,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    _toDetailsPage(filtredProducts![index], context);
                  },
                  child:  Product(
                      productInfo: filtredProducts![index],
                      isNewtworkImage: true,
                      heartColor: filtredProducts![index]["favorited"] == 1 ? Colors.red : Color.fromARGB(255, 225, 225, 225),
                    ),
                ),
            );
  }
   void _toDetailsPage(Map productInfo, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProductDetails(productInfo: productInfo);
    }));
  }


}