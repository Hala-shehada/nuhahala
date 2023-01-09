// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/realDetails/realV_details.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class DetailS extends StatefulWidget {
  final rating1;
  final total_comments1;
  final post_id;
  final cat_type;
  final login_id;
  final image;
  final location;
  final city;
  final price;
  final rent_sale;
  final space;
  final real_name;

  final user_id;
  final map1;
  final map2;
  final name;
  final phone;
  final img;

  const DetailS({
    Key? key,
    required this.image,
    required this.location,
    required this.city,
    required this.price,
    required this.rent_sale,
    required this.space,
    required this.real_name,
    required this.user_id,
    required this.map1,
    required this.map2,
    required this.name,
    required this.phone,
    required this.img,
    this.login_id,
    this.cat_type,
    this.post_id,
    this.total_comments1,
    this.rating1,
  }) : super(key: key);

  @override
  State<DetailS> createState() => _DetailSState();
}

class _DetailSState extends State<DetailS> {
  double rating = 0;
  String isLikeDisLike = "";
  List comments = [];
  List userInfo = [];
  List postt = [];
  var tComment;
  int i = 0;
  var spl;
  var textfieldsString;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future myComments() async {
    var url = Uri.parse("http://192.168.1.104/gradpro/comments.php");
    var response = await http.post(url,
        headers: {"Accept": "application/json"},
        body: {"post_id": widget.post_id, "cat_type": widget.cat_type});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData.length != 0) {
        setState(() {
          comments = jsonData;
        });

        while (comments.length != i) {
          var url = Uri.parse("http://192.168.1.104/gradpro/userNameImage.php");
          var response = await http.post(url,
              headers: {"Accept": "application/json"},
              body: {"user_idd": comments[i]['user_id']});

          if (response.statusCode == 200) {
            var jsonData = json.decode(response.body);
            if (jsonData.length != 0) {
              setState(() {
                userInfo += jsonData;
              });
            }
          }

          ++i;
        }
      }
    }

    //  print(comments);
    //  print("object");
    //  print(userInfo);
  }

  Future totalComments() async {
    var url = Uri.parse('http://192.168.1.104/gradpro/likedShop.php');
    var response = await http.post(url, body: {
      "post_id": widget.post_id,
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data.length != 0) {
        setState(() {
          tComment = data[0]['total_comments'];
        });
      }
    }
    // print(isLikeDisLike);
  }

  Future getLikes() async {
    var url = Uri.parse('http://192.168.1.104/gradpro/selectLikes.php');
    var response = await http.post(url, body: {
      "user_id": widget.login_id,
      "post_id": widget.post_id,
      "cat_type": widget.cat_type,
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        isLikeDisLike = data;
      });
    }
    // print(isLikeDisLike);
  }

  Future addLike() async {
    var url = Uri.parse('http://192.168.1.104/gradpro/addLikesShop.php');
    var response = await http.post(url, body: {
      "user_id": widget.login_id,
      "post_id": widget.post_id,
      "cat_type": widget.cat_type,
    });

    if (response.statusCode == 200) {
      // print("thanks");

    }
  }

  Future addComments() async {
    var url = Uri.parse('http://192.168.1.104/gradpro/addShopComments.php');
    var response = await http.post(url, body: {
      "comment": textfieldsString,
      "user_id": widget.login_id,
      "post_id": widget.post_id,
      "cat_type": widget.cat_type,
    });

    if (response.statusCode == 200) {
      showNotification();
    }
  }

  Future<void> _launchInBrowser() async {
    launchUrl(Uri.parse("tel:${widget.phone}"));
  }

  @override
  void initState() {
    //    name = myName;
    //  getData();

    //  print(name);
    // print(widget.login_id);
    // print(widget.cat_type);
    super.initState();
    getLikes();
    myComments();
    totalComments();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    // var ios = const IOSInitializationSettings();
    var initilize = InitializationSettings(android: android);
    flutterLocalNotificationsPlugin.initialize(initilize,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      // print("Notification : $payload" );

    }
    throw {};
  }

  Future showNotification() async {
    var android = const AndroidNotificationDetails(
      "channelId",
      "channelName",
      channelDescription: "some details",
    );
    var ios = const IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.show(
        0, "Semsarak Notifications", textfieldsString, platform,
        payload: "some details");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.image,
            child: Container(
              height: size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 44),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    width: 80,
                    padding: const EdgeInsets.symmetric(
                      vertical: 1,
                    ),
                    child: Center(
                      child: Text(
                        "FOR ${widget.rent_sale}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.real_name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              addLike().whenComplete(() => getLikes());
                            },
                            icon: Icon(
                              Icons.favorite,
                              size: 20,
                              color: isLikeDisLike == "ONE"
                                  ? Colors.red[700]
                                  : Colors.yellow[700],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 8,
                    bottom: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            widget.city + " - " + widget.location,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 10, top: 8, bottom: 2),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.zoom_out_map,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${widget.space} sq/m",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 10,
                    top: 8,
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            itemSize: 23,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            updateOnDrag: true,
                            onRatingUpdate: (rating) => setState(() {
                              this.rating = rating;

                              
                              //  print(widget.property.review);
                            }),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            " ${widget.rating1} Rating",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
               child: SingleChildScrollView(
                child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: widget.img ==
                                              "http://192.168.1.104/gradpro/images/"
                                          ? const AssetImage(
                                              "assets/images/blank-profile.png")
                                          : NetworkImage(widget.img)
                                              as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Property Owner",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.yellow[700]!.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      _launchInBrowser();
                                    },
                                    icon: Icon(
                                      Icons.phone,
                                      size: 20,
                                      color: Colors.yellow[700],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.yellow[700]!.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.message,
                                    color: Colors.yellow[700],
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),


                    const Padding(
                      padding: EdgeInsets.only(
                        right: 24,
                        left: 24,
                        bottom: 6,
                      ),
                      child: Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                        padding: const EdgeInsets.only(
                          right: 24,
                          left: 24,
                          bottom: 8,
                        ),
                        height: 150,
                        width: 800,
                        child: MyMapp1(
                          firstlist: [widget.map1, widget.map2],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            right: 24, left: 24, bottom: 10, top: 8),
                        child: Text(
                          "Comments Area",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 24, left: 24, bottom: 1),
                        child: Column(children: <Widget>[
                          Form(
                            child: Center(
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    textfieldsString = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(11),
                                  hintText: "Enter Comments",
                                  hintStyle: bodyText11,
                                ),
                                style: bodyText1,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ),
                          MaterialButton(
                            color: Colors.yellow[700],
                            child: const Text("Publish"),
                            onPressed: () {
                              if (textfieldsString != null) {
                                addComments().whenComplete(() =>
                                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DetailS(
                                              
                                              city: widget.city,
                                    
                                              image: widget.image,
                                              img: widget.img,
                                              location: widget.location,
                                              map1: widget.map1,
                                              map2: widget.map2,
                                              name: widget.name,
                                              phone: widget.phone,
                                              price: widget.price,
                                              real_name: widget.real_name,
                                              rent_sale: widget.rent_sale,
                                              space: widget.space,
                                              user_id: widget.user_id,
                                              rating1: widget.rating1,
                                              total_comments1: widget.total_comments1,
                                              post_id: widget.post_id,
                                              cat_type: widget.cat_type,
                                              login_id: widget.login_id,
                                            )))
                                            
                                            );
                              }
                            },
                          )
                        ]),
                      ),

                       Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 1, color: kBlue))),
                        child: Text(
                           "$tComment comments".tr(),
                          style: bodyText1,
                        ),
                      ),
                       SizedBox(
                          height: 400,
                          width: 800,
                          child: ListView.builder(
                              itemCount: userInfo.length,
                              itemBuilder: (context, index) {
                                spl = userInfo[index]['name'].split(' ');

                                return Card(
                                    child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: userInfo[index]["image"] ==
                                            ""
                                        ? const AssetImage(
                                            "assets/images/blank-profile.png")
                                        : NetworkImage(
                                                'http://192.168.1.104/gradpro/images/${userInfo[index]["image"]}')
                                            as ImageProvider,
                                  ),
                                  title: Text(spl[0]),
                                  subtitle: Text(comments[index]['comment']),
                                ));
                              })),
                                const SizedBox(
                        height: 2000,
                      ),

                   
                  ],
                ),
              ),
               ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeature(IconData iconData, String text) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.yellow[700],
          size: 28,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

 
}
