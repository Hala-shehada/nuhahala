
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../upload.dart';








class Villa extends StatefulWidget {
  final List firstlist;
  const Villa({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<Villa> createState() => _VillaState();
}


class _VillaState extends State<Villa> {

  int? selectedRadioTile;
   // ignore: prefer_typing_uninitialized_variables
   var selectedCounrty;

final GlobalKey<FormState> pricekey =GlobalKey();
final GlobalKey<FormState> roomkey =GlobalKey();
final GlobalKey<FormState> hallkey =GlobalKey();
final GlobalKey<FormState> bathkey =GlobalKey();
final GlobalKey<FormState> spacekey =GlobalKey();
final GlobalKey<FormState> addkey =GlobalKey();
final GlobalKey<FormState> mapkey =GlobalKey();
 List textfieldsStrings2 = [
    "", //price
    "", //city 
    "", //rooms
    "", //halls
    "", //bathroms
    "", //space   
    "", //add
    "", //map
    
  ];

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
  

  @override
  Widget build(BuildContext context) {
    
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: backGroundColor,
      child: SafeArea(
        child: Scaffold(
           
            appBar: AppBar(
             backgroundColor:primaryColor ,
                title: Text('Add Real Estates'.tr(), textAlign: TextAlign.center,style:textColor7,),
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
                    width: 100,
            
            
                     // child: InkWell(
                        child: Container(
                           
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                                                       child: InkWell(
                                onTap: (){
                                         Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => const Upload(firstlist: [],
              
                )));

                                },
                            
                             child: const Icon(
                               Icons.add_a_photo,
                                color: primaryColor,
                                size: 35.0,

                            ),
                              ),
                         // child:const Icon(Icons.add_a_photo,color:primaryColor,size: 35,),
                          // child: const Align(alignment: Alignment(0.1,0.1),child: Text("Add image",style: bodyText1,),),
                          
                        ),
                      
                     
                    ),
             
                 
             
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.001),
             child: SizedBox(
             // height: size.height ,
              child: Column(
               
                children: <Widget>[
                  ButtonBar(
                   alignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Radio(
                         activeColor: Colors.amber,
                        value: 1,
                         groupValue: selectedRadioTile,
                          onChanged: (val){
                            setSelectedRadioTile(val!);
                          //  print(val);

                          },
                        
                          ),
                           Text("Sale".tr(),style: pText2),
                            SizedBox(width: width * 0.09),
                            Radio(
                              activeColor: Colors.amber,
                        value: 2,
                         groupValue: selectedRadioTile,
                          onChanged: (val){
                            setSelectedRadioTile(val!);
                          //  print(val);

                          },
                        
                          ),
                          Text("Rent".tr(),style: pText2),

                           

                           

                    ],
                  ),
             // SizedBox(height: height * 0.001),
            
                 
                ],

                
              ),
            ),
            
),

         
            Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.0001),
               // width: width,
                //height: height * 0.001,
                child: Column(
                 // scrollDirection: Axis.vertical,
                     children: [
                 priceTextField(),
                 locationDrop(),
                 roomTextField(),
                 hallsTextField(),
                 bathTextField(),
                  spaceTextField(),
                  addTextField(),
                  mapTextField(),

                   SizedBox(height: height * 0.02),
                  roundedButton(),
                 

                            





                           ],
             
                ),
              ),

  
      ],
          ),

        ),
      ),
    );
  }


  Widget addTextField(){
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
           key:addkey,
        child: Center(
          child: TextFormField(
               onChanged: (value) {
              setState(() {
                 textfieldsStrings2[6]= value;
              });

              
            },

                validator: (value) {
                         if (value!.isEmpty) {
                            buildSnackError(
                              'Required',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                      },
            
               decoration: InputDecoration(
               contentPadding: const EdgeInsets.all(6),
              hintText: 'Addres'.tr(),
              hintStyle:pText1,
            ),
             
            style: pText1,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
      ),
    );
} Widget mapTextField(){
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
           key:mapkey,
        child: Center(
          child: TextFormField(
               onChanged: (value) {
              setState(() {
                 textfieldsStrings2[7]= value;
              });

              
            },

                validator: (value) {
                         if (value!.isEmpty) {
                            buildSnackError(
                              'Required',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                      },
            
               decoration: InputDecoration(
               contentPadding: const EdgeInsets.all(6),
              hintText: 'Location on map'.tr(),
              hintStyle:pText1,
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
  Widget priceTextField(){
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
           key:pricekey,
        child: Center(
          child: TextFormField(
               onChanged: (value) {
              setState(() {
                 textfieldsStrings2[0]= value;
              });

              
            },

                validator: (value) {
                         if (value!.isEmpty) {
                            buildSnackError(
                              'Required',
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
              hintStyle:pText1,
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


 Widget locationDrop(){
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
            
                 
                      icon:const Icon(Icons.arrow_drop_down,
                        color: textColor,
                       size: 36,
                      
                       
                      ),
                      
                      
                    
                        hint:const Text("Select City",style: pText1),
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
                        child: Text(e,style: pText1,),))
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


 Widget roomTextField(){
  Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Form(
           key:roomkey,
        child: Center(
          child: TextFormField(
               onChanged: (value) {
              setState(() {
                 textfieldsStrings2[2]= value;
              });

              
            },

                validator: (value) {
                         if (value!.isEmpty) {
                            buildSnackError(
                              'Required',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                      },
            
               decoration: InputDecoration(
               contentPadding: const EdgeInsets.all(6),
              hintText: 'Rooms'.tr(),
              hintStyle:pText1,
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

 Widget hallsTextField(){
  Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Form(
           key:hallkey,
        child: Center(
          child: TextFormField(
               onChanged: (value) {
              setState(() {
                 textfieldsStrings2[3]= value;
              });

              
            },

                validator: (value) {
                         if (value!.isEmpty) {
                            buildSnackError(
                              'Required',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                      },
            
               decoration: InputDecoration(
               contentPadding: const EdgeInsets.all(6),
              hintText: 'Halls'.tr(),
              hintStyle:pText1,
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


 Widget bathTextField(){
  Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Form(
           key:bathkey,
        child: Center(
          child: TextFormField(
               onChanged: (value) {
              setState(() {
                 textfieldsStrings2[4]= value;
              });

              
            },

                validator: (value) {
                         if (value!.isEmpty) {
                            buildSnackError(
                              'Required',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                      },
            
               decoration: InputDecoration(
               contentPadding: const EdgeInsets.all(6),
              hintText: 'Bathrooms'.tr(),
              hintStyle:pText1,
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

 Widget  spaceTextField(){
  Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Form(
           key:spacekey,
        child: Center(
          child: TextFormField(
               onChanged: (value) {
              setState(() {
                 textfieldsStrings2[5]= value;
              });

              
            },

                validator: (value) {
                         if (value!.isEmpty) {
                            buildSnackError(
                              'Required',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                      },
            
               decoration: InputDecoration(
               contentPadding: const EdgeInsets.all(6),
              hintText: 'Internal Space'.tr(),
              hintStyle:pText1,
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

Widget roundedButton(){
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
      
           if(pricekey.currentState!.validate()){
                        if (bathkey.currentState!.validate()) {
                           if (spacekey.currentState!.validate()){
                            if(addkey.currentState!.validate()){
                               if(mapkey.currentState!.validate()){
                                if(roomkey.currentState!.validate()){
                                  if(hallkey.currentState!.validate()){
                                    


// await createUser();
//      // ignore: use_build_context_synchronously
//      buildSnackError(
//                                 res,
//                                 context,
//                                 size,
//                               );
                              
   
//    if(res != "email already exist"){
//     // ignore: use_build_context_synchronously
//     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => LoginScreen(
//                                firstlist: [
//                                   textfieldsStrings2[0],
//                                   textfieldsStrings2[1],
//                                   textfieldsStrings2[2],
//                                    textfieldsStrings2[3],
//                                     textfieldsStrings2[4],
                                
//                                 ],
//                               )));}                 
                                }
                                }
                            
                               }
                            }
    }
    }

    
    }
    
        },
        
        child: Text(
          'Add'.tr(),
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
   
}

