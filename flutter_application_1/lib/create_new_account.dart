

import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pallete.dart';
import '../widgets/widgets.dart';
import './modules/http.dart';




class CreateNewAccount extends StatefulWidget {
  
  final List firstlist;
 const CreateNewAccount({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();

}

class _CreateNewAccountState extends State<CreateNewAccount> {

  // ignore: prefer_typing_uninitialized_variables
  var selectedCounrty;
    List textfieldsStrings2 = [
    "", //name
    "", //email 
    "", //city
    "", //phone
    "", //password  
  ];
  final GlobalKey<FormState>namekey =GlobalKey();
  final GlobalKey<FormState>emailKey=GlobalKey();
  final GlobalKey<FormState>passwordKey =GlobalKey();
  final GlobalKey<FormState>citykey =GlobalKey();
  final GlobalKey<FormState>phonekey =GlobalKey();
  bool vis=true;
String res='';
  createUser() async {
var result = await httpPost("create-user", {

      "name":textfieldsStrings2[0],
       "email":  textfieldsStrings2[1], 
       "city":textfieldsStrings2[2], 
      "phone": textfieldsStrings2[3],
       "password":textfieldsStrings2[4], 
   
    
    
    });
      if (result.ok) {


 res = result.data['status'].toString();

}
 
 
 res = result.data['status'].toString();
 }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/image2.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
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
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                 

                usernameTextField(),
                emailTextField(),
                locationDrop(),
                phoneWidget(),
               passTextFiled(),

                    
                    const SizedBox(
                      height: 25,
                    ),

                   
                  roundedButton(),
                    
          
         
               
                    
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          'Already have an account?'.tr(),
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'LoginScreen');
                          },
                          child: Text(
                            'Login'.tr(),
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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

  Widget locationDrop(){
  Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        
       
      padding: const EdgeInsets.only(left: 10),
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        
        
        child: Center(
      
           child: DropdownButton(
            
                 
                      icon:const Icon(Icons.arrow_drop_down,
                        color: kWhite,
                       size: 36,
                      
                       
                      ),
                      
                      
                    
                        hint:const Text("Select City",style: kBodyText),
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
                        child: Text(e,style:  kBodyText,),))
                          .toList(),
                      onChanged:(val) {
                      setState(() {
                        selectedCounrty=val;
                        textfieldsStrings2[2] = val;

                      });
                            },
                            

  value: selectedCounrty,
  
 

        ),
        
      ),
      
      ),
      
    );
}

Widget phoneWidget(){
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
           key:phonekey,
        child: Center(
          child: TextFormField(
         onChanged: (value) {
              setState(() {
                textfieldsStrings2[3] = value;
              });
            },

              validator: (value) {
           if (value!.length < 9||value.length > 10) {
                              buildSnackError(
                                'Invalid phone number',
                                context,
                                size,
                              );
                              return '';
                            }
                           else if (!RegExp(
                                   (r"^(?:[+0]9)?[0-9]{10}$"))
                                .hasMatch(value)) {
                              buildSnackError(
                                'Invalid phone number',
                                context,
                                size,
                              );
                              return '';
                            }

                            return null;
                          },

            decoration:  InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                 FontAwesomeIcons.phone,
                  size: 28,
                  color: kWhite,
                ),
              ),
              
               contentPadding: const EdgeInsets.all(18),
              hintText: 'Phone Number'.tr(),
              hintStyle: kBodyText,
            ),
            style: kBodyText,
            keyboardType: TextInputType.number,
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
          key: passwordKey,
        child: Center(
          child: TextFormField(
             onChanged: (value) {
              setState(() {
                 textfieldsStrings2[4]= value;
              });
               
            },

              validator: (value) {
              
                   if (value!.length < 8) {
                              buildSnackError(
                                'Invalid password',
                                context,
                                size,
                              );
                              return '';
                            } else if (!RegExp(
                                    r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$')
                                .hasMatch(value)) {
                              buildSnackError(
                                'Invalid password',
                                context,
                                size,
                              );
                              return '';
                            }
                            return null;

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


Widget usernameTextField(){
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
           key:namekey,
        child: Center(
          child: TextFormField(
               onChanged: (value) {
              setState(() {
                 textfieldsStrings2[0]= value;
              });

              
            },

                validator: (value) {
                         if (value!.length <= 2) {
                            buildSnackError(
                              'Invalid name',
                              context,
                              size,
                            );
                            return '';
                          }
                          return null;
                      },
            
               decoration: InputDecoration(
              
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                 FontAwesomeIcons.user,
                  size: 28,
                  color: kWhite,
                ),
              ),
               contentPadding: const EdgeInsets.all(18),
              hintText: 'User'.tr(),
              hintStyle: kBodyText,
            ),
             

         
            
            style: kBodyText,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
      ),
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
          key: emailKey,
        child: Center(
          child: TextFormField(
           
             onChanged: (value) {
              setState(() {
                 textfieldsStrings2[1]= value;
              });
               
            },

              validator: (value) {
            
                            if (value!.length < 5) {
                              buildSnackError(
                                'Invalid email',
                                context,
                                size,
                              );
                              return '';
                            }
                           else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                .hasMatch(value)) {
                              buildSnackError(
                                'Invalid email',
                                context,
                                size,
                              );
                              return '';
                            }

                            return null;
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


    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor:Colors.grey[400]!.withOpacity(
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
      
           if(namekey.currentState!.validate()){
                        if (emailKey.currentState!.validate()) {
                           if (passwordKey.currentState!.validate()){
                            if(phonekey.currentState!.validate()){

await createUser();
     // ignore: use_build_context_synchronously
     buildSnackError(
                                res,
                                context,
                                size,
                              );
                              
   
   if(res != "email already exist"){
    // ignore: use_build_context_synchronously
    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LoginScreen(
                               firstlist: [
                                  textfieldsStrings2[0],
                                  textfieldsStrings2[1],
                                  textfieldsStrings2[2],
                                   textfieldsStrings2[3],
                                    textfieldsStrings2[4],
                                
                                ],
                              )));}                 
   
  
                            
                     
                            }
    }
    }

    
    }
    
        },
        
        child: Text(
          'Register'.tr(),
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }


}



