import 'package:fluttertest/pages/login_screen.dart';
import 'package:fluttertest/pages/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Product extends StatefulWidget {
  Color heartColor = const Color.fromARGB(255, 225, 225, 225);
  Map? productInfo ;
  bool? isNewtworkImage = false;
  Product({
    super.key,
    this.productInfo,
    this.isNewtworkImage,
  });
  @override
  ProductState createState() {
    return ProductState();
  }
}

class ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 0),
            color: Color.fromARGB(255, 237, 237, 237),
          ),
        ],
      ),
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          elevation: 0,
          shadowColor: const Color.fromARGB(255, 241, 241, 241),
          child: Column(
            children: [
              _getImageContainer(),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productInfo!["name"],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 83, 83, 83),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.productInfo!["price"]}DZ",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "3000 DZ",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.deepPurpleAccent,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            disabledColor: Colors.deepPurpleAccent,
                            textColor: Colors.white,
                            child: Text(
                              "View Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: null,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: widget.heartColor,
                            ),
                            onPressed: () => {
                              setState(() {
                                widget.heartColor ==
                                        Color.fromARGB(255, 225, 225, 225)
                                    ? widget.heartColor =
                                        Color.fromARGB(255, 255, 92, 80)
                                    : // Or
                                    widget.heartColor =
                                        Color.fromARGB(255, 225, 225, 225);
                              })
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImageContainer() {
    return Container(
      height: 110,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          color: Color.fromARGB(31, 115, 115, 115),
          blurRadius: 3,
        ),
      ]),
      child: AspectRatio(
        aspectRatio: 16 / 7,
        child: widget.isNewtworkImage == true
            ? Image.network(
              
                widget.productInfo!["images"][0]["image_path"],
                fit: BoxFit.contain,
              )
            : Image.asset(
                widget.productInfo!["images"][0]["image_path"],
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
