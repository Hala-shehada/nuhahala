
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/nav_bar.dart';
//import 'package:semsarak/real_state.dart';
import '../widgets/widgets.dart';
import '../pallete.dart';



class FirstScreen extends StatefulWidget {
 const FirstScreen({Key? key}) : super(key: key);
   @override

  // ignore: library_private_types_in_public_api
  _FirstScreenState createState() => _FirstScreenState();
}


class _FirstScreenState extends State<FirstScreen> {
     
  List<String> category = [
    'All',
    'Houses',
    'Apartments',
    'Villas',
    'Offices',
    'Shops',
    'Warehouses',
    'Land',
    'Farms',
  ];

  var selectedIndex = 0;   
   final List _citiesName =[
      'Nablus',
    'Hebron',
    'Ramallah',
    'Tulkarm',
    'Jericho',
    'Jenin',
    'Bethlehem',
    'Qalqilya',


   ];
   
     Object? _citiesVal;

  tooggleIndex(value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: backGroundColor,
      child: SafeArea(
        child: Scaffold(
          
          backgroundColor: backGroundColor,
           drawer:NavBar(
           
           ),
           
          appBar: AppBar(
             backgroundColor:primaryColor ,
                title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: [        
                        Container(
                          padding: const EdgeInsets.only(left:16.0,right:16.0),
                       
                      
                     child:DropdownButton(
                          hint: const Text('Select City'),
                          dropdownColor: barColor,
                          elevation: 5,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 36.0,
                          value:_citiesVal, 
                          style:  bodyText,
                          onChanged: (value){
                            setState(() {
                              _citiesVal=value;

                            });
                          },
                          items: _citiesName.map((value){
                            return DropdownMenuItem(
                              value: value, 
                              child: Text(value),);
                          }).toList(),
                          
                          
                          ),

                        ),
                 
                      ],
                    ),
              

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
              Container(
                width: width * 0.9,
                height: height * 0.065,
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: const TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Search Category, or near you',
                    suffixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.grey,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.01),
             child: SizedBox(
              height: size.height * .07,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: category.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => tooggleIndex(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: (selectedIndex == index) ? primaryColor : barColor,
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
                      )
                    ),
                  );
                },
              ),
            ),
)
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: height * 0.04),
              //   width: width,
              //   height: height * 0.4,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: RealModel.realModel.length,
              //     itemBuilder: (context, index) {
              //       return SizedBox(
              //         width: width * 0.6,
              //         child: Card(
              //           margin: EdgeInsets.all(width * 0.03),
              //           shadowColor: iconColor,
              //           color: Colors.white,
              //           elevation: 5,
              //           shape: getShapeWidget(context, 0.03),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Expanded(
              //                 flex: 2,
              //                 child: Padding(
              //                   padding: EdgeInsets.all(width * 0.01),
              //                   child: ClipRRect(
              //                     borderRadius:
              //                         getBorderRadiusWidget(context, 0.04),
              //                     child: Image.asset(
              //                       RealModel.realModel[index].imagePath,
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(height: height * 0.01),
              //               Expanded(
              //                 child: Padding(
              //                   padding: EdgeInsets.symmetric(
              //                       horizontal: width * 0.02),
              //                   child: Column(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         RealModel.realModel[index].title,
              //                         style: textColor4,
              //                       ),
              //                       Row(
              //                         children: [
              //                           Icon(
              //                             Icons.location_on,
              //                             color: iconColor,
              //                             size: width * 0.05,
              //                           ),
              //                           Text(
              //                             RealModel.realModel[index].location,
              //                             style: textColor13,
              //                           ),
              //                         ],
              //                       ),
              //                       Row(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           Text(
              //                             RealModel.realModel[index].price,
              //                             style: textColor12,
              //                           ),
              //                           Container(
              //                             padding: EdgeInsets.all(width * 0.01),
              //                             decoration: BoxDecoration(
              //                               color: Colors.redAccent,
              //                               borderRadius: getBorderRadiusWidget(
              //                                   context, 1),
              //                             ),
              //                             child: Icon(
              //                               Icons.favorite,
              //                               color: Colors.white,
              //                               size: width * 0.04,
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(height: height * 0.01),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Recommended',
              //         style: textColor2,
              //       ),
              //       Text(
              //         'View all',
              //         style: textColor4,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: height * 0.03),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              //   child: Card(
              //     elevation: 5,
              //     shadowColor: iconColor,
              //     color: Colors.white,
              //     shape: getShapeWidget(context, 0.04),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(
              //         vertical: height * 0.02,
              //         horizontal: width * 0.02,
              //       ),
              //       child: Row(
              //         children: [
              //           Expanded(
              //             child: ClipRRect(
              //               borderRadius: getBorderRadiusWidget(context, 0.03),
              //               child: Image.asset(
              //                 'pic4.jpg',
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //           SizedBox(width: width * 0.03),
              //           Expanded(
              //             flex: 2,
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   'Modern Farmhouse',
              //                   style: textColor3,
              //                 ),
              //                 SizedBox(height: height * 0.01),
              //                 Row(
              //                   children: [
              //                     Icon(
              //                       Icons.location_on,
              //                       color: iconColor,
              //                       size: width * 0.04,
              //                     ),
              //                     const Text(
              //                       'California',
              //                       style: textColor13,
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(height: height * 0.01),
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     const Text(
              //                       '\$3,256,874',
              //                       style: textColor12,
              //                     ),
              //                     Container(
              //                       padding: EdgeInsets.all(width * 0.01),
              //                       decoration: BoxDecoration(
              //                         color: Colors.redAccent,
              //                         borderRadius:
              //                             getBorderRadiusWidget(context, 1),
              //                       ),
              //                       child: Icon(
              //                         Icons.favorite,
              //                         color: Colors.white,
              //                         size: width * 0.04,
              //                       ),
              //                     )
              //                   ],
              //                 )
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),

        ),
      ),
    );
  }
  
  
}
