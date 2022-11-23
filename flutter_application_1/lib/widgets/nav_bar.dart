
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/login_screen.dart';
// import 'package:flutter_application_1/my_real.dart';
// import 'package:flutter_application_1/widgets/colors.dart';
// import 'dart:ui';
// import '../hfirst_screen.dart';
// import '../pallete.dart';
// import '../user_profile.dart';



// class NavBar extends StatefulWidget {

//   const NavBar({Key? key}) : super(key: key);


//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {

 
//   @override
//   Widget build(BuildContext context) {
     
//      Size size = MediaQuery.of(context).size;
 
//     return Drawer(
      
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
          
//           UserAccountsDrawerHeader(
//             accountName:  const Text("Semsarak", style:  pText,),
//              accountEmail:  const Text("", style:  pText2,),
//              currentAccountPicture: CircleAvatar(
//               child: ClipOval(
//                  child: BackdropFilter(
//                           filter: ImageFilter.blur(sigmaX:3, sigmaY: 3),
//                           child: CircleAvatar(
//                             radius: size.width * 0.14,
//                            backgroundImage: const AssetImage("assets/images/pro.png"),
                            
//                             backgroundColor: Colors.white,
                        
//                           ),
//                         ),
//                 ),
//              ),
//              decoration: const BoxDecoration(
//               color: primaryColor,
//              ),
             
//              ),
//         ListTile(
//             leading: const Icon(Icons.person),
//             title: Text('Profile'.tr(),style:  pText1,),

//             onTap: () {
//                  Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (_) => const Profile(firstlist: [],
              
//                 )));
               
               
//             },
//         ),
//       ListTile(
//           leading: const Icon(Icons.home),
//           title:  Text('Home'.tr(),style:   pText1,),

//           onTap: () {
//           Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (_) => const FirstScreen(firstlist: [],
              
//                 )));
//           }
//         ),
//  ListTile(
//             leading: const Icon(Icons.real_estate_agent),
//             title:  Text('My Real Estates'.tr(),style:   pText1,),

//             onTap: () {
//                       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (_) => const MyReal(firstlist: [],
              
//                 )));
              
//             }
//         ),
//          ListTile(
//             leading: const Icon(Icons.chat_bubble),
//             title:  Text('Chat'.tr(),style:   pText1,),
            

//             onTap: () {
//                       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (_) => const Profile(firstlist: [],
              
//                 )));
//             }
//         ),
//          ListTile(
//             leading: const Icon(Icons.notifications),
//             title:  Text('Notifications'.tr(),style:   pText1,),
//             trailing: ClipOval(
//               child: Container(
//                 color: Colors.red,
//                 width: 22,
//                 height: 22,
//                 child: const Center(
//                   child: Text(
//                     '8',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14
//                     ),
//                   ),
//                 ),

//             )),
//             onTap: () {
//                       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (_) => const Profile(firstlist: [],
              
//                 )));
//             }
//         ),
//  ListTile(
//             leading: const Icon(Icons.swap_horizontal_circle),
//             title:  Text('Change Language'.tr(),style:   pText1,),
//             onTap: () {
//                if(context.locale.toString()=="en"){
//                   context.setLocale(const Locale('ar'));
//                  }else{
//                   context.setLocale(const Locale('en'));
//                  }
                          
//             },
//         ),

//           ListTile(
//             leading: const Icon(Icons.logout),
//             title: Text('Logout'.tr(),style:  pText1,),

//             onTap: () {
//            Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (_) => const LoginScreen(
//                firstlist: [],
//                 )));


               
               
//             },
//         ),
//         ],
//       ),
//     );
//   }
// }

// enum DrawerSections {
//   profile,
//   home,
//   myReal,
//   chat,
//   notifications,
//   changeLang,
//   logout,

// }
