import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/custom_alert.dart';
import 'package:fluttertest/components/product.dart';
import 'package:fluttertest/controllers/cart_page_controller.dart';
import 'package:fluttertest/controllers/product_controller.dart';
import 'package:fluttertest/pages/cart_page.dart';

class ProductDetails extends StatefulWidget {
  final Map productInfo;
  String? selectedColor ;
 
  var imageCarouselController = CarouselController();
  ProductDetails({
    super.key,
    required this.productInfo,
  }){
    this.selectedColor = productInfo["color"]["0"];
  }
   
 
  ProductDetailsState createState() {
    return ProductDetailsState();
  }
}

class ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Product"),
        // actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        color: Colors.white70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    color: Color.fromARGB(31, 100, 100, 100),
                    blurRadius: 5,
                  ),
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: _getAnimtedImages(),
                ),
              ),
              Positioned(
                bottom: -15,
                right: 20,
                child: Icon(
                    Icons.favorite,
                    color: widget.productInfo["favorited"] == 1 ? Colors.red : Colors.grey,
                    size: 25,
                  ),
              ),
            ]),

            // part tow 
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.productInfo["name"],
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(221, 46, 46, 46)),
                                    ),
                                    Text(
                                      widget.productInfo["catigory"]["name"],
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    // this is commented tomporery
                                    // Row(
                                    //   children: [
                                    //     Icon(
                                    //       Icons.star,
                                    //       color: Color.fromARGB(255, 255, 230, 0),
                                    //     ),
                                    //     Icon(Icons.star,
                                    //         color: Color.fromARGB(255, 255, 230, 0)),
                                    //     Icon(Icons.star,
                                    //         color: Color.fromARGB(255, 255, 230, 0)),
                                    //     Icon(
                                    //       Icons.star,
                                    //       color: Colors.grey,
                                    //     ),
                                    //   ],
                                    // )
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "${widget.productInfo["price"]} DZ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 55, 0, 207),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Text("Ram Size"),
                    // _getRamCheckBoxes(),
                    Text(
                      "Color",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _getRadiosButton(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _getDescriptionSpace(),
                  ],
                ),
              ),
            ),
            _getFloatButtons(context)
          ],
        ),
      ),
    );
  }

  Widget _getRamCheckBoxes() {
    return Container(
      height: 60,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: null,
            child: Text("8 GB"),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("16 GB"),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("32 GB"),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getRadiosButton() {
    int selectedRadioIndex;
    return Container(
      height: 25,
      padding: EdgeInsets.zero,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (contex, index) {
          return Transform.scale(
            scale: 1.6,
            child:  Radio<String>(
                materialTapTargetSize: MaterialTapTargetSize.padded,
                activeColor: Color(_toHexColor(widget.productInfo["color"]["${index}"])),
                value: widget.productInfo["color"]["${index}"],
                groupValue: widget.selectedColor,
                onChanged: (value) {
                  setState(() {
                    widget.selectedColor = value;
                  });
                }),
          );
        },
      ),
    );
  }

  Widget _getDescriptionSpace() {
    return Expanded(
      child: ListView(
        children: [
          Text(
            widget.productInfo["description"],
            style: TextStyle(
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getFloatButtons(context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            onPressed: null,
            disabledColor: Colors.white,
            color: Colors.white,
            child: Text(
              "Boy Now",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            minWidth: 150,
            height: 45,
            textColor: Colors.deepPurpleAccent,
            shape: Border.all(color: Colors.deepPurpleAccent, width: 1),
          ),
          MaterialButton(
            color: Colors.deepPurpleAccent,
            disabledColor: Colors.deepPurpleAccent,
            child: Text("Add To Cart"),
            minWidth: 150,
            height: 45,
            textColor: Colors.white,
            onPressed: () async {

              if(widget.productInfo["state"] == 0){
                  showDialog(context: context, builder: (context){
                  return CustomAlert(
                    alertIcon: Icon(Icons.production_quantity_limits_sharp,color: Colors.white,), 
                    stateMessage: "Problem", 
                    stateDescription: "Product quantity has Limited", 
                    color: const Color.fromARGB(215, 155, 39, 176));
                  });
              }
              // add product to cart 
              else if(widget.productInfo["state"] == 1){
                await ProductController.addToCart(
                  productId: widget.productInfo["id"],
                  color: widget.selectedColor.toString(),
                );
                 // redirect to nextPage Cart page 
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (rout) {
                  return  CartPageController().getView();
                  })
                );
              }
            
             
            },
          ),
        ],
      ),
    );
  }

  _getAnimtedImages() {
    return CarouselSlider(
        carouselController: widget.imageCarouselController,
        items: List.generate(
            widget.productInfo["images"].length,
            (index) => Image.network(
                  widget.productInfo["images"][index]["image_path"],
                )),
        options: CarouselOptions(
          autoPlay: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reson) {},
          viewportFraction: 1,
          autoPlayAnimationDuration: Duration(seconds: 1),
          animateToClosest: true,
          autoPlayCurve: Easing.standard,
        ));
  }

  int _toHexColor(String color){
    try{
      return int.parse(color.replaceAll("#",""),radix: 16)+0xFF000000;
    }catch(e){
      return 0;
    }
    
  }
}
