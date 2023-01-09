import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/categoriesDetailes/apartment.dart';
import 'package:flutter_application_1/categoriesDetailes/farm.dart';
import 'package:flutter_application_1/categoriesDetailes/land.dart';
import 'package:flutter_application_1/categoriesDetailes/office.dart';
import 'package:flutter_application_1/categoriesDetailes/shop.dart';
import 'package:flutter_application_1/categoriesDetailes/villa.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/upload.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapp extends StatefulWidget {
  final List num;
  final List firstlist; 
  const MyMapp({Key? key, required this.num,required this.firstlist}) : super(key: key);

  @override
  State<MyMapp> createState() => _MyMappState();
}
   List position= [
    "", //lat
    "",//long
    ];


class _MyMappState extends State<MyMapp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(32.22524248206087, 35.26306428015232);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

   
      
  addNewMarker(LatLng latLng){
    Marker marker = Marker(markerId: const MarkerId('MyLocaton'),
    position: latLng,
    
    );
    markers.add(marker);
    setState(() {
      
    });
  }
  Set <Marker> markers ={};
  @override
  void initState() {
   log(widget.num[0]);
   log(widget.firstlist[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return  MaterialApp(
      
      home: Scaffold(
        
        appBar: AppBar(
          title: const Text('Location On Map'),
          backgroundColor: primaryColor,
             leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
        ),
        body: Stack(
          children: <Widget>[
                GoogleMap(
          markers:markers ,
          onTap: (LatLng point) async {
            addNewMarker(point);
            position[0]=point.latitude.toString();
            position[1]=point.longitude.toString();
            log(position[0]);
            log(position[1]);
           
           
          

          },
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 8.0,
          ),
        ),
        Positioned(
          top:550,
          left: 40,
          right: 55,
          
          child: Container(
            height: 50,
            width: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
     
         onPressed: (){
          if(widget.num[0] == "1"){
             Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => Apartment(firstlist: [widget.firstlist[0]], position: [position[0],position[1]], img: [images],
              
                )));
          }else if(widget.num[0] == "2"){
             Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => Villa(firstlist: [widget.firstlist[0]], position: [position[0],position[1]],img: [images]
              
                )));
          }else if(widget.num[0] == "3"){
             Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => Office(firstlist: [widget.firstlist[0]], position: [position[0],position[1]],img: [images]
              
                )));
          }else if(widget.num[0] == "4"){
             Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => Shop(firstlist: [widget.firstlist[0]], position: [position[0],position[1]],img: [images]
              
                )));
          }else if(widget.num[0] == "5"){
             Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => Land(firstlist: [widget.firstlist[0]], position: [position[0],position[1]],img: [images]
              
                )));
          }else {
             Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => Farm(firstlist: [widget.firstlist[0]], position: [position[0],position[1]],img: [images]
              
                )));
          }



        
         },
  

         
        child: Text(
          'Save Adress'.tr(),
          textAlign: TextAlign.center,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    ),)

          ]
        )
    
        
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}