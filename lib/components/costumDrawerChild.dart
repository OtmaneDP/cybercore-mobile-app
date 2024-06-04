
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertest/pages/myaccount.dart';

class CostumDrawerChild extends StatelessWidget{
  final String? title;
  final Icon? icon; 
  final Widget? destinationPage;
  final bool? counted;
  final int? counter ;
  const CostumDrawerChild({
    super.key,
    required this.title, 
    required this.icon,
    required this.destinationPage,
    this.counted,
    this.counter, 
  });

  Widget build(BuildContext context){
    return  ListTile(
      leading: this.icon!,
      title: Text(this.title!),
      hoverColor: Colors.grey[200],
      selectedColor: Colors.grey,
      trailing: counted == false ? null : Container(
        alignment: Alignment.center,
        width: 18, 
        height: 18,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Text(counter == null ? "0" : "${this.counter}" ,style: TextStyle(
          color: Colors.white,
          fontSize: 10.05
        ),),
      ),
      onTap: () {
        
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return this.destinationPage!;
        }));
      },
    );
  }


}