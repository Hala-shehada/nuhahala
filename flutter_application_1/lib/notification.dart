// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Notifications extends StatefulWidget {
  final List firstlist;
  const Notifications({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List allUnSeenNotifications = [];
  List userInfo = [];
  List postInfo = [];
  List allUnSeenNotifications1 = [];
  

  var spl;
  
var leng;
//   Future getAllUnSeenNotifications() async {
    
//     var url =
//         Uri.parse('http://192.168.1.104/gradpro/selectUnSeenNotification.php');
//     var response = await http.post(url, body: {"user_id": widget.firstlist[0]});

//     if (response.statusCode == 200) {
//       var jsonData = json.decode(response.body);
//       if (jsonData.length != 0) {
//         setState(() {
//           allUnSeenNotifications = jsonData;
//         });
//       }
//     }
//     if(allUnSeenNotifications.isNotEmpty){
//       // myNotifications1(allUnSeenNotifications);
//       for (int i = 0; i < allUnSeenNotifications.length; i++) {
//       if (allUnSeenNotifications[i]['cat_type'] == "villa") {
//         print("myNotifications1 $i");
//         var url = Uri.parse("http://192.168.1.104/gradpro/getPostName5.php");
//         var response = await http.post(
//           url,
//           headers: {"Accept": "application/json"},
//           body: {
//             "post_id": allUnSeenNotifications[i]['post_id'],
//             "user_id": widget.firstlist[0]
//           },
//         );

//         if (response.statusCode == 200) {
//           var jsonData = json.decode(response.body);
//           // if (jsonData.length != 0) {
//             setState(() {
//               postInfo += jsonData;
//             });
//           // }
//           print("villa");
//           print("post $i : $postInfo");
//         }
//       } else if (allUnSeenNotifications[i]['cat_type'] == "apartment") {
//         var url = Uri.parse("http://192.168.1.104/gradpro/getPostName1.php");
//         var response = await http.post(
//           url,
//           headers: {"Accept": "application/json"},
//           body: {
//             "post_id": allUnSeenNotifications[i]['post_id'],
//             "user_id": widget.firstlist[0]
//           },
//         );

//         if (response.statusCode == 200) {
//           var jsonData = json.decode(response.body);
//           // if (jsonData.length != 0) {
//             setState(() {
//               postInfo += jsonData;
//             });
//           // }
//           print("apartment");
//           print("post $i : $postInfo");
//         }
//       }else if (allUnSeenNotifications[i]['cat_type'] == "office") {
//             var url =
//                 Uri.parse("http://192.168.1.104/gradpro/getPostName4.php");
//             var response = await http.post(
//               url,
//               headers: {"Accept": "application/json"},
//               body: {
//                 "post_id": allUnSeenNotifications[i]['post_id'],
//                 "user_id": widget.firstlist[0]
//               },
//             );

//             if (response.statusCode == 200) {
//               var jsonData = json.decode(response.body);
//               // if (jsonData.length != 0) {
//                 setState(() {
//                   postInfo += jsonData;
//                 });
//               // }
//               print("office");
//               print("post $i : $postInfo");
//             }
//       }else if (allUnSeenNotifications[i]['cat_type'] == "land") {
//             var url =
//                 Uri.parse("http://192.168.1.104/gradpro/getPostName3.php");
//             var response = await http.post(
//               url,
//               headers: {"Accept": "application/json"},
//               body: {
//                 "post_id": allUnSeenNotifications[i]['post_id'],
//                 "user_id": widget.firstlist[0]
//               },
//             );

//             if (response.statusCode == 200) {
//               var jsonData = json.decode(response.body);
//               // if (jsonData.length != 0) {
//                 setState(() {
//                   postInfo += jsonData;
//                 });
//               // }
//               print("land");
//               print("post $i : $postInfo");
//             }
//       }else if (allUnSeenNotifications[i]['cat_type'] == "shop") {
//             var url =
//                 Uri.parse("http://192.168.1.104/gradpro/getPostName6.php");
//             var response = await http.post(
//               url,
//               headers: {"Accept": "application/json"},
//               body: {
//                 "post_id": allUnSeenNotifications[i]['post_id'],
//                 "user_id": widget.firstlist[0]
//               },
//             );

//             if (response.statusCode == 200) {
//               var jsonData = json.decode(response.body);
//               // if (jsonData.length != 0) {
//                 setState(() {
//                   postInfo += jsonData;
//                 });
//               // }
//               print("shop");
//               print("post $i : $postInfo");
//             }
//       }else if (allUnSeenNotifications[i]['cat_type'] == "farm") {
//             var url =
//                 Uri.parse("http://192.168.1.104/gradpro/getPostName2.php");
//             var response = await http.post(
//               url,
//               headers: {"Accept": "application/json"},
//               body: {
//                 "post_id": allUnSeenNotifications[i]['post_id'],
//                 "user_id": widget.firstlist[0]
//               },
//             );

//             if (response.statusCode == 200) {
//               var jsonData = json.decode(response.body);
//               // if (jsonData.isNotEmpty) {
//                 setState(() {
//                   postInfo += jsonData;
//                 });
//               // }
//               print("farm");
//               print("post $i : $postInfo");
//             }
//       }
//  print("post t : $postInfo");
//     }
//     }
//     if(postInfo.isNotEmpty){
//       myNotifications2(postInfo);
//     }
//     if(allUnSeenNotifications1.isNotEmpty){
//         myNotifications3(allUnSeenNotifications1);
//     }
//     print(allUnSeenNotifications.length);
//     print(allUnSeenNotifications);
//     print(postInfo.length);
//     print(postInfo);
//     print(allUnSeenNotifications1.length);
//     print(allUnSeenNotifications1);
//     print(userInfo.length);
//     print(userInfo);
//   }

//   Future myNotifications1(List allUnSeenNotifications) async {
//     print("hello");
//     for (int i = 0; i < allUnSeenNotifications.length; i++) {
//       if (allUnSeenNotifications[i]['cat_type'] == "villa") {
//         print("myNotifications1 $i");
//         var url = Uri.parse("http://192.168.1.104/gradpro/getPostName5.php");
//         var response = await http.post(
//           url,
//           headers: {"Accept": "application/json"},
//           body: {
//             "post_id": allUnSeenNotifications[i]['post_id'],
//             "user_id": widget.firstlist[0]
//           },
//         );

//         if (response.statusCode == 200) {
//           var jsonData = json.decode(response.body);
//           // if (jsonData.length != 0) {
//             setState(() {
//               postInfo += jsonData;
//             });
//           // }
//           print("villa");
//           print("post $i : $postInfo");
//         }
//       } else if (allUnSeenNotifications[i]['cat_type'] == "apartment") {
//         var url = Uri.parse("http://192.168.1.104/gradpro/getPostName1.php");
//         var response = await http.post(
//           url,
//           headers: {"Accept": "application/json"},
//           body: {
//             "post_id": allUnSeenNotifications[i]['post_id'],
//             "user_id": widget.firstlist[0]
//           },
//         );

//         if (response.statusCode == 200) {
//           var jsonData = json.decode(response.body);
//           // if (jsonData.length != 0) {
//             setState(() {
//               postInfo += jsonData;
//             });
//           // }
//           print("apartment");
//           print("post $i : $postInfo");
//         }
//       }else if (allUnSeenNotifications[i]['cat_type'] == "office") {
//             var url =
//                 Uri.parse("http://192.168.1.104/gradpro/getPostName4.php");
//             var response = await http.post(
//               url,
//               headers: {"Accept": "application/json"},
//               body: {
//                 "post_id": allUnSeenNotifications[i]['post_id'],
//                 "user_id": widget.firstlist[0]
//               },
//             );

//             if (response.statusCode == 200) {
//               var jsonData = json.decode(response.body);
//               // if (jsonData.length != 0) {
//                 setState(() {
//                   postInfo += jsonData;
//                 });
//               // }
//               print("office");
//               print("post $i : $postInfo");
//             }
//       }else if (allUnSeenNotifications[i]['cat_type'] == "land") {
//             var url =
//                 Uri.parse("http://192.168.1.104/gradpro/getPostName3.php");
//             var response = await http.post(
//               url,
//               headers: {"Accept": "application/json"},
//               body: {
//                 "post_id": allUnSeenNotifications[i]['post_id'],
//                 "user_id": widget.firstlist[0]
//               },
//             );

//             if (response.statusCode == 200) {
//               var jsonData = json.decode(response.body);
//               // if (jsonData.length != 0) {
//                 setState(() {
//                   postInfo += jsonData;
//                 });
//               // }
//               print("land");
//               print("post $i : $postInfo");
//             }
//       }else if (allUnSeenNotifications[i]['cat_type'] == "shop") {
//             var url =
//                 Uri.parse("http://192.168.1.104/gradpro/getPostName6.php");
//             var response = await http.post(
//               url,
//               headers: {"Accept": "application/json"},
//               body: {
//                 "post_id": allUnSeenNotifications[i]['post_id'],
//                 "user_id": widget.firstlist[0]
//               },
//             );

//             if (response.statusCode == 200) {
//               var jsonData = json.decode(response.body);
//               // if (jsonData.length != 0) {
//                 setState(() {
//                   postInfo += jsonData;
//                 });
//               // }
//               print("shop");
//               print("post $i : $postInfo");
//             }
//       }else if (allUnSeenNotifications[i]['cat_type'] == "farm") {
//             var url =
//                 Uri.parse("http://192.168.1.104/gradpro/getPostName2.php");
//             var response = await http.post(
//               url,
//               headers: {"Accept": "application/json"},
//               body: {
//                 "post_id": allUnSeenNotifications[i]['post_id'],
//                 "user_id": widget.firstlist[0]
//               },
//             );

//             if (response.statusCode == 200) {
//               var jsonData = json.decode(response.body);
//               // if (jsonData.isNotEmpty) {
//                 setState(() {
//                   postInfo += jsonData;
//                 });
//               // }
//               print("farm");
//               print("post $i : $postInfo");
//             }
//       }
//  print("post t : $postInfo");
//     }
//     print("post tt : $postInfo");
//   }
// Future myNotifications2(List postInfo) async {
//     for (int i = 0; i < postInfo.length; i++) {
//     var url = Uri.parse(
//               'http://192.168.1.104/gradpro/myUnSeenNotification.php');
//           var response = await http.post(url, body: {
//             "post_id": postInfo[i]['post_id'],
//             "user_id": widget.firstlist[0],
//              "cat_type": postInfo[i]['cat_type'],
//           });

//           if (response.statusCode == 200) {
//             var jsonData = json.decode(response.body);
//             if (jsonData.length != 0) {
//               setState(() {
//                 allUnSeenNotifications1 += jsonData;
//               });
//             }
//           }

// }
// }
// Future myNotifications3(List allUnSeenNotifications1) async {
//    for (int i = 0; i < allUnSeenNotifications1.length; i++) {
//      var url = Uri.parse("http://192.168.1.104/gradpro/userNameImage.php");
//           var response = await http.post(url,
//               headers: {"Accept": "application/json"},
//               body: {"user_idd": allUnSeenNotifications1[i]['user_id']});

//           if (response.statusCode == 200) {
//             var jsonData = json.decode(response.body);
//             if (jsonData.length != 0) {
//               setState(() {
//                 userInfo += jsonData;
//               });
//             }
//           }



//    }
// }





  Future getAllUnSeenNotifications1() async {
    allUnSeenNotifications = [];
    allUnSeenNotifications1 = [];
    userInfo = [];
    postInfo = [];
    int i = 0;
    int j = 0;
    int t = 0;
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

        while (allUnSeenNotifications1.length != t) {
          var url = Uri.parse("http://192.168.1.104/gradpro/userNameImage.php");
          var response = await http.post(url,
              headers: {"Accept": "application/json"},
              body: {"user_idd": allUnSeenNotifications1[t]['user_id']});

          if (response.statusCode == 200) {
            var jsonData = json.decode(response.body);
            if (jsonData.length != 0) {
              setState(() {
                userInfo += jsonData;
              });
            }
          }

          ++t;
        }
      }
    }
    // print(allUnSeenNotifications.length);
    // print(allUnSeenNotifications);
    // print(postInfo.length);
    // print(postInfo);
    // print(allUnSeenNotifications1.length);
    // print(allUnSeenNotifications1);
    // print(userInfo.length);
    // print(userInfo);

  }

  Future updateNotifications(String id) async {
    var url = Uri.parse('http://192.168.1.104/gradpro/updateNotifications.php');
    var response = await http.post(url, body: {"id": id});

    if (response.statusCode == 200) {
      // print("ok");
    }
  }

  @override
  void initState() {
    super.initState();
    getAllUnSeenNotifications1();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text(
              'Notifications'.tr(),
              textAlign: TextAlign.center,
              style: textColor7,
            ),
            centerTitle: true,
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: userInfo.isEmpty
                ? Lottie.asset('assets/animation/empty1.json')
                : ListView.builder(
                    itemCount: userInfo.length,
                    itemBuilder: (context, index) {
                      var list = allUnSeenNotifications1[index];
                   

                      
                    

                      spl = userInfo[index]['name'].split(' ');
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: userInfo[index]["image"] == ""
                                ? const AssetImage(
                                    "assets/images/blank-profile.png")
                                : NetworkImage(
                                        'http://192.168.1.104/gradpro/images/${userInfo[index]["image"]}')
                                    as ImageProvider,
                          ),
                          title: RichText(
                            text: TextSpan(
                              text: spl[0],
                              style: pText2,
                              children: [
                                const TextSpan(
                                  text: " commented on your ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: "${postInfo[index]['real_name']}",
                                  style: pText2,
                                ),
                                const TextSpan(
                                  text: " estate",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Text(
                            list["comment"],
                            style: textColor15,
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              updateNotifications(list["id"])
                              .whenComplete(
                                  () => getAllUnSeenNotifications1());
                            },
                      
                          ),
                        ),
                      );
                    }),
          ),
        ),
      ),
    );
  }
}
