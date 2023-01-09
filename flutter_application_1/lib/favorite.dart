import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Fav extends StatefulWidget {
  final List firstlist;
  const Fav({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  List myLike = [];
  List post = [];
  int i = 0;
  Future myLikes() async {
    var url = Uri.parse("http://192.168.1.104/gradpro/myLikes.php");
    var response = await http.post(url,
        headers: {"Accept": "application/json"},
        body: {"myID": widget.firstlist[0]});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData.length != 0) {
        setState(() {
          myLike = jsonData;
        });

        while (myLike.length != i) {
          if (myLike[i]['cat_type'] == 'villa') {
            var url = Uri.parse("http://192.168.1.104/gradpro/likedPosts.php");
            var response = await http.post(url,
                headers: {"Accept": "application/json"},
                body: {"post_id": myLike[i]['post_id']});

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);

              setState(() {
                post += jsonData;
              });
            }

            ++i;
          } else if (myLike[i]['cat_type'] == 'apartment') {
            var url =
                Uri.parse("http://192.168.1.104/gradpro/likedApartment.php");
            var response = await http.post(url,
                headers: {"Accept": "application/json"},
                body: {"post_id": myLike[i]['post_id']});

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);

              setState(() {
                post += jsonData;
              });
            }

            ++i;
          } else if (myLike[i]['cat_type'] == 'farm') {
            var url = Uri.parse("http://192.168.1.104/gradpro/likedFarm.php");
            var response = await http.post(url,
                headers: {"Accept": "application/json"},
                body: {"post_id": myLike[i]['post_id']});

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);

              setState(() {
                post += jsonData;
              });
            }

            ++i;
          } else if (myLike[i]['cat_type'] == 'land') {
            var url = Uri.parse("http://192.168.1.104/gradpro/likedLand.php");
            var response = await http.post(url,
                headers: {"Accept": "application/json"},
                body: {"post_id": myLike[i]['post_id']});

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);

              setState(() {
                post += jsonData;
              });
            }

            ++i;
          } else if (myLike[i]['cat_type'] == 'office') {
            var url = Uri.parse("http://192.168.1.104/gradpro/likedOffice.php");
            var response = await http.post(url,
                headers: {"Accept": "application/json"},
                body: {"post_id": myLike[i]['post_id']});

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);

              setState(() {
                post += jsonData;
              });
            }

            ++i;
          } else if (myLike[i]['cat_type'] == 'shop') {
            var url = Uri.parse("http://192.168.1.104/gradpro/likedShop.php");
            var response = await http.post(url,
                headers: {"Accept": "application/json"},
                body: {"post_id": myLike[i]['post_id']});

            if (response.statusCode == 200) {
              var jsonData = json.decode(response.body);

              setState(() {
                post += jsonData;
              });
            }

            ++i;
          }
        }
      }
      //  print(myLike);
      //  print(post);

    }
  }

  @override
  void initState() {
    super.initState();
    // print(widget.firstlist[0]);
    myLikes();
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
                'My Favorite'.tr(),
                textAlign: TextAlign.center,
                style: textColor7,
              ),
              centerTitle: true,
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
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              if (post[index]['cat_type'] == "villa") {
                                var url = Uri.parse(
                                    'http://192.168.1.104/gradpro/addLike.php');
                                var response = await http.post(url, body: {
                                  "user_id": widget.firstlist[0],
                                  "post_id": post[index]['post_id'],
                                  "cat_type": post[index]['cat_type'],
                                });

                                if (response.statusCode == 200) {
                                  Fluttertoast.showToast(
                                    msg: 'Unliked',
                                  );
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Fav(
                                                firstlist: [
                                                  widget.firstlist[0]
                                                ],
                                              )));
                                }
                              } else if (post[index]['cat_type'] ==
                                  "apartment") {
                                var url = Uri.parse(
                                    'http://192.168.1.104/gradpro/addLikesApartment.php');
                                var response = await http.post(url, body: {
                                  "user_id": widget.firstlist[0],
                                  "post_id": post[index]['post_id'],
                                  "cat_type": post[index]['cat_type'],
                                });

                                if (response.statusCode == 200) {
                                  Fluttertoast.showToast(
                                    msg: 'Unliked',
                                  );
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Fav(
                                                firstlist: [
                                                  widget.firstlist[0]
                                                ],
                                              )));
                                }
                              } else if (post[index]['cat_type'] == "farm") {
                                var url = Uri.parse(
                                    'http://192.168.1.104/gradpro/addLikesFarm.php');
                                var response = await http.post(url, body: {
                                  "user_id": widget.firstlist[0],
                                  "post_id": post[index]['post_id'],
                                  "cat_type": post[index]['cat_type'],
                                });

                                if (response.statusCode == 200) {
                                  Fluttertoast.showToast(
                                    msg: 'Unliked',
                                  );
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Fav(
                                                firstlist: [
                                                  widget.firstlist[0]
                                                ],
                                              )));
                                }
                              } else if (post[index]['cat_type'] == "land") {
                                var url = Uri.parse(
                                    'http://192.168.1.104/gradpro/addLikesLand.php');
                                var response = await http.post(url, body: {
                                  "user_id": widget.firstlist[0],
                                  "post_id": post[index]['post_id'],
                                  "cat_type": post[index]['cat_type'],
                                });

                                if (response.statusCode == 200) {
                                  Fluttertoast.showToast(
                                    msg: 'Unliked',
                                  );
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Fav(
                                                firstlist: [
                                                  widget.firstlist[0]
                                                ],
                                              )));
                                }
                              } else if (post[index]['cat_type'] == "office") {
                                var url = Uri.parse(
                                    'http://192.168.1.104/gradpro/addLikesOffice.php');
                                var response = await http.post(url, body: {
                                  "user_id": widget.firstlist[0],
                                  "post_id": post[index]['post_id'],
                                  "cat_type": post[index]['cat_type'],
                                });

                                if (response.statusCode == 200) {
                                  Fluttertoast.showToast(
                                    msg: 'Unliked',
                                  );
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Fav(
                                                firstlist: [
                                                  widget.firstlist[0]
                                                ],
                                              )));
                                }
                              } else if (post[index]['cat_type'] == "shop") {
                                var url = Uri.parse(
                                    'http://192.168.1.104/gradpro/addLikesShop.php');
                                var response = await http.post(url, body: {
                                  "user_id": widget.firstlist[0],
                                  "post_id": post[index]['post_id'],
                                  "cat_type": post[index]['cat_type'],
                                });

                                if (response.statusCode == 200) {
                                  Fluttertoast.showToast(
                                    msg: 'Unliked',
                                  );
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Fav(
                                                firstlist: [
                                                  widget.firstlist[0]
                                                ],
                                              )));
                                }
                              }
                            },
                          ),
                        )),
                      );
                    })),
      ),
    );
  }
}
