// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/http.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/widgets/colors.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'alert_dialog.dart';
import 'edit_profile.dart';


class Profile extends StatefulWidget {
   final List firstlist;
  const Profile({Key? key, required this.firstlist}) : super(key: key);

  @override
 
  _ProfileState createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {


  List<String> myinfo = [];
 String name = '';
  String email = '';
 String city = '';
 String phone = '';
  showAccountinfo() async {
      var result = await httpGet("accountinfo", {
      "id": widget.firstlist[0],
    });

    myinfo = result.data.split("&");
    name  = myinfo[0];
    email = myinfo[1];
    city = myinfo[2];
    phone = myinfo[3];
    setState(() {});
  }

  delete() async {
    var result = await httpGet("userdelete", {
      "id": widget.firstlist[0],
    });
    if(result.data =="OK"){
  }

  }

  de(){
      if(tappedYes == true){
            delete();
          }
  }

   bool tappedYes = false;
   File? _imageFile;
   final ImagePicker _picker = ImagePicker();
 @override
  void initState() {
    showAccountinfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;

    //final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.2,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundImage:_imageFile == null ? const AssetImage("assets/images/blank-profile.png") :FileImage(File(_imageFile!.path)) as ImageProvider,
                          
                          ),
                        ),
                      
                      ),

                      
                    ),

                             Positioned(
                              bottom: 20.0,
                              right: 143.0,
                              child: InkWell(
                                onTap: (){
                                  showModalBottomSheet(
                                    context: context,
                                     builder: ((builder) => bootmsheet()),
                                     
                                     );

                                },
                            
                             child: const Icon(
                                Icons.camera_alt,
                                color: iconColor,
                                size: 30.0,

                            ),
                              ),

                            ),
             
                  ],
                ),

                 SizedBox(
                  height: size.width * 0.06,
                ),
                Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    
          Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.02),
     height: size.height * 0.06,
      width: size.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
     
      child: TextButton(
        onPressed: () {
            Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  Editprofile(firstlist: [widget.firstlist[0],name,city],
              
                )));
        },
        child: const Text(
          "Edite profile",
          style:  pText,
        ),
      ),
      
 ),



               ListTile(
            leading: const Icon(Icons.person),
            title: Text(name,style:  pText1,),
        ),
        const Divider(),
        ListTile(
            leading: const Icon(Icons.email),
            title: Text(email,style:  pText1,),
        ),
       const Divider(),
     ListTile(
            leading: const Icon(Icons.location_city),
            title: Text(city,style:  pText1,),
        ),
      const Divider(),
       const Divider(),
        ListTile(
            leading: const Icon(Icons.phone),
            title: Text(phone,style:  pText1,),
        ),
         const Divider(),
    Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.02),
     height: size.height * 0.06,
      width: size.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
     
      child: TextButton(
       onPressed: () async {
            final action = await AlertDialogs.yesCancelDialog(context, 'Delete Account', 'Are you sure you want to delete your account completely?');
            if(action == DialogsAction.delete) {
              // delete();
              setState(() => tappedYes = true);
             
                  
            } else {
              setState(() => tappedYes = false);
            }
          },
        
            
        child: const Text(
          "Delete Account",
          style:  pText,
        ),
      ),
      
 ),
                   
                  ],
                )


  
              ],
            
             
            ),
          ),
        )
      ],
    );


    
  }

  Widget bootmsheet(){
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children:<Widget>[
          Text(
            "Choose Profile photo",
            style: textColor1,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              ElevatedButton.icon(
                icon: const Icon(Icons.camera),
                 onPressed: () { 
                  takePhoto(ImageSource.camera);
                  }, 
                 label: const Text("Camera"),
                 // ignore: prefer_const_constructors
                 style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(primaryColor),
            
    ),
                 
                
              ),

              const SizedBox(
            width: 10,
          ),

              ElevatedButton.icon(
                icon: const Icon(Icons.image),
                 onPressed: () { 
                  takePhoto(ImageSource.gallery);
                  }, 
                 label: const Text("Gallery"),
                 style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(primaryColor),
            
    ),
                
              )
            ],
          )
        ] 
        
        
        
        
        
        
        ),



    );
  }
  void takePhoto(ImageSource source) async {
    var pickedFile = await _picker.pickImage(
      source:source,
      );
      setState(() {
         _imageFile= File(pickedFile!.path) ;
        
      });
   
  }
  
}