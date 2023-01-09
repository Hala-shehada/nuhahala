
// import 'dart:developer';
// import 'dart:typed_data';
import 'package:dio/dio.dart';
// import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/categoriesDetailes/apartment.dart';
import 'package:flutter_application_1/categoriesDetailes/farm.dart';
import 'package:flutter_application_1/categoriesDetailes/land.dart';
import 'package:flutter_application_1/categoriesDetailes/office.dart';
import 'package:flutter_application_1/categoriesDetailes/shop.dart';
import 'package:flutter_application_1/categoriesDetailes/villa.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/widgets/colors.dart';
// import 'package:http_parser/http_parser.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

import 'package:flutter_application_1/my_map.dart';
class Upload extends StatefulWidget {
  final List firstlist;
  final List num;
  const Upload({Key? key, required this.firstlist, required this.num}) : super(key: key);
  

  @override
  State<Upload> createState() => _UploadState();
}
List<Asset> images = <Asset>[];
// late File file;
// bool v=false;
// String? postImage;
class _UploadState extends State<Upload> {
  

//   Future save()async{
//     // print( widget.firstlist[0]);
//   var url= Uri.parse('http://192.168.1.104/gradpro/uplodImage.php');
//   var request=http.MultipartRequest('post',url);
//   request.fields['name']=postImage!;
//   var pic=await http.MultipartFile.fromPath("image",file.path);
//   request.files.add(pic);
//   await request.send();
//   await(v=true);

// }

// Future addPost()async{
  
//   var url= Uri.parse('http://192.168.1.104/gradpro/addpost.php');
//   var request=http.MultipartRequest('post',url);
//   request.fields['name']=postImage!;
//   // print(postImage);
//   // request.fields['context']=pcontext;
//   request.fields['id']="111";
//   // request.fields['userimage']=profileImage;
//   // request.fields['username']=PUsername;
//   var pic=await http.MultipartFile.fromPath("image",file.path);
//   request.files.add(pic);
//   await request.send();
// }

// Future choose()async 
// {
//   // ignore: deprecated_member_use
//   final myFile= await ImagePicker().getImage(source: ImageSource.gallery);
  
//   setState(() {
//     if(myFile==null) return;
//     file=File(myFile.path);
//     postImage=myFile.path.split("/").last;
//     save();
//   });
// }

// List<Asset> images = <Asset>[];
Dio dio = Dio();

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 7,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  

   Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    // ignore: unused_local_variable
    String error = 'No Error Detected';

    try {
      resultList = await MultipleImagesPicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: const CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
     
    } on Exception catch (e) {
     // print(e.toString());
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  // _saveTmage()async{
 
  //   if(images != null){
  //     for(var i=0; i< images.length;i++){
  //       ByteData byteData = await images[i].getByteData();
  //       List<int> imageData =byteData.buffer.asUint8List();
        

  //        MultipartFile multipartFile = MultipartFile.fromBytes(
  //         imageData,
  //         filename: images[i].name,
  //         contentType: MediaType('image','jpg'),
  //        );
  //        log(images[i].name.toString());
     
          
  //         FormData formData = FormData.fromMap({"image":multipartFile,"user_id":widget.firstlist[0]});
  //         var response = await dio.post('http://192.168.1.104/gradpro/uploadMulImg.php',data: formData);
  //         if(response.statusCode == 200){
  //           print(response.data);
  //         }
          


  //     }
     
  //   }
  // }

  @override
  Widget build(BuildContext context) {
       final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    
    return Scaffold(
              
            appBar: AppBar(
             backgroundColor:primaryColor ,
                title: Text('Upload Image'.tr(), textAlign: TextAlign.center,style:textColor7,),
               centerTitle: true,
           
               
            ),

  body: Column(
         
            children: [
            
           Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.004,
                  
                ),
                
            
              ),
               
              SizedBox(height: height * 0.02),
                Center(
              child:roundedButton(),
                ),
                 SizedBox(height: height * 0.02),
                 Expanded(
              child: buildGridView(),
            ),
          

              roundedButton1(),
              
              

            ],

            
    )
    );
  }

  Widget roundedButton(){
  Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
       // onPressed:loadAssets,
         onPressed: loadAssets,
   //choose();

         
        child: Text(
          'Picked Image'.tr(),
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }


Widget roundedButton1(){
  Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
      //  onPressed: _saveTmage,
         onPressed:(){
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
          'Save'.tr(),
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

   
}



