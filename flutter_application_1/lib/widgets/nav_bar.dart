
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../hfirst_screen.dart';
import '../pallete.dart';
import '../user_profile.dart';


// ignore: use_key_in_widget_constructors
class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //const MyWidget({super.key});
// ignore: prefer_typing_uninitialized_variables
  var container;
 // var currentPage = DrawerSections.profile;
  changDrawer(int i){

    Navigator.pop(context);
            if (i == 1) {
              // currentPage = DrawerSections.profile;
               container = Profile();
            } else if (i == 2) {
              // currentPage = DrawerSections.home;
              container = const FirstScreen();

            } else if (i == 3) {
              // currentPage = DrawerSections.myReal;
              container = const FirstScreen();

            } else if (i== 4) {
              // currentPage = DrawerSections.chat;
              container = const FirstScreen();

            } else if (i == 5) {
              // currentPage = DrawerSections.notifications;
              container = const FirstScreen();

            } else if (i == 6) {
              // currentPage = DrawerSections.changeLang;
              container = const FirstScreen();
            } 
             setState(() {
                
          });
        
  }
  @override
  Widget build(BuildContext context) {
     
    // if (currentPage == DrawerSections.profile) {
    //   container = Profile();
    // } else if (currentPage == DrawerSections.home) {
    //   container = const FirstScreen();
    // } else if (currentPage == DrawerSections.myReal) {
    //   container = Profile();
    // } else if (currentPage == DrawerSections.chat) {
    //   container = Profile();
    // } else if (currentPage == DrawerSections.notifications) {
    //   container = Profile();
    // } else if (currentPage == DrawerSections.changeLang) {
    //   container = Profile();
    // } 
    
     Size size = MediaQuery.of(context).size;
     
    return Drawer(
      
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          
          UserAccountsDrawerHeader(
            accountName: const Text('userName', style:  textColor14,),
             accountEmail: const Text('user@gmail.com', style:  textColor14,),
             currentAccountPicture: CircleAvatar(
              child: ClipOval(
                 child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                ),
             ),
             decoration: const BoxDecoration(
              color: primaryColor,
             ),
             
             ),
        ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile',style:  textColor13,),
// ignore: avoid_returning_null_for_void
            onTap: () {
               changDrawer(1);
               
               
            },
        ),
      ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home',style:  textColor13,),
// ignore: avoid_returning_null_for_void
          onTap: () {
             changDrawer(2);
          }
        ),
 ListTile(
            leading: const Icon(Icons.real_estate_agent),
            title: const Text('My Real Estates',style:  textColor13,),
// ignore: avoid_returning_null_for_void
            onTap: () => null,
        ),
         ListTile(
            leading: const Icon(Icons.chat_bubble),
            title: const Text('Chat',style:  textColor13,),
            
// ignore: avoid_returning_null_for_void
            onTap: () => null,
        ),
         ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications',style:  textColor13,),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 22,
                height: 22,
                child: const Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),
                  ),
                ),

            )),
// ignore: avoid_returning_null_for_void
            onTap: () => null,
        ),
 ListTile(
            leading: const Icon(Icons.swap_horizontal_circle),
            title: const Text('Change Language',style:  textColor13,),
// ignore: avoid_returning_null_for_void
            onTap: () {
               if(context.locale.toString()=="en"){
                  context.setLocale(const Locale('ar'));
                 }else{
                  context.setLocale(const Locale('en'));
                 }
                          
            },
        ),
        ],
      ),
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
 
}
