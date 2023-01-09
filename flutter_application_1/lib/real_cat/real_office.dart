// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/filter.dart';
import 'package:flutter_application_1/realDetails/realO_details.dart';
import 'package:flutter_application_1/real_cat/real_apartment.dart';
import 'package:flutter_application_1/real_cat/real_farm.dart';
import 'package:flutter_application_1/real_cat/real_land.dart';
import 'package:flutter_application_1/real_cat/real_shop.dart';
import 'package:flutter_application_1/real_cat/real_vialla.dart';
import 'package:flutter_application_1/widgets/nav_bar.dart';
import 'package:lottie/lottie.dart';
import '../../widgets/widgets.dart';
import '../../pallete.dart';
import '../hfirst_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class Office1 extends StatefulWidget {
  final List firstlist;

  
 
  var selectedCounrty;
  Office1({Key? key, required this.firstlist, required this.selectedCounrty})
      : super(key: key);

  @override
  State<Office1> createState() => _Office1State();
}

class _Office1State extends State<Office1> {
 

  var selectRentSale = "Rent";
  List<String> category = [
    'All',
    'Apartments',
    'Villas',
    'Offices',
    'Shops',
    'Land',
    'Farms',
    'Price',
  ];

  var selectedIndex = 3;

  tooggleIndex(value) {
    setState(() {
      selectedIndex = value;
    });
  }
List postData = [];
  Future showAllPost() async {
    var url = Uri.parse("http://192.168.1.104/gradpro/allOfficePosts.php");
    var response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        postData = jsonData;
      });
      // print(jsonData);
      return jsonData;
    }
  }

  @override
  void initState() {
    showAllPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backGroundColor,
          drawer: NavBar(
            firstlist: [widget.firstlist[0]],
          ),
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text(
              'Home page'.tr(),
              textAlign: TextAlign.center,
              style: textColor7,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.01,
                ),
              ),
              SizedBox(height: height * 0.01),
              SizedBox(
                height: size.height * .07,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: category.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        tooggleIndex(index);
                        if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Apart(
                                        firstlist: [widget.firstlist[0]],
                                        selectedCounrty: widget.selectedCounrty,
                                      )));
                        } else if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Villa1(
                                        firstlist: [widget.firstlist[0]],
                                        selectedCounrty: widget.selectedCounrty,
                                      )));

                          //               } else if(index == 3){
                          //                 Navigator.push(
                          // context,
                          // MaterialPageRoute(
                          //     builder: (_) =>  Office1(
                          //          firstlist: [widget.firstlist[0]],selectedCounrty: widget.selectedCounrty,
                          //          )));

                        } else if (index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Shop1(
                                        firstlist: [widget.firstlist[0]],
                                        selectedCounrty: widget.selectedCounrty,
                                      )));
                        } else if (index == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Land1(
                                        firstlist: [widget.firstlist[0]],
                                        selectedCounrty: widget.selectedCounrty,
                                      )));
                        } else if (index == 6) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Farm1(
                                        firstlist: [widget.firstlist[0]],
                                        selectedCounrty: widget.selectedCounrty,
                                      )));
                        } else if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FirstScreen(
                                        firstlist: [widget.firstlist[0]],
                                      )));
                        } else if (index == 7) {
                          _showBottomSheet();
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: (selectedIndex == index)
                                ? primaryColor
                                : barColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              category[index],
                              style: const TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  locationDrop(),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  rentSaleDrop(),
                ],
              ),

              SizedBox(height: height * 0.03),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: postData.isEmpty
                      ? Lottie.asset('assets/animation/empty1.json')
                      : ListView.builder(
                          itemCount: postData.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: ((context, index) {
                            return NewPostItem2(
                              location: postData[index]['location'],
                              price: postData[index]['price'],
                              rent_sale: postData[index]['rent_sale'],
                              space: postData[index]['space'],
                              room: postData[index]['room'],
                              floor: postData[index]['floor'],
                              hall: postData[index]['hall'],
                              real_name: postData[index]['real_name'],
                              city: postData[index]['city'],
                              user_id: postData[index]['user_id'],
                              image:
                                  'http://192.168.1.104/gradpro/img/${postData[index]['image']}',
                              map1: postData[index]['map1'],
                              map2: postData[index]['map2'],
                              login_id1: widget.firstlist[0],
                              cat_type1: postData[index]['cat_type'],
                              post_id1: postData[index]['post_id'],
                              total_comments: postData[index]['total_comments'],
                              rating: postData[index]['rating'],
                            );
                          })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }





  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        builder: (BuildContext context) {
          return Wrap(
            children: const [
              Filter(),
            ],
          );
        });
  }

  Widget locationDrop() {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left: 24),
      height: size.height * 0.04,
      width: size.width * 0.48,
      decoration: BoxDecoration(
        color: barColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: DropdownButton(
          icon: const Icon(
            Icons.arrow_drop_down,
            color: textColor,
            size: 30,
          ),
          hint: const Text("Select City", style: bodyText11),
          dropdownColor: barColor,
          underline: const Divider(
            thickness: 0,
          ),
          isExpanded: true,
          items: [
            'Nablus',
            'Hebron',
            'Ramallah',
            'Tulkarm',
            'Jericho',
            'Jenin',
            'Bethlehem',
            'Qalqilya',
          ]
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: bodyText11,
                    ),
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              widget.selectedCounrty = val;
              //textfieldsStrings2[2] = val;
            });
          },
          value: widget.selectedCounrty,
        ),
      ),
    );
  }

  Widget rentSaleDrop() {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left: 24),
      height: size.height * 0.04,
      width: size.width * 0.48,
      decoration: BoxDecoration(
        color: barColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: DropdownButton(
          icon: const Icon(
            Icons.arrow_drop_down,
            color: textColor,
            size: 30,
          ),

          // hint:const Text("Select City",style: bodyText11),
          dropdownColor: barColor,
          underline: const Divider(
            thickness: 0,
          ),
          isExpanded: true,

          items: [
            'Rent',
            'Sale',
          ]
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: bodyText11,
                    ),
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              selectRentSale = val!;
              //textfieldsStrings2[2] = val;
            });
          },

          value: selectRentSale,
        ),
      ),
    );
  }
}



class NewPostItem2 extends StatefulWidget {
  final rating;
  final total_comments;
  final post_id1;
  final cat_type1;
  final login_id1;
  final image;
  final location;
  final city;
  final price;
  final rent_sale;
  final space;
  final real_name;
  final floor;
  final room;
  final hall;
  final user_id;
  final map1;
  final map2;

  const NewPostItem2({
    Key? key,
    required this.image,
    required this.location,
    required this.city,
    required this.price,
    required this.rent_sale,
    required this.space,
    required this.real_name,
    required this.room,
    required this.floor,
    required this.hall,
    required this.user_id,
    required this.map1,
    required this.map2,
    this.login_id1,
    this.cat_type1,
    this.post_id1,
    this.total_comments,
    this.rating,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewPostItem2State createState() => _NewPostItem2State();
}

class _NewPostItem2State extends State<NewPostItem2> {
  String? myImageName;
  String? phoneNo;
  String? myName;

  Future getData() async {
    var url = Uri.parse('http://192.168.1.104/gradpro/getdata.php');
    var response = await http.post(url, body: {"myID": widget.user_id});

    final userdata = Map<String, dynamic>.from(jsonDecode(response.body));
    myImageName = userdata['image'];
    phoneNo = userdata['phone'];
    myName = userdata['name'];
  }

  @override
  void initState() {
    getData();
    // print(widget.cat_type1);
    // print( widget.location + widget.price+ widget.rent_sale+widget.space+widget.beadroom+"widget.bathroom +widget.hall+widget.real_name+widget.city+widget.user_id +widget.image");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                width: 80,
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
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
              Expanded(
                child: Container(),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.real_name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        r"₪" + widget.price,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            widget.city + " - " + widget.location,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                            size: 14,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${widget.rating} Rating",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    child: const Text(
                      "Read more",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailO(
                                  location: widget.location,
                                  price: widget.price,
                                  rent_sale: widget.rent_sale,
                                  space: widget.space,
                                  room: widget.room,
                                  floor: widget.floor,
                                  hall: widget.hall,
                                  real_name: widget.real_name,
                                  city: widget.city,
                                  user_id: widget.user_id,
                                  image: widget.image,
                                  map1: widget.map1,
                                  map2: widget.map2,
                                  img:
                                      'http://192.168.1.104/gradpro/images/$myImageName',
                                  name: myName,
                                  phone: phoneNo,
                                  login_id: widget.login_id1,
                                  cat_type: widget.cat_type1,
                                  post_id: widget.post_id1,
                                  total_comments1: widget.total_comments,
                                  rating1: widget.rating,
                                )),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      // ),
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
