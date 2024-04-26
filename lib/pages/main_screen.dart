import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  var myCarouselController = CarouselController();
  var currentPage = 0;
  @override
  MainScreenState createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  
  @override
  Widget build(BuildContext) {
    
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.store_sharp,color: Colors.deepPurpleAccent,),
        title: Text("Cyber Core"),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child:Icon (Icons.menu),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              // color: Colors.red,
              width: MediaQuery.sizeOf(context).width/2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Mouse",style: TextStyle(
                      fontSize: 15,
                      height: 0.2,
                      color: Colors.grey
                    ),),
                    Text("Configuies",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                    ),),
                    Text("Keybords",style: TextStyle(
                      height: 0.2,
                      fontSize: 15,
                      color: Colors.grey
                    ),),
                    SizedBox(height: 45,),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      height: 40,
                      onPressed: null,
                      textColor: Colors.white,
                      child: Text("Sign In"),
                      disabledColor: Colors.deepPurpleAccent,  
                    )

                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width/2,
              height: MediaQuery.sizeOf(context).height,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height,
                    child: CarouselSlider(
                      carouselController: widget.myCarouselController,
                      items: [
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.sizeOf(context).height,
                          child: Image.asset("images/p (7).jpg"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.sizeOf(context).height,
                          child: Image.asset("images/p (1).jpg"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.sizeOf(context).height,
                          child: Image.asset("images/p (3).jpg"),
                        ),
                      ], 
                      options: CarouselOptions(
                        
                        autoPlay: true,
                        scrollDirection: Axis.vertical,
                        onPageChanged: (index,reson){
                         
                        },
                        
                      )),
                  ),
                  Positioned(
                    bottom: 50,
                    right: 0,
                    child: Container(
            
                      height: 120,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Radio(
                            toggleable: true,
                            value: false, 
                            groupValue: null,
                            onChanged: (value){
                              setState(() {
                                widget.myCarouselController.animateToPage(0);
                              });
                            }
                          ),
                           Radio(value: false, groupValue: null, onChanged: (value){
                              widget.myCarouselController.animateToPage(1);
                          }),
                           Radio(value: false, groupValue: null, onChanged: (value){
                              widget.myCarouselController.animateToPage(2);
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
