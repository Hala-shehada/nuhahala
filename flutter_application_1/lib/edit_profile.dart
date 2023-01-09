import 'dart:convert';
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
import 'package:http/http.dart' as http;
import 'modules/http.dart';



class Editprofile extends StatefulWidget {
  final List firstlist;
  const Editprofile({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}



class _EditprofileState extends State<Editprofile> {
late File file;
// ignore: prefer_typing_uninitialized_variables
var myImageName;
List userInfo = [];
      // ignore: prefer_typing_uninitialized_variables   
   var selectedCounrty;
    List textfieldsStrings2 = [
    "", //name
    "", //city 
  ];
  final GlobalKey<FormState>namekey =GlobalKey();
  final GlobalKey<FormState>citykey =GlobalKey();

   edit() async {
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
  void initState() {
    // getData ();
    myImage();
    super.initState();
  }
     
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
   
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
                            backgroundImage:userInfo.isEmpty ||(userInfo[0]["image"] == "")
                        ? const AssetImage("assets/images/blank-profile.png")
                        : NetworkImage(
                                'http://192.168.1.104/gradpro/images/${userInfo[0]["image"]}')
                            as ImageProvider,
                          
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
                       
                        if ( textfieldsStrings2[0] != "" || textfieldsStrings2[1] != "" || userInfo[0]["image"] != "" ) {
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
                 // takePhoto(ImageSource.camera);
                 choose1();
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
                  //takePhoto(ImageSource.gallery);
                  choose();
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

  
Widget usernameTextField(){
  Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[400]!.withOpacity(0.5),
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

  Future choose()async 
{
  // ignore: deprecated_member_use
  final myFile= await ImagePicker().getImage(source: ImageSource.gallery);
  
  setState(() {
    if(myFile==null) return;
    file=File(myFile.path);
    myImageName=myFile.path.split("/").last;
    resetImage().whenComplete(() =>  setState(() {
        Navigator.pop(context);
        myImage();
      }));
  });
}

  Future choose1()async 
{
  // ignore: deprecated_member_use
  final myFile= await ImagePicker().getImage(source: ImageSource.camera);
  
  setState(() {
    if(myFile==null) return;
    file=File(myFile.path);
    myImageName=myFile.path.split("/").last;
    resetImage ().whenComplete(() =>  setState(() {
        Navigator.pop(context);
        myImage();
      }));
  });
}



Future resetImage()async{
  var url= Uri.parse('http://192.168.1.104/gradpro/restimage.php');
  var request=http.MultipartRequest('post',url);
  request.fields['id']=widget.firstlist[0];
  var pic=await http.MultipartFile.fromPath("image",file.path);
  request.files.add(pic);
  await request.send();
}



  Future myImage()async{
     userInfo = [];
     var url = Uri.parse("http://192.168.1.104/gradpro/userNameImage.php");
          var response = await http.post(url,
              headers: {"Accept": "application/json"},
              body: {"user_idd": widget.firstlist[0]});

          if (response.statusCode == 200) {
            var jsonData = json.decode(response.body);
            if (jsonData.length != 0) {
              setState(() {
                userInfo += jsonData;
              });
            }
          }
  }

}


