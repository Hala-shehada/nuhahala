
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'second_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return  SplashState();
    
}
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    startTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: initScreen(context),
    );
  }
  
  startTime() async {
    var duration = const Duration(seconds: 6);
    // ignore: unnecessary_new
    return new Timer(duration, route);
  }
route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const SecondScreen()
      )
    ); 
  }
  
  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: barColor,
      body:Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Image.asset('assets/images/pro.png',width:100,height: 90,),
         const Padding(padding: EdgeInsets.only(top:13 )),
          const Text('Welcome to ',style: TextStyle(fontFamily: 'Comfortaa-VariableFont_wght',fontWeight: FontWeight.w900,fontSize: 22,color: Colors.grey), ),
            const Padding(padding: EdgeInsets.only(top:5 )),
         
         RichText(
  text: const TextSpan(
    text: 'Semsarak ',
    style: TextStyle(fontFamily: 'Comfortaa-VariableFont_wght',fontWeight: FontWeight.w900,fontSize: 22,color: Color(0xffFDDB3A)),
    children: <TextSpan>[
      TextSpan(text: 'in Palestine',  style: TextStyle(fontFamily: 'Comfortaa-VariableFont_wght',fontWeight: FontWeight.w900,fontSize: 22,color: Colors.black),)
     
    ],
  ),
),
          const Padding(padding: EdgeInsets.only(top:30 )),
    
          const CircularProgressIndicator(
            backgroundColor: Color(0xffFDDB3A),
            strokeWidth: 1,
          )

        ],

      ))
    

     
    );
  }
}


















































