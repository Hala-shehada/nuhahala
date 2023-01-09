import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_map.dart';
import 'package:flutter_application_1/my_real.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/upload.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_parser/http_parser.dart';

class Farm extends StatefulWidget {
  final List firstlist;
  final List position;
  final List img;
  const Farm(
      {Key? key,
      required this.firstlist,
      required this.position,
      required this.img})
      : super(key: key);

  @override
  State<Farm> createState() => _FarmState();
}

class _FarmState extends State<Farm> {
  int? selectedRadioTile;
  // ignore: prefer_typing_uninitialized_variables
  var selectedCounrty;
  Dio dio = Dio();
  final GlobalKey<FormState> pricekey = GlobalKey();
  final GlobalKey<FormState> spacekey = GlobalKey();
  final GlobalKey<FormState> addkey = GlobalKey();
  final GlobalKey<FormState> namekey = GlobalKey();
  List textfieldsStrings2 = [
    "", //price
    "", //city
    "", //space
    "", //add
    "", //map
    "", //name
    "", //rent/sale
  ];
  final List num = ["6"];
  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  _save() async {
    // ignore: unnecessary_null_comparison
    if (images != null) {
      for (var i = 0; i < images.length; i++) {
        ByteData byteData = await images[i].getByteData();
        List<int> imageData = byteData.buffer.asUint8List();

        MultipartFile multipartFile = MultipartFile.fromBytes(
          imageData,
          filename: images[i].name,
          contentType: MediaType('image', 'jpg'),
        );
        //  log(images[i].name.toString());

        FormData formData = FormData.fromMap({
          "image": multipartFile,
          "user_id": widget.firstlist[0],
          "city": textfieldsStrings2[1],
          "real_name": textfieldsStrings2[5],
          "price": textfieldsStrings2[0],
          "map1": widget.position[0],
          "map2": widget.position[1],
          "rent_sale": textfieldsStrings2[6],
          "space": textfieldsStrings2[2],
          'location': textfieldsStrings2[3]
        });
        var response = await dio
            .post('http://192.168.1.104/gradpro/farm_post.php', data: formData);
        if (response.statusCode == 200) {
          //  log(response.data);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text(
              'Add Real Estates'.tr(),
              textAlign: TextAlign.center,
              style: textColor7,
            ),
            centerTitle: true,
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.004,
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.3),
                height: 130,
                width: 180,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Upload(
                                  firstlist: [widget.firstlist[0]],
                                  num: [num[0]])));
                    },
                    child: const Icon(
                      Icons.add_a_photo,
                      color: primaryColor,
                      size: 35.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.001),
                child: SizedBox(
                  child: Column(
                    children: <Widget>[
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Radio(
                            activeColor: Colors.amber,
                            value: 1,
                            groupValue: selectedRadioTile,
                            onChanged: (val) {
                              setSelectedRadioTile(val!);
                              textfieldsStrings2[6] = "SALE";
                            },
                          ),
                          Text("Sale".tr(), style: pText2),
                          SizedBox(width: width * 0.09),
                          Radio(
                            activeColor: Colors.amber,
                            value: 2,
                            groupValue: selectedRadioTile,
                            onChanged: (val) {
                              setSelectedRadioTile(val!);
                              textfieldsStrings2[6] = "RENT";
                            },
                          ),
                          Text("Rent".tr(), style: pText2),
                        ],
                      ),
                      SizedBox(height: height * 0.001),
                      nameTextField(),
                      priceTextField(),
                      locationDrop(),
                      spaceTextField(),
                      addTextField(),
                      mapTextField(),
                      SizedBox(height: height * 0.02),
                      roundedButton(),
                      const SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget priceTextField() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Form(
          key: pricekey,
          child: Center(
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  textfieldsStrings2[0] = value;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  buildSnackError(
                    'Required'.tr(),
                    context,
                    size,
                  );
                  return '';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(6),
                hintText: 'Price'.tr(),
                hintStyle: pText1,
              ),
              style: pText1,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
      ),
    );
  }

  Widget locationDrop() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: size.height * 0.05,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
          child: DropdownButton(
            icon: const Icon(
              Icons.arrow_drop_down,
              color: textColor,
              size: 36,
            ),
            hint: Text("Select City".tr(), style: pText1),
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
                        style: pText1,
                      ),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                selectedCounrty = val;
                textfieldsStrings2[1] = val;
              });
            },
            value: selectedCounrty,
          ),
        ),
      ),
    );
  }

  Widget spaceTextField() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Form(
          key: spacekey,
          child: Center(
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  textfieldsStrings2[2] = value;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  buildSnackError(
                    'Required'.tr(),
                    context,
                    size,
                  );
                  return '';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(6),
                hintText: 'Total Space'.tr(),
                hintStyle: pText1,
              ),
              style: pText1,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
      ),
    );
  }

  Widget nameTextField() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Form(
          key: namekey,
          child: Center(
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  textfieldsStrings2[5] = value;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  buildSnackError(
                    'Required'.tr(),
                    context,
                    size,
                  );
                  return '';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(6),
                hintText: 'Real Name'.tr(),
                hintStyle: pText1,
              ),
              style: pText1,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
      ),
    );
  }

  Widget addTextField() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Form(
          key: addkey,
          child: Center(
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  textfieldsStrings2[3] = value;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  buildSnackError(
                    'Required'.tr(),
                    context,
                    size,
                  );
                  return '';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(6),
                hintText: 'Address'.tr(),
                hintStyle: pText1,
              ),
              style: pText1,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
      ),
    );
  }

  Widget mapTextField() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(9),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MyMapp(
                          firstlist: [widget.firstlist[0]],
                          num: [num[0]],
                        )));
          },
          child: Text(
            'Location on map'.tr(),
            style: pText1,
          ),
        ),
      ),
    );
  }

  Widget roundedButton() {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      width: size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kBlue,
      ),
      child: TextButton(
        onPressed: () async {
          if (namekey.currentState!.validate()) {
            if (pricekey.currentState!.validate()) {
              if (spacekey.currentState!.validate()) {
                if (addkey.currentState!.validate()) {
                  _save().whenComplete(
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MyReal(
                                  firstlist: [widget.firstlist[0]],
                                ))),
                  );
                }
              }
            }
          }
        },
        child: Text(
          'Add post'.tr(),
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.grey[500],
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
