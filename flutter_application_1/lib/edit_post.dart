

import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_real.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EditPosts extends StatefulWidget {
  
  // ignore: prefer_typing_uninitialized_variables
  final postList;
  // ignore: prefer_typing_uninitialized_variables
  final index;
  
  const EditPosts({super.key, this.postList,this.index});

  @override
  State<EditPosts> createState() => _EditPostsState();
}

class _EditPostsState extends State<EditPosts> {
  TextEditingController realName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController totalSpace = TextEditingController();


 File ?_image;
 final picker = ImagePicker();
 // ignore: prefer_typing_uninitialized_variables
 var type;
 // ignore: prefer_typing_uninitialized_variables
 var selCountry;
  int? selectedRadioTile;
  setSelectedRadioTile(int val) {
setState(() {
selectedRadioTile = val;
});
}


String? textfieldsStrings2;


Future updatePost()async{

  if(type == "villa"){
     var uri =  Uri.parse("http://192.168.1.104/gradpro/updatePost.php");
    var request =  http.MultipartRequest("POST",uri);
    request.fields['post_id'] = widget.postList[widget.index]['post_id'];
    request.fields['real_name'] = realName.text;
    request.fields['price'] = price.text;
    request.fields['space'] = totalSpace.text;
    request.fields['rent_sale'] = textfieldsStrings2!;
     request.fields['city'] = selCountry;
     var pic = await http.MultipartFile.fromPath('image', _image!.path,filename:_image!.path);
     request.files.add(pic);
     

     var response = await request.send();

     if(response.statusCode == 200){
      Fluttertoast.showToast(msg: 'Post Updated');
      
       // ignore: use_build_context_synchronously
       Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  MyReal(firstlist: [widget.postList[widget.index]['user_id']]
                )));
      }

  }
  else if(type == "apartment"){
     var uri =  Uri.parse("http://192.168.1.104/gradpro/updateApartment.php");
    var request =  http.MultipartRequest("POST",uri);
    request.fields['post_id'] = widget.postList[widget.index]['post_id'];
    request.fields['real_name'] = realName.text;
    request.fields['price'] = price.text;
    request.fields['space'] = totalSpace.text;
    request.fields['rent_sale'] = textfieldsStrings2!;
     request.fields['city'] = selCountry;
     var pic = await http.MultipartFile.fromPath('image', _image!.path,filename:_image!.path);
     request.files.add(pic);
      

     var response = await request.send();

     if(response.statusCode == 200){
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  MyReal(firstlist: [widget.postList[widget.index]['user_id']]
                )));
     }

  }

  else if(type == "farm"){
     var uri =  Uri.parse("http://192.168.1.104/gradpro/updateFarm.ph");
    var request =  http.MultipartRequest("POST",uri);
    request.fields['post_id'] = widget.postList[widget.index]['post_id'];
    request.fields['real_name'] = realName.text;
    request.fields['price'] = price.text;
    request.fields['space'] = totalSpace.text;
    request.fields['rent_sale'] = textfieldsStrings2!;
     request.fields['city'] = selCountry;
     var pic = await http.MultipartFile.fromPath('image', _image!.path,filename:_image!.path);
     request.files.add(pic);
      

     var response = await request.send();

     if(response.statusCode == 200){
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  MyReal(firstlist: [widget.postList[widget.index]['user_id']]
                )));
     }

  }
  else if(type == "land"){
     var uri =  Uri.parse("http://192.168.1.104/gradpro/updateLand.php");
    var request =  http.MultipartRequest("POST",uri);
    request.fields['post_id'] = widget.postList[widget.index]['post_id'];
    request.fields['real_name'] = realName.text;
    request.fields['price'] = price.text;
    request.fields['space'] = totalSpace.text;
    request.fields['rent_sale'] = textfieldsStrings2!;
     request.fields['city'] = selCountry;
     var pic = await http.MultipartFile.fromPath('image', _image!.path,filename:_image!.path);
     request.files.add(pic);
      

     var response = await request.send();

     if(response.statusCode == 200){
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  MyReal(firstlist: [widget.postList[widget.index]['user_id']]
                )));
     }

  }
  else if(type == "office"){
     var uri =  Uri.parse("http://192.168.1.104/gradpro/updateOffice.php");
    var request =  http.MultipartRequest("POST",uri);
    request.fields['post_id'] = widget.postList[widget.index]['post_id'];
    request.fields['real_name'] = realName.text;
    request.fields['price'] = price.text;
    request.fields['space'] = totalSpace.text;
    request.fields['rent_sale'] = textfieldsStrings2!;
     request.fields['city'] = selCountry;
     var pic = await http.MultipartFile.fromPath('image', _image!.path,filename:_image!.path);
     request.files.add(pic);
      

     var response = await request.send();

     if(response.statusCode == 200){
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  MyReal(firstlist: [widget.postList[widget.index]['user_id']]
                )));
     }

  }
  else if(type == "shop"){
     var uri =  Uri.parse("http://192.168.1.104/gradpro/updateShop.php");
    var request =  http.MultipartRequest("POST",uri);
    request.fields['post_id'] = widget.postList[widget.index]['post_id'];
    request.fields['real_name'] = realName.text;
    request.fields['price'] = price.text;
    request.fields['space'] = totalSpace.text;
    request.fields['rent_sale'] = textfieldsStrings2!;
     request.fields['city'] = selCountry;
     var pic = await http.MultipartFile.fromPath('image', _image!.path,filename:_image!.path);
     request.files.add(pic);
      

     var response = await request.send();

     if(response.statusCode == 200){
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  MyReal(firstlist: [widget.postList[widget.index]['user_id']]
                )));
     }

  }
 
}
         

@override
  void initState() {
    super.initState();
    if(widget.index != null){
      type =  widget.postList[widget.index]['cat_type'];
      realName.text = widget.postList[widget.index]['real_name'];
      price.text = widget.postList[widget.index]['price'];
      totalSpace.text = widget.postList[widget.index]['space'];
      selCountry = widget.postList[widget.index]['city'];
      if(widget.postList[widget.index]['rent_sale'] == "RENT"){
        textfieldsStrings2= "RENT";
        selectedRadioTile=2;

      }
      else if(widget.postList[widget.index]['rent_sale'] == "SALE"){
        textfieldsStrings2= "SALE";
        selectedRadioTile=1;
      }
      else {
        selectedRadioTile=0;
      } 

     

    }
  }


 


Future choiceImage()async{
  // ignore: deprecated_member_use
  var pickedImage = await picker.getImage(source: ImageSource.gallery);
  setState(() {
    _image = File(pickedImage!.path);
  });
  
}

  @override
  Widget build(BuildContext context) {
       return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
     
      appBar: AppBar(
          backgroundColor:primaryColor ,
        title:  Text("Edit Post".tr(), textAlign: TextAlign.center,style:textColor7,),
          centerTitle: true,
        
        ),
      body:ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: realName,
            decoration: const InputDecoration(labelText: 'Real Name'),
          ),
          
          ),

          Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: price,
            decoration: const InputDecoration(labelText: 'Price'),
          ),
          
          ),

                    Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: totalSpace,
            decoration: const InputDecoration(labelText: 'Total Space'),
          ),
          
          ),

        IconButton(
          onPressed: (){
            choiceImage();
          },
           icon: const Icon(Icons.image,size: 50,)),
           const SizedBox(height: 20,),

           SizedBox(width: 130,height: 130,child: _image == null ? const Text("No Image Selected",textAlign: TextAlign.center,): Image.file(_image!),),
           
            const SizedBox(height: 20,),

            DropdownButton(
                value: selCountry,
              isExpanded: true,
              hint: const Text("Select City"),
              items: [      'Nablus',
    'Hebron',
    'Ramallah',
    'Tulkarm',
    'Jericho',
    'Jenin',
    'Bethlehem',
    'Qalqilya',             ].map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),))
                          .toList(), 
              onChanged: (newValue){
                setState(() {
                  selCountry=newValue;
                });
              }
              ),

         //     const SizedBox(height: 10,),


                Container(
                margin: const EdgeInsets.symmetric(vertical:4.0),
             child: SizedBox(
            
              child: Column(
               
                children: <Widget>[
                  ButtonBar(
                   alignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Radio(
                         activeColor: Colors.amber,
                        value: 1,
                         groupValue: selectedRadioTile,
                          onChanged: (val){
                            setSelectedRadioTile(val!);
                          
                          textfieldsStrings2 = "SALE";

                          },
                        
                          ),
                           Text("Sale".tr(),style: pText2),
                            const SizedBox(width: 8.0),
                            Radio(
                              activeColor: Colors.amber,
                        value: 2,
                         groupValue: selectedRadioTile,
                          onChanged: (val){
                            setSelectedRadioTile(val!);
                        
                           textfieldsStrings2 = "RENT";

                          },
                        
                          ),
                          Text("Rent".tr(),style: pText2),

                           

                           

                    ],
                  ),
             // SizedBox(height: height * 0.001),
            
                 
                ],

                
              ),
            ),
            
),

        const SizedBox(height: 2,),

               ElevatedButton(
                          onPressed: (){
                            updatePost();
      
        //                          Navigator.push(
        // context,
        // MaterialPageRoute(
        //     builder: (_) =>  Profile(firstlist: [widget.firstlist[0]])));

        //                 }
                      
                       
                          },
                         style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                         ),
                          child: Text("Update".tr() , style: const TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.black
                         )),
                          
                          )




          




          


      ]),

    ),
    ),
    );
   
  }





}



