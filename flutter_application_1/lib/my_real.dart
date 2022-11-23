
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_real1.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:flutter_application_1/widgets/colors.dart';








class MyReal extends StatefulWidget {
  final List firstlist;
  const MyReal({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<MyReal> createState() => _MyRealState();
}

class _MyRealState extends State<MyReal> {
  
  //   List<Categories>?cat;
  //   Categories? selectedCategories ;
  //   @override
  //  void initState() {
  //  cat=Categories.getCategories();
  // super.initState();
  // }

  // setSelectedCategories(Categories cat){
  //   setState(() {
  //    selectedCategories = cat;
  //   });
  // }

  // List<Widget> createRdioListCategories(){
  //   List<Widget> widgets =[];
  //   for(Categories categories in cat!){
  //     widgets.add(
  //       RadioListTile(
  //         value: categories,
  //        groupValue:selectedCategories,
  //        title: Text(categories.catname),
  //         onChanged: (currentcat){
  //           setSelectedCategories(currentcat!);
  //         },
  //         selected: selectedCategories == categories,
          
  //         ),
  //     );
  //   }
  //  return  widgets;
  // }
  @override
  Widget build(BuildContext context) {
    //   Size size = MediaQuery.of(context).size;
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Container(
      color: backGroundColor,
      child: SafeArea(
        child: Scaffold(
              
            appBar: AppBar(
             backgroundColor:primaryColor ,
                title: Text('My Real Estates'.tr(), textAlign: TextAlign.center,style:textColor7,),
               centerTitle: true,
             actions:[IconButton(
              onPressed: (){
                        Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => const MyReal1(firstlist: [],
              
                )));
              },
              icon:Icon(Icons.add,color: Colors.grey.shade600,size: 28,))],
               
            ),

            
             

          //  floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          //       floatingActionButton: FloatingActionButton.extended(
          //         extendedPadding: const EdgeInsets.all(15),
          //         backgroundColor: Colors.white,
          //         onPressed: (){},
          //         icon:const Icon(Icons.add_a_photo,color:primaryColor),
          //         label: const Text("Add image",style: bodyText1,),
          //           shape: BeveledRectangleBorder(
          //       borderRadius: BorderRadius.zero,
          //       side: BorderSide(color: Colors.grey.shade600),
          //     ),
          //           ),

   
          //   body: Container(
              
          //   width: 200,
            
          //     padding: const EdgeInsets.only(left:25,top: 30,right: 15),
               
              
          //       child: ListView(
          //         children: [

          //           SizedBox(
                      
          //             height: 130,
          //             width: 30,
          //             child: InkWell(
          //               child: Container(
          //                 decoration: const BoxDecoration(
          //                   color: Colors.white,
          //                 ),
                        
          //                 child:const Icon(Icons.add_a_photo,color:primaryColor,size: 35,),
          //                 // child: const Align(alignment: Alignment(0.1,0.1),child: Text("Add image",style: bodyText1,),),
                          
          //               ),
                      
          //               onTap: (){},
          //             ),

          //           )
             
                 
          //         ],
        
               

          //       ),
           
             
          //     ),

          
          
              
          // );
          
  


  



  // body: Column(
            
  //           children: [
        
  //             Padding(
  //               padding: EdgeInsets.symmetric(
  //                 horizontal: width * 0.03,
  //                 vertical: height * 0.01,
                  
  //               ),
                
            
  //             ),
  //             SizedBox(height: height * 0.01),
  //             Container(
  //                 padding: EdgeInsets.symmetric(horizontal: width * 0.04),
  //                   height: 150,
  //                   width: 180,
            
            
  //                     child: InkWell(
  //                       child: Container(
  //                         decoration: const BoxDecoration(
  //                           color: Colors.white,
  //                         ),
                        
  //                         child: Icon(Icons.add_a_photo,color:Colors.grey[600],size: 35,),
  //                         // child: const Align(alignment: Alignment(0.1,0.1),child: Text("Add image",style: bodyText1,),),
                          
  //                       ),
                      
  //                       onTap: (){},
  //                     ),

  //                   ),
             
                 
             
  //             Container(
  //               margin: EdgeInsets.symmetric(vertical: height * 0.001),
  //            child: SizedBox(
  //             height: size.height * .04,
  //             child: const Text("Add image",style: bodyText1),
              // child: ListView.separated(
              //   separatorBuilder: (context, index) => const SizedBox(width: 10),
              //   itemCount: category.length,
              //   scrollDirection: Axis.horizontal,
              //   padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
              //   itemBuilder: (context, index) {
              //     return GestureDetector(
              //       onTap: () => tooggleIndex(index),
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
              //         decoration: BoxDecoration(
              //           color: (selectedIndex == index) ? primaryColor : barColor,
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: Center(
              //           child: Text(
              //             category[index],
              //             style: const TextStyle(
              //               color: textColor,
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         )
              //       ),
              //     );
              //   },
//               // ),
//             ),
// )


  
//       ],
//           ),

        ),
      ),
    );
        
  }
   
}

