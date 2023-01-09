// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/favorite.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:flutter_application_1/my_real.dart';
import 'package:flutter_application_1/notification.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'dart:ui';
import '../hfirst_screen.dart';
import '../modules/http.dart';
import '../pallete.dart';
import '../user_profile.dart';
import 'package:http/http.dart' as http;

class NavBar extends StatefulWidget {
  final List firstlist;
  // ignore: prefer_const_constructors_in_immutables
  NavBar({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String? myImageName;

  List<String> myinfo = [];
  String name = '';
  String email = '';
  String city = '';
  String phone = '';
  bool isSeen = true;
  List postInfo = [];
  List allUnSeenNotifications = [];
  List userInfo = [];
  int index = 0;
  List allUnSeenNotifications1 = [];
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

  // Future getData() async {
  //   var url = Uri.parse('http://192.168.1.104/gradpro/getdata.php');
  //   var response = await http.post(url, body: {"myID": widget.firstlist[0]});
  //   final userdata = new Map<String, dynamic>.from(jsonDecode(response.body));
  //   myImageName = userdata['image'];
  // }

  Future myImage() async {
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



  Future getUnSeenNotifications1() async {
    allUnSeenNotifications = [];
    allUnSeenNotifications1 = [];
    postInfo = [];
    int i = 0;
    int j = 0;
    var url =
        Uri.parse('http://192.168.1.104/gradpro/selectUnSeenNotification.php');
    var response = await http.post(url, body: {"user_id": widget.firstlist[0]});

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData.length != 0) {
        setState(() {
          allUnSeenNotifications = jsonData;
        });

        while (allUnSeenNotifications.length != j && allUnSeenNotifications.isNotEmpty) {
          if (allUnSeenNotifications[j]['cat_type'] == "villa") {
            var url =
                Uri.parse("http://192.168.1.104/gradpro/getPostName5.php");
            var response = await http.post(
              url,
              headers: {"Accept": "application/json"},
              body: {
                "post_id": allUnSeenNotifications[j]['post_id'],
                "user_id": widget.firstlist[0]
              },
            );

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);
              if (jsonData.length != 0) {
                setState(() {
                  postInfo += jsonData;
                });
              }
            }
            ++j;
          } else if (allUnSeenNotifications[j]['cat_type'] == "apartment") {
            var url =
                Uri.parse("http://192.168.1.104/gradpro/getPostName1.php");
            var response = await http.post(
              url,
              headers: {"Accept": "application/json"},
              body: {
                "post_id": allUnSeenNotifications[j]['post_id'],
                "user_id": widget.firstlist[0]
              },
            );

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);
              if (jsonData.length != 0) {
                setState(() {
                  postInfo += jsonData;
                });
              }
            }
            ++j;
          } else if (allUnSeenNotifications[j]['cat_type'] == "office") {
            var url =
                Uri.parse("http://192.168.1.104/gradpro/getPostName4.php");
            var response = await http.post(
              url,
              headers: {"Accept": "application/json"},
              body: {
                "post_id": allUnSeenNotifications[j]['post_id'],
                "user_id": widget.firstlist[0]
              },
            );

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);
              if (jsonData.length != 0) {
                setState(() {
                  postInfo += jsonData;
                });
              }
            }
            ++j;
          } else if (allUnSeenNotifications[j]['cat_type'] == "land") {
            var url =
                Uri.parse("http://192.168.1.104/gradpro/getPostName3.php");
            var response = await http.post(
              url,
              headers: {"Accept": "application/json"},
              body: {
                "post_id": allUnSeenNotifications[j]['post_id'],
                "user_id": widget.firstlist[0]
              },
            );

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);
              if (jsonData.length != 0) {
                setState(() {
                  postInfo += jsonData;
                });
              }
            }
            ++j;
          } else if (allUnSeenNotifications[j]['cat_type'] == "shop") {
            var url =
                Uri.parse("http://192.168.1.104/gradpro/getPostName6.php");
            var response = await http.post(
              url,
              headers: {"Accept": "application/json"},
              body: {
                "post_id": allUnSeenNotifications[j]['post_id'],
                "user_id": widget.firstlist[0]
              },
            );

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);
              if (jsonData.length != 0) {
                setState(() {
                  postInfo += jsonData;
                });
              }
            }
            ++j;
          } else if (allUnSeenNotifications[j]['cat_type'] == "farm") {
            var url =
                Uri.parse("http://192.168.1.104/gradpro/getPostName2.php");
            var response = await http.post(
              url,
              headers: {"Accept": "application/json"},
              body: {
                "post_id": allUnSeenNotifications[j]['post_id'],
                "user_id": widget.firstlist[0]
              },
            );

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);
              if (jsonData.length != 0) {
                setState(() {
                  postInfo += jsonData;
                });
              }
            }
            ++j;
          }

        }

        while (postInfo.length != i && postInfo.isNotEmpty &&allUnSeenNotifications.length != i && allUnSeenNotifications.isNotEmpty) {
          var url = Uri.parse(
              'http://192.168.1.104/gradpro/myUnSeenNotification.php');
          var response = await http.post(url, body: {
            "post_id": postInfo[i]['post_id'],
            "user_id": widget.firstlist[0],
            "cat_type": postInfo[i]['cat_type'],
            "id":allUnSeenNotifications[i]['id']
          });

          if (response.statusCode == 200) {
            var jsonData = json.decode(response.body);
            if (jsonData.length != 0) {
              setState(() {
                allUnSeenNotifications1 += jsonData;
              });
            }
          }
          ++i;
        }
      }
    }
    // print(allUnSeenNotifications1.length);
  }







  // Future getTotalUnSeeenNotification() async {
  //   postInfo = [];
  //   int j = 0;

  //   var url =
  //       Uri.parse('http://192.168.1.104/gradpro/selectUnSeenNotification.php');
  //   var response = await http.post(url, body: {"user_id": widget.firstlist[0]});

  //   if (response.statusCode == 200) {
  //     var jsonData = json.decode(response.body);
  //     if (jsonData.length != 0) {
  //       setState(() {
  //         allUnSeenNotifications = jsonData;
  //       });

  //       while (allUnSeenNotifications.length != j) {
  //         if (allUnSeenNotifications[j]['cat_type'] == "villa") {
  //           var url =
  //               Uri.parse("http://192.168.1.104/gradpro/getPostName5.php");
  //           var response = await http.post(
  //             url,
  //             headers: {"Accept": "application/json"},
  //             body: {
  //               "post_id": allUnSeenNotifications[j]['post_id'],
  //               "user_id": widget.firstlist[0]
  //             },
  //           );

  //           if (response.statusCode == 200) {
  //             var jsonData = json.decode(response.body);
  //             if (jsonData.length != 0) {
  //               setState(() {
  //                 postInfo += jsonData;
  //               });
  //             }
  //           }
  //           ++j;
  //         } else if (allUnSeenNotifications[j]['cat_type'] == "apartment") {
  //           var url =
  //               Uri.parse("http://192.168.1.104/gradpro/getPostName1.php");
  //           var response = await http.post(
  //             url,
  //             headers: {"Accept": "application/json"},
  //             body: {
  //               "post_id": allUnSeenNotifications[j]['post_id'],
  //               "user_id": widget.firstlist[0]
  //             },
  //           );

  //           if (response.statusCode == 200) {
  //             var jsonData = json.decode(response.body);
  //             if (jsonData.length != 0) {
  //               setState(() {
  //                 postInfo += jsonData;
  //               });
  //             }
  //           }
  //           ++j;
  //         } else if (allUnSeenNotifications[j]['cat_type'] == "office") {
  //           var url =
  //               Uri.parse("http://192.168.1.104/gradpro/getPostName4.php");
  //           var response = await http.post(
  //             url,
  //             headers: {"Accept": "application/json"},
  //             body: {
  //               "post_id": allUnSeenNotifications[j]['post_id'],
  //               "user_id": widget.firstlist[0]
  //             },
  //           );

  //           if (response.statusCode == 200) {
  //             var jsonData = json.decode(response.body);
  //             if (jsonData.length != 0) {
  //               setState(() {
  //                 postInfo += jsonData;
  //               });
  //             }
  //           }
  //           ++j;
  //         } else if (allUnSeenNotifications[j]['cat_type'] == "land") {
  //           var url =
  //               Uri.parse("http://192.168.1.104/gradpro/getPostName3.php");
  //           var response = await http.post(
  //             url,
  //             headers: {"Accept": "application/json"},
  //             body: {
  //               "post_id": allUnSeenNotifications[j]['post_id'],
  //               "user_id": widget.firstlist[0]
  //             },
  //           );

  //           if (response.statusCode == 200) {
  //             var jsonData = json.decode(response.body);
  //             if (jsonData.length != 0) {
  //               setState(() {
  //                 postInfo += jsonData;
  //               });
  //             }
  //           }
  //           ++j;
  //         } else if (allUnSeenNotifications[j]['cat_type'] == "shop") {
  //           var url =
  //               Uri.parse("http://192.168.1.104/gradpro/getPostName6.php");
  //           var response = await http.post(
  //             url,
  //             headers: {"Accept": "application/json"},
  //             body: {
  //               "post_id": allUnSeenNotifications[j]['post_id'],
  //               "user_id": widget.firstlist[0]
  //             },
  //           );

  //           if (response.statusCode == 200) {
  //             var jsonData = json.decode(response.body);
  //             if (jsonData.length != 0) {
  //               setState(() {
  //                 postInfo += jsonData;
  //               });
  //             }
  //           }
  //           ++j;
  //         } else if (allUnSeenNotifications[j]['cat_type'] == "farm") {
  //           var url =
  //               Uri.parse("http://192.168.1.104/gradpro/getPostName2.php");
  //           var response = await http.post(
  //             url,
  //             headers: {"Accept": "application/json"},
  //             body: {
  //               "post_id": allUnSeenNotifications[j]['post_id'],
  //               "user_id": widget.firstlist[0]
  //             },
  //           );

  //           if (response.statusCode == 200) {
  //             var jsonData = json.decode(response.body);
  //             if (jsonData.length != 0) {
  //               setState(() {
  //                 postInfo += jsonData;
  //               });
  //             }
  //           }
  //           ++j;
  //         }
  //       }
  //     }
  //   }
  // }

  // Future getTotalUnSeeenNotification() async {
  //   var url = Uri.parse('http://192.168.1.104/gradpro/selectCommentNotifications.php');
  //   var response = await http.post(url,body:{"user_id": widget.firstlist[0]});

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       total = response.body;
  //     });
  //   }
  //   print(total);
  // }

  @override
  void initState() {
    super.initState();
    showAccountinfo();
    // getData();
    myImage();
    // getTotalUnSeeenNotification1();
     getUnSeenNotifications1();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              name,
              style: pText,
            ),
            accountEmail: Text(
             email,
              style: pText2,
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: CircleAvatar(
                    radius: size.width * 0.14,
                    backgroundImage: 
                    userInfo.isEmpty ||(userInfo[0]["image"] == "")
                        ?
                         const AssetImage("assets/images/blank-profile.png")
                        : NetworkImage(
                                'http://192.168.1.104/gradpro/images/${userInfo[0]["image"]}')
                            as ImageProvider,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              'Profile'.tr(),
              style: pText1,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Profile(
                            firstlist: [widget.firstlist[0]],
                          )));
            },
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                'Home'.tr(),
                style: pText1,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FirstScreen(
                              firstlist: [widget.firstlist[0]],
                            )));
              }),
          ListTile(
              leading: const Icon(Icons.real_estate_agent),
              title: Text(
                'My Real Estates'.tr(),
                style: pText1,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MyReal(
                              firstlist: [widget.firstlist[0]],
                            )));
              }),
          ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(
                'favorite'.tr(),
                style: pText1,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Fav(
                              firstlist: [widget.firstlist[0]],
                            )));
              }),
          ListTile(
              leading: const Icon(Icons.chat_bubble),
              title: Text(
                'Chat'.tr(),
                style: pText1,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Profile(
                              firstlist: [widget.firstlist[0]],
                            )));
              }),
          ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(
                'Notifications'.tr(),
                style: pText1,
              ),
              trailing: ClipOval(
                  child: Container(
                color: Colors.red,
                width: 22,
                height: 22,
                child: Center(
                    child: isSeen
                        ? Text(
                            "${allUnSeenNotifications1.length}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          )
                        : const Text(
                            '0',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )),
              )),
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Notifications(
                                  firstlist: [widget.firstlist[0]],
                                )))
                     .whenComplete(() =>  getUnSeenNotifications1());
              }),
          ListTile(
            leading: const Icon(Icons.swap_horizontal_circle),
            title: Text(
              'Change Language'.tr(),
              style: pText1,
            ),
            onTap: () {
              if (context.locale.toString() == "en") {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              'Logout'.tr(),
              style: pText1,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const LoginScreen(
                            firstlist: [],
                          )));
            },
          ),
        ],
      ),
    );
  }
}

enum DrawerSections {
  profile,
  home,
  myReal,
  chat,
  notifications,
  changeLang,
  logout,
}
