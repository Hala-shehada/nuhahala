import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pallete.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'alert_dialog.dart';
// ignore: use_key_in_widget_constructors

// ignore: use_key_in_widget_constructors
class Profile extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   bool tappedYes = false;

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;

    //final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          //backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.2,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]!.withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
             
                  ],
                ),

                 SizedBox(
                  height: size.width * 0.06,
                ),
                Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    
          Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.02),
     height: size.height * 0.06,
      width: size.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
     
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Edite profile",
          style:  pText,
        ),
      ),
      
 ),



              const ListTile(
            leading: Icon(Icons.person),
            title: Text('Username',style:  textColor4,),
           
        ),
        const Divider(),
         const ListTile(
            leading: Icon(Icons.email),
            title: Text('user@gmail.com',style:  textColor4,),
        ),


       const Divider(),

    const ListTile(
            leading: Icon(Icons.location_city),
            title: Text('City',style:  textColor4,),

        ),

          const Divider(),

    Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.02),
     height: size.height * 0.06,
      width: size.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
     
      child: TextButton(
       onPressed: () async {
            final action = await AlertDialogs.yesCancelDialog(context, 'Delete Account', 'Are you sure you want to delete your account completely?');
            if(action == DialogsAction.delete) {
              setState(() => tappedYes = true);
            } else {
              setState(() => tappedYes = false);
            }
          },

        child: const Text(
          "Delete Account",
          style:  pText,
        ),
      ),
      
 ),
                   
                  ],
                )


  
              ],
            
             
            ),
          ),
        )
      ],
    );


    
  }
  
}