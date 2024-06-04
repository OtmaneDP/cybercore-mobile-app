import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/components/catigory.dart';
import 'package:fluttertest/components/costumdrawer.dart';
import 'package:fluttertest/components/custome_countable_icon.dart';
import 'package:fluttertest/components/notification_item.dart';
import 'package:fluttertest/components/product.dart';
import 'package:fluttertest/controllers/authcontroller.dart';
import 'package:fluttertest/controllers/notification_controller.dart';
import 'package:fluttertest/helperclasses/auth.dart';
import 'package:fluttertest/pages/login_screen.dart';
import 'package:fluttertest/pages/notification_page.dart';
import 'package:fluttertest/pages/product_details.dart';

class HomePage extends StatefulWidget {

  List?  products ;
  List?  catigorys;
  int activeCatigory = 0;
  List? notifications;
  TextEditingController searchController = TextEditingController();
  GlobalKey <FormState> searchFormKey  = GlobalKey();

  int? activeIcon ;
  
  HomePage({
    super.key,
    this.products,
    this.catigorys,
    this.notifications,
  });
  

  @override
  HomePageState createState() {
    return HomePageState();
  }
  
}

@override
class HomePageState extends State<HomePage> {

  Widget build(BuildContext context) {
    print(getNotificationCounter());
    return Scaffold(
      appBar: AppBar(
          title: Form(
          key: widget.searchFormKey,
            child: TextFormField(
              cursorWidth: 0.4,
              cursorHeight: 21,
              cursorColor: Colors.grey,
              style: TextStyle(
                fontSize: 13,
              ),
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[100],
                hoverColor: Colors.grey[200],
              ),
              onChanged: (value){
                 setState(() {
                   widget.searchController.text = value;
                 });
              },
            ),
          ),
          leadingWidth: 30,
      ),
       drawer: Drawer(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: CostumDrawer(),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Text("New",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(190, 0, 0, 0),
            ),),
            Divider(
              height: 15,
              endIndent: 200,
              indent: 2,
              thickness: 0.2,
              color: Colors.black38,
              
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(33, 124, 77, 255),
                
                boxShadow:  [
                  // BoxShadow(
                  //   blurRadius: 5,
                  //   offset: Offset(-2, 0), 
                  //   color: Color.fromARGB(134, 138, 137, 137)
                  // )
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Stack(clipBehavior: Clip.none, children: [
                Positioned(top: 20, left:10 , child: Text("New Offers",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black54),)),
                Positioned(right: 0, top: -8, child:Image.asset("images/test.png",height: 190,)),
                Positioned(right: 130, bottom: 0, child:Image.asset("images/test.png",height: 115,)),
                Positioned(bottom: 10,left: 10,child: MaterialButton(onPressed: null, child: Text("New Store"),disabledColor: const Color.fromARGB(255, 109, 56, 255),textColor: Colors.white,))
              ],),
            ),
            SizedBox(height: 10,),
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(190, 0, 0, 0),
              ),
            ),
             Divider(
              height: 15,
              endIndent: 200,
              indent: 2,
              thickness: 0.2,
              color: Colors.black38,
              
            ),
            Container(
              height: 110,
              padding: EdgeInsets.only(top: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.catigorys!.length,
                itemBuilder: (context, index) => Catigory(
                  catigoryInfo: widget.catigorys![index],
                  isNewtworkImage: true,
                  index: index,
                  activeCatigory: widget.activeCatigory,
                  onACtive: (activeCatigoryIndex){
                    setState(() {
                      widget.activeCatigory = activeCatigoryIndex;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Lest Steeling",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(190, 0, 0, 0),
              ),
            ),
            const Divider(
              height: 15,
              endIndent: 200,
              indent: 2,
              thickness: 0.2,
              color: Colors.black38,
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 13,
                crossAxisSpacing: 5,
                childAspectRatio: 0.7,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.products!.length,
              itemBuilder: (context, index) => Visibility(
                visible: widget.products![index]["catigory_id"] == widget.catigorys![widget.activeCatigory]["id"] ? true : false,
                child: InkWell(
                  onTap: () {
                    _toDetailsPage(widget.products![index]);
                  },
                  child: Visibility(
                    visible: inSearchResulte(widget.products![index]["name"]),
                    child: Product(
                      productInfo: widget.products![index],
                      isNewtworkImage: true,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(88, 158, 158, 158),
              offset: Offset(0,0),
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ]

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CountableIcon(
              index:1,
              icon: Icons.delivery_dining_sharp,
              activeIconIndex: widget.activeIcon,
              counter: 0,
              onClick: (activeIcon){
                setState(() {
                  widget.activeIcon = activeIcon;
                });
              },
            ),
            CountableIcon(
              index: 0,
              activeIconIndex: widget.activeIcon,
              icon: Icons.local_grocery_store_outlined,
              counter: getNotificationCounter(),
              onClick: null,
            ),
            CountableIcon(
              index: 0,
              activeIconIndex: widget.activeIcon,
              icon: Icons.notifications_outlined,
              counter: getNotificationCounter(),
              onClick: (activeIndex) async {
                 var response  = await NotificationController.update(isRead: 1); 
                 setState((){
                  widget.notifications = jsonDecode(response)["data"];
                  widget.activeIcon = activeIndex;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return  NotificationController().getView();
                  }));
                 });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _toDetailsPage(Map productInfo) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProductDetails(productInfo: productInfo);
    }));
  }

  bool inSearchResulte(String productName){
    int searchInputLength = widget.searchController.text.length;

    if(productName.length >= searchInputLength){
      String substredProductName =  productName.substring(0,searchInputLength);
      return widget.searchController.text == substredProductName ? true : false;   
    }
    return false;
  } 
  int getNotificationCounter()  {
    int notificationCounter = 0;

    for(var notification in widget.notifications! ){
       if(notification["is_read"] == 0){
         notificationCounter++;
       }
    }
    return notificationCounter;
  }
}
