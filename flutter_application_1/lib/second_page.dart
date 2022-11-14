// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'video_widget.dart';
 

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: <Widget>[
        VideoWidget(),  
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    
                    'SEMSARAK\nسمسارك'.toUpperCase(),
                     textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Changa-VariableFont_wght',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      letterSpacing: 0.2,
                      height: 1.2,
                    ),
                  ),
                   
                ],
              ),
            ),
          ),
     
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // ignore: deprecated_member_use
                          primary: Colors.black54,
                        ),
                        
                        onPressed: () {
                          if(context.locale.toString()=="ar"){
                            context.setLocale(const Locale('en'));
                          }
                          Navigator.push(
                           context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                       );
                        },
                        child: const Text(
                          'English',
                          style: TextStyle(
                             fontFamily: 'Changa-VariableFont_wght',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                      )),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      // ignore: deprecated_member_use
                      style: ElevatedButton.styleFrom(primary: Colors.black54),
                      onPressed: () {
                         if(context.locale.toString()=="en"){
                            context.setLocale(const Locale('ar'));
                          }
                   Navigator.push(
                       context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
  );
                      },
                      child: const Text(
                        'عربي',
                        style: TextStyle(
                           fontFamily: 'Changa-VariableFont_wght',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),

        )
        
  
      ],
    );
  }
}





