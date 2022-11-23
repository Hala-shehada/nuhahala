import 'dart:io';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit_password.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/user_profile.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'modules/http.dart';



class Editprofile extends StatefulWidget {
  final List firstlist;
  const Editprofile({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
      // ignore: prefer_typing_uninitialized_variables   
   var selectedCounrty;
    List textfieldsStrings2 = [
    "", //name
    "", //city 
  ];
  final GlobalKey<FormState>namekey =GlobalKey();
  final GlobalKey<FormState>citykey =GlobalKey();
   File? _imageFile;
   final ImagePicker _picker = ImagePicker();
   edit() async {
    //print(street);
    await httpPost("change-account", {
      "id": widget.firstlist[0],
      if( textfieldsStrings2[0]=='')
      "name": widget.firstlist[1]
      else "name": textfieldsStrings2[0] ,

      if( textfieldsStrings2[1]=='')
      "city":widget.firstlist[2] 
      else "city": textfieldsStrings2[1] 
      
      
     
    });

    setState(() {});
  }
     
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    // int id=int.parse(widget.firstlist[0]);
    
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      
            appBar: AppBar(
             backgroundColor:primaryColor ,
                title: Text('Edit Profile'.tr(), textAlign: TextAlign.center,style:textColor7,),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(
                    color:Colors.white,
                    Icons.arrow_back,
                    size:25,
                     ),
                     onPressed: () {
                        Navigator.pop(context);
                     },
                ),
            ),
            body: Container(
            
              padding: const EdgeInsets.only(left:15,top: 20,right: 15),
              child: GestureDetector(
                  onTap: () {
                  FocusScope.of(context).unfocus();

                },
                child: ListView(
                  children: [
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
                              bottom: 25.0,
                              right: 125.0,
                              child: InkWell(
                                onTap: (){
                                  showModalBottomSheet(
                                    context: context,
                                     builder: ((builder) => bootmsheet()),
                                     
                                     );

                                },
                             
                             child: const Icon(
                                Icons.edit,
                                color: iconColor,
                                size: 30.0,

                            ),
                              ),

                            ),
             
                  ],
                ),
                const SizedBox(height: 30,),
                 usernameTextField(),
                 locationDrop(),
                          TextButton(
        onPressed: () {
            Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  NewPassword(firstlist: [widget.firstlist[0]],
              
                )));
        },
        child:  Text(
          "Edit password".tr(),
           style: const TextStyle(
    decoration: TextDecoration.underline,
    fontSize: 20, color: Colors.black, height: 1.5, 
  ),
          
        ),
      ),
                  const SizedBox(height: 40,),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed:() {
                           Navigator.pop(context);
                        },
                         style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                         ),
                         child:  Text("CANCEL".tr(), style: const TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.black
                         )),
                         
                         
                         ),
                         ElevatedButton(
                          onPressed: (){
                        if ( textfieldsStrings2[0] != "" || textfieldsStrings2[1] != "" ) {
                          edit();
                             buildSnackError(
                                "Updated Done".tr(),
                                context,
                                size,
                               );
                                 Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>  Profile(firstlist: [widget.firstlist[0]])));

                        }
                      
                       
                          },
                         style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                         ),
                          child: Text("SAVE".tr() , style: const TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.black
                         )),
                          
                          )
                    ],
                  )
                  ],
                ),
              ),
              
            ),
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
            "Choose Profile photo".tr(),
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
                 label:  Text("Camera".tr()),
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
                 label:  Text("Gallery".tr()),
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



Widget usernameTextField(){
  Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[400]!.withOpacity(0.5),
         // borderRadius: BorderRadius.circular(16),
        ),
        child: Form(
           key:namekey,
        child: Center(
          child: TextFormField(
               onChanged: (value) {
              setState(() {
                 textfieldsStrings2[0]= value;
              });

              
            },

                validator: (value) {
                         if (value!.length <= 2) {
                            buildSnackError(
                              'Invalid name'.tr(),
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                      },
            
               decoration: InputDecoration(
              
              // prefixIcon: const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Icon(
              //    FontAwesomeIcons.user,
              //     size: 28,
              //     color: textColor,
              //   ),
              // ),
               contentPadding: const EdgeInsets.all(18),
              hintText: widget.firstlist[1],
              hintStyle: bodyText,
            ),
            style: bodyText,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
      ),
    );
}
  Widget locationDrop(){
  Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        
       
      padding: const EdgeInsets.only(left: 10),
        height: size.height * 0.06,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[400]!.withOpacity(0.5),
           //borderRadius: BorderRadius.circular(16),
        ),
        
        
        child: Center(
      
           child: DropdownButton(
            
                 
                      icon:const Icon(Icons.arrow_drop_down,
                        color: textColor,
                       size: 36,
                      
                       
                      ),
                      
                      
                    
                        hint: Text(widget.firstlist[2],style: bodyText),
                      dropdownColor: barColor,
                    underline:const Divider(thickness: 0,) ,
                    isExpanded: true,
                    
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
                      onChanged:(val) {
                      setState(() {
                        selectedCounrty=val;
                        textfieldsStrings2[1] = val;

                      });
                            },
                            

  value: selectedCounrty,
  
 

        ),
        
      ),
      
      ),
      
    );
}


    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor:primaryColor,
        content: SizedBox(
          height: size.height * 0.03,
          child: Center(
            child: Text(error,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
      ),
    );
  }


}



/*
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter/Constants/Constants.dart';
import 'package:twitter/Models/UserModel.dart';
import 'package:twitter/Services/DatabaseServices.dart';
import 'package:twitter/Services/StorageService.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;

  const EditProfileScreen({Key key, this.user}) : super(key: key);
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _name;
  String _bio;
  File _profileImage;
  File _coverImage;
  String _imagePickedType;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  displayCoverImage() {
    if (_coverImage == null) {
      if (widget.user.coverImage.isNotEmpty) {
        return NetworkImage(widget.user.coverImage);
      }
    } else {
      return FileImage(_coverImage);
    }
  }

  displayProfileImage() {
    if (_profileImage == null) {
      if (widget.user.profilePicture.isEmpty) {
        return AssetImage('assets/placeholder.png');
      } else {
        return NetworkImage(widget.user.profilePicture);
      }
    } else {
      return FileImage(_profileImage);
    }
  }

  saveProfile() async {
    _formKey.currentState.save();
    if (_formKey.currentState.validate() && !_isLoading) {
      setState(() {
        _isLoading = true;
      });
      String profilePictureUrl = '';
      String coverPictureUrl = '';
      if (_profileImage == null) {
        profilePictureUrl = widget.user.profilePicture;
      } else {
        profilePictureUrl = await StorageService.uploadProfilePicture(
            widget.user.profilePicture, _profileImage);
      }
      if (_coverImage == null) {
        coverPictureUrl = widget.user.coverImage;
      } else {
        coverPictureUrl = await StorageService.uploadCoverPicture(
            widget.user.coverImage, _coverImage);
      }
      UserModel user = UserModel(
        id: widget.user.id,
        name: _name,
        profilePicture: profilePictureUrl,
        bio: _bio,
        coverImage: coverPictureUrl,
      );

      DatabaseServices.updateUserData(user);
      Navigator.pop(context);
    }
  }

  handleImageFromGallery() async {
    try {
      File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (imageFile != null) {
        if (_imagePickedType == 'profile') {
          setState(() {
            _profileImage = imageFile;
          });
        } else if (_imagePickedType == 'cover') {
          setState(() {
            _coverImage = imageFile;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _bio = widget.user.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          GestureDetector(
            onTap: () {
              _imagePickedType = 'cover';
              handleImageFromGallery();
            },
            child: Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: KTweeterColor,
                    image: _coverImage == null && widget.user.coverImage.isEmpty
                        ? null
                        : DecorationImage(
                            fit: BoxFit.cover,
                            image: displayCoverImage(),
                          ),
                  ),
                ),
                Container(
                  height: 150,
                  color: Colors.black54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 70,
                        color: Colors.white,
                      ),
                      Text(
                        'Change Cover Photo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -40, 0),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _imagePickedType = 'profile';
                        handleImageFromGallery();
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: displayProfileImage(),
                          ),
                          CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.black54,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Change Profile Photo',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: saveProfile,
                      child: Container(
                        width: 100,
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: KTweeterColor,
                        ),
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        TextFormField(
                          initialValue: _name,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(color: KTweeterColor),
                          ),
                          validator: (input) => input.trim().length < 2
                              ? 'please enter valid name'
                              : null,
                          onSaved: (value) {
                            _name = value;
                          },
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          initialValue: _bio,
                          decoration: InputDecoration(
                            labelText: 'Bio',
                            labelStyle: TextStyle(color: KTweeterColor),
                          ),
                          onSaved: (value) {
                            _bio = value;
                          },
                        ),
                        SizedBox(height: 30),
                        _isLoading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(KTweeterColor),
                              )
                            : SizedBox.shrink()
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}






*/