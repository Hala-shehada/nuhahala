// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application_1/confirme.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/http.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  final List firstlist;
   const Profile({Key? key, required this.firstlist, }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  bool tappedYes = false;
  late File file;
  String? myImageName;
  List<String> myinfo = [];
  String name = '';
  String email = '';
  String city = '';
  String phone = '';
  List userInfo = [];


  showAccountinfo() async {
    var result = await httpGet("accountinfo", {
      "id": widget.firstlist[0],
    });

    myinfo = result.data.split("&");
    name = myinfo[0];
    email = myinfo[1];
    city = myinfo[2];
    phone = myinfo[3];
    setState(() {});
  }

  delete() async {
    var result = await httpGet("userdelete", {
      "id": widget.firstlist[0],
    });
    if (result.data == "OK") {}
  }

  de() {
    if (tappedYes == true) {
      delete();
    }
  }

  Future choose() async {
    // ignore: deprecated_member_use
    final myFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (myFile == null) return;
      file = File(myFile.path);
      myImageName = myFile.path.split("/").last;

      resetImage().whenComplete(() => setState(() {
        Navigator.pop(context);
        myImage();
      }));
    });
  }

  Future choose1() async {
    // ignore: deprecated_member_use
    final myFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (myFile == null) return;
    setState(() {
      file = File(myFile.path);
      myImageName = myFile.path.split("/").last;
      resetImage().whenComplete(() =>
      setState(() {
        Navigator.pop(context);
        myImage();
      })
       ,
     
                                                );
    });
  }

  Future resetImage() async {
    var url = Uri.parse('http://192.168.1.104/gradpro/restimage.php');
    var request = http.MultipartRequest('post', url);
    request.fields['id'] = widget.firstlist[0];
    var pic = await http.MultipartFile.fromPath("image", file.path);
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

  @override
  void initState() {
    showAccountinfo();
     myImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                            backgroundImage: userInfo.isEmpty ||(userInfo[0]["image"] == "")
                        ? const AssetImage("assets/images/blank-profile.png")
                        : NetworkImage(
                                'http://192.168.1.104/gradpro/images/${userInfo[0]["image"]}')
                            as ImageProvider,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 143.0,
                      child: InkWell(
                        onTap: () {
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
                  children: [
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
                                  builder: (_) => Editprofile(
                                        firstlist: [
                                          widget.firstlist[0],
                                          name,
                                          city
                                        ],
                                      )));
                        },
                        child: const Text(
                          "Edite profile",
                          style: pText,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(
                        name,
                        style: pText1,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: Text(
                        email,
                        style: pText1,
                      ),
                    ),
                    const Divider(),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.location_city),
                      title: Text(
                        city,
                        style: pText1,
                      ),
                    ),
                    const Divider(),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(
                        phone,
                        style: pText1,
                      ),
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
                          showDialog(
                                    context: (context),
                                    builder: (context) => AlertDialog(
                                          title:  Text("Delete Account",
                                          style:textColor2 ,
                                          ),
                                          content: const Text(
                                              "Are you sure you want to delete your account completely?",
                                              style: textColor4,
                                              ),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              onPressed: () async {
                                                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>  Confirm(firstlist:[widget.firstlist[0]],
                          
                              
                            )));
                                                  
                                                  },
                                            
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: primaryColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 35),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                              child: Text("Confirm".tr(),
                                                  style: textColor4),
                                            ),
                                            
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: primaryColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 35),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                              child: Text("Cancel".tr(),
                                                  style: textColor4),
                                            ),
                                          ],
                                        ));



                          // final action = await AlertDialogs.yesCancelDialog(
                          //     context,
                          //     'Delete Account',
                          //     'Are you sure you want to delete your account completely?');
                          // if (action == DialogsAction.delete) {
                          //   // delete();
                          //   setState(() => tappedYes = true);
                          // } else {
                          //   setState(() => tappedYes = false);
                          // }
                        },
                        child: const Text(
                          "Delete Account",
                          style: pText,
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

  Widget bootmsheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        Text(
          "Choose Profile photo",
          style: textColor1,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () {
                choose1();
              },
              label: const Text("Camera"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                choose();
              },
              label: const Text("Gallery"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
              ),
            )
          ],
        )
      ]),
    );
  }

//   Future choose()async
// {
//   // ignore: deprecated_member_use
//   final myFile= await ImagePicker().getImage(source: ImageSource.gallery);

//   setState(() {
//     if(myFile==null) return;
//     file=File(myFile.path);
//     myImageName=myFile.path.split("/").last;

//     resetImage();
//   });
// }

//   Future choose1()async
// {
//   // ignore: deprecated_member_use
//   final myFile= await ImagePicker().getImage(source: ImageSource.camera);
//   if(myFile==null) return;
//   setState(() {
//     file=File(myFile.path);
//     myImageName=myFile.path.split("/").last;
//     resetImage ();
//   });
// }

// Future resetImage()async{
//   var url= Uri.parse('http://192.168.1.104/gradpro/restimage.php');
//   var request=http.MultipartRequest('post',url);
//   request.fields['id']=widget.firstlist[0];
//   var pic=await http.MultipartFile.fromPath("image",file.path);
//   request.files.add(pic);
//   await request.send();
// }

// Future getData()async{
//   var url= Uri.parse('http://192.168.1.104/gradpro/getdata.php');
//   var response=await http.post(url,body:{"myID":widget.firstlist[0]});

//   final userdata = Map<String, dynamic>.from(jsonDecode(response.body));
//    myImageName=userdata['image'];

// }

}
