


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/categoriesDetailes/farm.dart';
import 'package:flutter_application_1/categoriesDetailes/land.dart';
import 'package:flutter_application_1/categoriesDetailes/office.dart';
import 'package:flutter_application_1/categoriesDetailes/shop.dart';
import 'package:flutter_application_1/categoriesDetailes/villa.dart';
import 'package:flutter_application_1/my_map.dart';

import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/upload.dart';
import 'package:flutter_application_1/widgets/colors.dart';

import 'categoriesDetailes/apartment.dart';
import 'categories.dart';






class MyReal1 extends StatefulWidget {
  final List firstlist;
  const MyReal1({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<MyReal1> createState() => _MyRealState1();
}

class _MyRealState1 extends State<MyReal1> {
  
      List<Categories>?cat;
      Categories? selectedCategories;
    @override
   void initState() {
   super.initState();
   cat=Categories.getCategories();
   
 
  }

  

  List<Widget> createRdioListCategories(){
    List<Widget> widgets =[];
    for(Categories categories in cat!){
      widgets.add(
        RadioListTile(
          value: categories,
         groupValue:selectedCategories,
         title: Text(categories.catname,style: pText2,),
          onChanged: (currentcat){
            // print(categories.catid);
           
           setState(() {
      selectedCategories = categories;
    });
          if(categories.catid == 1){
                   Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  Apartment(firstlist: [widget.firstlist[0]], position:[position[0],position[1]], img: [images],
              
                )));

          }else if(categories.catid == 2){
                   Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  Villa(firstlist: [widget.firstlist[0]], position:[position[0],position[1]],img: [images]
              
                )));

          }
          else if(categories.catid == 3){
                   Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  Office(firstlist: [widget.firstlist[0]], position:[position[0],position[1]],img: [images]
              
                )));

          }else if(categories.catid == 4){
                   Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  Shop(firstlist: [widget.firstlist[0]], position:[position[0],position[1]],img: [images]
              
                )));

          }else if(categories.catid == 5){
                   Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  Land(firstlist: [widget.firstlist[0]], position:[position[0],position[1]],img: [images]
              
                )));

          }else {
                   Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  Farm(firstlist: [widget.firstlist[0]], position:[position[0],position[1]],img: [images]
              
                )));

          }
        
          },
          selected: selectedCategories == categories,
          activeColor: Colors.amber,
          
          ),

      );
    }
   return  widgets;
  }
  @override
  Widget build(BuildContext context) {
    //   Size size = MediaQuery.of(context).size;
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
              
            appBar: AppBar(
             backgroundColor:primaryColor ,
                title: Text('Add Real Estates'.tr(), textAlign: TextAlign.center,style:textColor7,),
               centerTitle: true,
            
               
            ),

         
  body: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children:<Widget> [
      Container(
        padding: const EdgeInsets.all(25.0),
        child: const Text("Choose the type of property you want to add",style:pText1,textAlign: TextAlign.center),
      ),
      // const Divider(
      //   height: 20,
      //   color: Colors.grey,
      // ),
      Column(
        children: createRdioListCategories(),
      )
    ],

            
            
                 
             
  ),

        ),
      ),
    );
  }
   
}

