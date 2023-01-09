// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pallete.dart';
import '../widgets/widgets.dart';
import 'modules/http.dart';



class LoginScreen extends StatefulWidget {

  final List firstlist;
  const LoginScreen({Key? key, required this.firstlist}) : super(key: key);
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   bool vis = true;
       List textfieldsStrings1= [
    "", //email
    "",//password
    ];

      userlogin() async {
var result = await httpGet("userlog", {
      
      "email":textfieldsStrings1[0],
      "password": textfieldsStrings1[1],
      
    
    
    });
   
      if (result.data=="email or password are not correct") {
               buildSnackError(
                              'email or password are not correct ',
                              context,
                              MediaQuery.of(context).size,
                            );
  Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => const LoginScreen(
               firstlist: [],
                )));

}
else{    

  debugPrint(result.data);
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => HomeScreen(
                             firstlist: [
                                  textfieldsStrings1[0],
                                  textfieldsStrings1[1],
                                  result.data,

                                 ],
                              )));
}
 
 }


  @override
    void initState() {
    //userlogin();
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
  //  void initState() {
  //   userlogin();
  // super.initState();
  // }
    return Stack(
      children: [
        const BackgroundImage(
          image: 'assets/images/login.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
            
          
            centerTitle: true,
          ),
          body: Column(
            children: [
              const Flexible(
                child: Center(
                  child: Text(
                    'Semsarak',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
             
              Column(
                
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  emailTextField(),
                  passTextFiled(),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child:  Text(
                      'Forgot Password ?'.tr(),
                      style: kBodyText,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                roundedButton(),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                child: Container(
                  
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                  
                  child:  Text(
                    'Create New Account'.tr(),
                    style: kBodyText,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'HomeScreen'),
                child: Container(
               
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
               
                  child:  Text(
                    'Guest'.tr(),
                    style: kBodyText,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }

Widget emailTextField(){
  Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Form(
      //    key: emailKey,
        child: Center(
          child: TextFormField(
             onChanged: (value) {
              setState(() {
                 textfieldsStrings1[0]= value;
              });
               
            },
          
            decoration:  InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                 FontAwesomeIcons.envelope,
                  size: 28,
                  color: kWhite,
                ),
              ),
               contentPadding: const EdgeInsets.all(18),
              hintText: 'Email'.tr(),
              hintStyle: kBodyText,
            ),
            style: kBodyText,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next, 
          ),
        ),
      ),
      ),
    );
}

Widget passTextFiled(){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Form(
         // key: passwordKey,
        child: Center(
          child: TextFormField(
             onChanged: (value) {
              setState(() {
                textfieldsStrings1[1]= value;
              });
               
            },
            decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                 FontAwesomeIcons.lock,
                  size: 28,
                  color: kWhite,
                ),
              ),
             
              suffixIcon:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: IconButton(
                  icon:  Icon( vis?Icons.visibility_off:Icons.visibility,size: 28,color: kWhite,),
                  onPressed:()  {
                    setState(() {
                      vis=!vis;
                    });
                  },
                ),
                
              ),
              
              contentPadding: const EdgeInsets.all(18),
              hintText: 'Password'.tr(),
              hintStyle: kBodyText,
          
              
              
            ),
            obscureText: vis,
            style: kBodyText,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
      ),
    );
  
}

    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.grey[400]!.withOpacity(
                              0.4,
                            ),
        content: SizedBox(
          height: size.height * 0.03,
          child: Center(
            child: Text(error,
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 218, 226, 238),
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
      ),
    );
  }

Widget roundedButton(){
  Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
        onPressed: () async {
       userlogin();
          
        },
        
        child: Text(
          'Login'.tr(),
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}