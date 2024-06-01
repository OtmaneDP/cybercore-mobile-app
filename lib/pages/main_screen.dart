import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/models/user_model.dart';
import 'package:fluttertest/pages/home_page.dart';
import 'package:fluttertest/pages/login_screen.dart';

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
      body: Container(
        child: Stack(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    
                    decoration: BoxDecoration(
                      color: Color.fromARGB(199, 124, 77, 255),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight:Radius.circular(50) )
                    ),
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.sizeOf(context).width / 2 + 12,
                    child: Container(
                      clipBehavior: Clip.none,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Gamming Laptops",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 37,
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            "Mouse & Keybors and More Offers",
                            style: TextStyle(
                                height: 1.3,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          getSignInButton(),
                          Container(
                            height: 320,
                            padding: EdgeInsets.only(top: 90),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  leading: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "Finde your favorite Items",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  leading: Icon(
                                    Icons.paid_outlined,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "Esy & Safe Payment ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  leading: Icon(
                                    Icons.delivery_dining_outlined,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "Product Delivery at Home",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                       
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white70,
                    width: MediaQuery.sizeOf(context).width / 2 - 20,
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
                                  child: Image.asset("images/p (5).png"),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: MediaQuery.sizeOf(context).height,
                                  child: Image.asset("images/p (6).png"),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: MediaQuery.sizeOf(context).height,
                                  child: Image.asset("images/p (7).png"),
                                ),
                              ],
                              options: CarouselOptions(
                                autoPlay: true,
                                scrollDirection: Axis.vertical,
                                onPageChanged: (index, reson) {},
                              )),
                        ),
                        Positioned(
                          bottom: 50,
                          right: 0,
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: 150,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Radio(
                                    focusColor: Colors.deepPurpleAccent,
                                    toggleable: true,
                                    value: false,
                                    groupValue: null,
                                    onChanged: (value) {
                                      setState(() {
                                        widget.myCarouselController
                                            .animateToPage(0);
                                      });
                                    }),
                                Radio(
                                    value: false,
                                    groupValue: null,
                                    onChanged: (value) {
                                      widget.myCarouselController
                                          .animateToPage(1);
                                    }),
                                Radio(
                                    value: false,
                                    groupValue: null,
                                    onChanged: (value) {
                                      widget.myCarouselController
                                          .animateToPage(2);
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
            Positioned(
                child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.shopping_cart_checkout_rounded,color: Colors.white,size: 30,),
                  Text(
                    "Cyber Core",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.menu_outlined)
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

//  get Sign in Button tumporely

  Widget getSignInButton() {
    return MaterialButton(
      elevation: 1.5,
      padding: EdgeInsets.symmetric(horizontal: 50),
      height: 40,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return LoginScreen();
        }));
      },
      textColor: Colors.white,
      child: Text("Sign In"),
      color: Colors.deepPurpleAccent,
    );
  }
}
