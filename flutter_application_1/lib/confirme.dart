// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/first_page.dart';
import 'package:flutter_application_1/modules/http.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pallete.dart';
import 'package:http/http.dart' as http;

class Confirm extends StatefulWidget {
  final List firstlist;
  const Confirm({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  String password1 = '';
  List textfieldsStrings = [
    "", //currentpassword
  ];
  final _currentpasswordKey = GlobalKey<FormState>();

  bool vis = true;

  getPassword() async {
    var result = await httpGet("userpassword", {
      "id": widget.firstlist[0],
    });
    setState(() {
      password1 = result.data;
    });
    print(password1);
  }

  List post = [];

  Future showMyPost() async {
    var url = Uri.parse("http://192.168.1.104/gradpro/myPosts.php");
    var response = await http.post(url,
        headers: {"Accept": "application/json"},
        body: {"myID": widget.firstlist[0]});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData.length != 0) {
        setState(() {
          post += jsonData;
        });
      }
    }
  }

  Future showApartmentPosts() async {
    var url = Uri.parse("http://192.168.1.104/gradpro/myApartmentPosts.php");
    var response = await http.post(url,
        headers: {"Accept": "application/json"},
        body: {"myID": widget.firstlist[0]});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData.length != 0) {
        setState(() {
          post += jsonData;
        });
      }
    }
  }

  Future showFarmPosts() async {
    var url = Uri.parse("http://192.168.1.104/gradpro/myFarmPosts.php");
    var response = await http.post(url,
        headers: {"Accept": "application/json"},
        body: {"myID": widget.firstlist[0]});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData.length != 0) {
        setState(() {
          post += jsonData;
        });
      }
    }
  }

  Future showlandPosts() async {
    var url = Uri.parse("http://192.168.1.104/gradpro/myLandPosts.php");
    var response = await http.post(url,
        headers: {"Accept": "application/json"},
        body: {"myID": widget.firstlist[0]});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData.length != 0) {
        setState(() {
          post += jsonData;
        });
      }
    }
  }

  Future showOfficePosts() async {
    var url = Uri.parse("http://192.168.1.104/gradpro/myOfficePosts.php");
    var response = await http.post(url,
        headers: {"Accept": "application/json"},
        body: {"myID": widget.firstlist[0]});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData.length != 0) {
        setState(() {
          post += jsonData;
        });
      }
    }
  }

  Future showShopPosts() async {
    var url = Uri.parse("http://192.168.1.104/gradpro/myShopPosts.php");
    var response = await http.post(url,
        headers: {"Accept": "application/json"},
        body: {"myID": widget.firstlist[0]});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData.length != 0) {
        setState(() {
          post += jsonData;
        });
      }
    }
  }

Future deleteAll() async {
    var url =
                    Uri.parse("http://192.168.1.104/gradpro/deleteAccount.php");
                var response = await http.post(url, headers: {
                  "Accept": "application/json"
                }, body: {
                  "user_id": widget.firstlist[0],
                  
                });
                if (response.statusCode == 200) {
               
                }
}


  @override
  void initState() {
    getPassword();
    showMyPost();
    showApartmentPosts();
    showFarmPosts();
    showlandPosts();
    showOfficePosts();
    showShopPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
            title: Text(
              'Delete Account'.tr(),
              style: textColor7,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    passTextFiled(),
                    const SizedBox(
                      height: 20,
                    ),
                    roundedButton(),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget passTextFiled() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey[400]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Form(
          key: _currentpasswordKey,
          child: Center(
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  textfieldsStrings[0] = value;
                });
              },
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: IconButton(
                    icon: Icon(
                      vis ? Icons.visibility_off : Icons.visibility,
                      size: 28,
                      color: iconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        vis = !vis;
                      });
                    },
                  ),
                ),
                contentPadding: const EdgeInsets.all(18),
                hintText: "Current Passsword".tr(),
                hintStyle: bodyText,
              ),
              obscureText: vis,
              style: bodyText,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
      ),
    );
  }

  Widget roundedButton() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.07,
      width: size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
        onPressed: () async {
          String h = textfieldsStrings[0];
          if (h == '') {
            buildSnackError(
              'Enter your password'.tr(),
              context,
              size,
            );
          } else if (password1 == h) {

            
            for (int i = 0; i < post.length; i++) {

              if (post[i]['cat_type'] == "villa") {
                var url =
                    Uri.parse("http://192.168.1.104/gradpro/deletePost.php");
                var response = await http.post(url, headers: {
                  "Accept": "application/json"
                }, body: {
                  "post_id": post[i]['post_id'],
                  "cat_type": post[i]['cat_type']
                });
                if (response.statusCode == 200) {
                  print(post);
                }
              } else if (post[i]['cat_type'] == "apartment") {
                var url = Uri.parse(
                    "http://192.168.1.104/gradpro/deleteApartment.php");
                var response = await http.post(url, headers: {
                  "Accept": "application/json"
                }, body: {
                  "post_id": post[i]['post_id'],
                  "cat_type": post[i]['cat_type']
                });
                if (response.statusCode == 200) { print(post);}
              } else if (post[i]['cat_type'] == "farm") {
                var url =
                    Uri.parse("http://192.168.1.104/gradpro/deleteFarm.php");
                var response = await http.post(url, headers: {
                  "Accept": "application/json"
                }, body: {
                  "post_id": post[i]['post_id'],
                  "cat_type": post[i]['cat_type']
                });
                if (response.statusCode == 200) { print(post);}
              } else if (post[i]['cat_type'] == "land") {
                var url =
                    Uri.parse("http://192.168.1.104/gradpro/deleteLand.php");
                var response = await http.post(url, headers: {
                  "Accept": "application/json"
                }, body: {
                  "post_id": post[i]['post_id'],
                  "cat_type": post[i]['cat_type']
                });
                if (response.statusCode == 200) { print(post);}
              } else if (post[i]['cat_type'] == "office") {
                var url =
                    Uri.parse("http://192.168.1.104/gradpro/deleteOffice.php");
                var response = await http.post(url, headers: {
                  "Accept": "application/json"
                }, body: {
                  "post_id": post[i]['post_id'],
                  "cat_type": post[i]['cat_type']
                });
                if (response.statusCode == 200) { print(post);}
              } else if (post[i]['cat_type'] == "shop") {
                var url =
                    Uri.parse("http://192.168.1.104/gradpro/deleteShop.php");
                var response = await http.post(url, headers: {
                  "Accept": "application/json"
                }, body: {
                  "post_id": post[i]['post_id'],
                  "cat_type": post[i]['cat_type']
                });
                if (response.statusCode == 200) { print(post);}
              }
              
            } 
            
             deleteAll();
           



            buildSnackError("The Deletion Completed".tr(), context, size);
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SplashScreen()));
          } else if (password1 != h) {
            buildSnackError(
              'The password is incorrect'.tr(),
              context,
              size,
            );
          }
        },
        child: Text('Continue deleting'.tr(), style: pText1),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: primaryColor,
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
