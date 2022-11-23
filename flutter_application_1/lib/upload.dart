
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:http_parser/http_parser.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'modules/http.dart';

class Upload extends StatefulWidget {
  final List firstlist;
  const Upload({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}


class _UploadState extends State<Upload> {

List<Asset> images = <Asset>[];

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
      print(e.toString());
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

  _saveTmage()async{
    if(images != null){
      for(var i=0; i< images.length;i++){
        ByteData byteData = await images[i].getByteData();
        List<int> imageData =byteData.buffer.asInt8List();

         MultipartFile multipartFile = MultipartFile.fromBytes(
          imageData,
          filename: images[i].name,
          contentType: MediaType('image','jpg'),
         );
     
           
          FormData formData = FormData.fromMap({"image":multipartFile});
          print(formData );


      }
    }
  }

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
        onPressed:loadAssets,
        
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
        onPressed:() {
      _saveTmage();
        
        },
        
        child: Text(
          'Save'.tr(),
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
   
}

