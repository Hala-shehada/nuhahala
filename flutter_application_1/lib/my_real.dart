import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit_Post.dart';
import 'package:flutter_application_1/my_real1.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class MyReal extends StatefulWidget {
  final List firstlist;
  const MyReal({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<MyReal> createState() => _MyRealState();
}

class _MyRealState extends State<MyReal> {
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

  @override
  void initState() {
    super.initState();
    // print(widget.firstlist[0]);
    showMyPost();
    showApartmentPosts();
    showFarmPosts();
    showlandPosts();
    showOfficePosts();
    showShopPosts();
   
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
                'My Real Estates'.tr(),
                textAlign: TextAlign.center,
                style: textColor7,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MyReal1(
                                    firstlist: [widget.firstlist[0]],
                                  )));
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey.shade600,
                      size: 28,
                    ))
              ],
            ),
            body: post.isEmpty
                ? Lottie.asset('assets/animation/empty1.json')
                : ListView.builder(
                    itemCount: post.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Card(
                            child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'http://192.168.1.104/gradpro/img/${post[index]['image']}'),
                            radius: 30,
                          ),
                          title: Text(post[index]['real_name']),
                          subtitle: Text(post[index]['rent_sale']
                              .toString()
                              .toLowerCase()),
                          trailing:
                              Row(mainAxisSize: MainAxisSize.min, children: <
                                  Widget>[
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EditPosts(
                                              postList: post,
                                              index: index,
                                            )));
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                showDialog(
                                    context: (context),
                                    builder: (context) => AlertDialog(
                                          title:  Text("Delete Post",
                                          style:textColor2 ,
                                          ),
                                          content: const Text(
                                              "Are You Sure You Want To Delete Your Post!",
                                              style: textColor4,
                                              ),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              onPressed: () async {
                                                if (post[index]['cat_type'] ==
                                                    "villa") {
                                                  var url = Uri.parse(
                                                      "http://192.168.1.104/gradpro/deletePost.php");
                                                  var response = await http
                                                      .post(url, headers: {
                                                    "Accept": "application/json"
                                                  }, body: {
                                                    "post_id": post[index]
                                                        ['post_id'],
                                                    "cat_type": post[index]
                                                        ['cat_type']
                                                  });
                                                  if (response.statusCode ==
                                                      200) {
                                                    Fluttertoast.showToast(
                                                      msg: 'Post Deleted',
                                                    );
                                                    setState(() {
                                                      post = [];
                                                      showMyPost();
                                                      showApartmentPosts();
                                                      showFarmPosts();
                                                      showlandPosts();
                                                      showOfficePosts();
                                                      showShopPosts();
                                                    });
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                  }
                                                } else if (post[index]
                                                        ['cat_type'] ==
                                                    "apartment") {
                                                  var url = Uri.parse(
                                                      "http://192.168.1.104/gradpro/deleteApartment.php");
                                                  var response = await http
                                                      .post(url, headers: {
                                                    "Accept": "application/json"
                                                  }, body: {
                                                    "post_id": post[index]
                                                        ['post_id'],
                                                    "cat_type": post[index]
                                                        ['cat_type']
                                                  });
                                                  if (response.statusCode ==
                                                      200) {
                                                    Fluttertoast.showToast(
                                                      msg: 'Post Deleted',
                                                    );
                                                    setState(() {
                                                      post = [];
                                                      showMyPost();
                                                      showApartmentPosts();
                                                      showFarmPosts();
                                                      showlandPosts();
                                                      showOfficePosts();
                                                      showShopPosts();
                                                    });
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                  }
                                                } else if (post[index]
                                                        ['cat_type'] ==
                                                    "farm") {
                                                  var url = Uri.parse(
                                                      "http://192.168.1.104/gradpro/deleteFarm.php");
                                                  var response = await http
                                                      .post(url, headers: {
                                                    "Accept": "application/json"
                                                  }, body: {
                                                    "post_id": post[index]
                                                        ['post_id'],
                                                    "cat_type": post[index]
                                                        ['cat_type']
                                                  });
                                                  if (response.statusCode ==
                                                      200) {
                                                    Fluttertoast.showToast(
                                                      msg: 'Post Deleted',
                                                    );
                                                    setState(() {
                                                      post = [];
                                                      showMyPost();
                                                      showApartmentPosts();
                                                      showFarmPosts();
                                                      showlandPosts();
                                                      showOfficePosts();
                                                      showShopPosts();
                                                    });
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                  }
                                                } else if (post[index]
                                                        ['cat_type'] ==
                                                    "land") {
                                                  var url = Uri.parse(
                                                      "http://192.168.1.104/gradpro/deleteLand.php");
                                                  var response = await http
                                                      .post(url, headers: {
                                                    "Accept": "application/json"
                                                  }, body: {
                                                    "post_id": post[index]
                                                        ['post_id'],
                                                    "cat_type": post[index]
                                                        ['cat_type']
                                                  });
                                                  if (response.statusCode ==
                                                      200) {
                                                    Fluttertoast.showToast(
                                                      msg: 'Post Deleted',
                                                    );
                                                    setState(() {
                                                      post = [];
                                                      showMyPost();
                                                      showApartmentPosts();
                                                      showFarmPosts();
                                                      showlandPosts();
                                                      showOfficePosts();
                                                      showShopPosts();
                                                    });
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                  }
                                                } else if (post[index]
                                                        ['cat_type'] ==
                                                    "office") {
                                                  var url = Uri.parse(
                                                      "http://192.168.1.104/gradpro/deleteOffice.php");
                                                  var response = await http
                                                      .post(url, headers: {
                                                    "Accept": "application/json"
                                                  }, body: {
                                                    "post_id": post[index]
                                                        ['post_id'],
                                                    "cat_type": post[index]
                                                        ['cat_type']
                                                  });
                                                  if (response.statusCode ==
                                                      200) {
                                                    Fluttertoast.showToast(
                                                      msg: 'Post Deleted',
                                                    );
                                                    setState(() {
                                                      post = [];
                                                      showMyPost();
                                                      showApartmentPosts();
                                                      showFarmPosts();
                                                      showlandPosts();
                                                      showOfficePosts();
                                                      showShopPosts();
                                                    });
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                  }
                                                } else if (post[index]
                                                        ['cat_type'] ==
                                                    "shop") {
                                                  var url = Uri.parse(
                                                      "http://192.168.1.104/gradpro/deleteShop.php");
                                                  var response = await http
                                                      .post(url, headers: {
                                                    "Accept": "application/json"
                                                  }, body: {
                                                    "post_id": post[index]
                                                        ['post_id'],
                                                    "cat_type": post[index]
                                                        ['cat_type']
                                                  });
                                                  if (response.statusCode ==
                                                      200) {
                                                    Fluttertoast.showToast(
                                                      msg: 'Post Deleted',
                                                    );
                                                    setState(() {
                                                      post = [];
                                                      showMyPost();
                                                      showApartmentPosts();
                                                      showFarmPosts();
                                                      showlandPosts();
                                                      showOfficePosts();
                                                      showShopPosts();
                                                    });
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                  }
                                                }
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
                              },
                            ),
                          ]),
                        )),
                      );
                    })),
      ),
    );
  }
}
