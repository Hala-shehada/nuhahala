
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/http.dart';
import 'package:flutter_application_1/widgets/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pallete.dart';

class NewPassword extends StatefulWidget {
   final List firstlist;
  const NewPassword({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}
String password = '';
class _NewPasswordState extends State<NewPassword> {

  List textfieldsStrings = [
    "", //currentpassword
    "", //newpassword
    "", //confirmPassword
  ];
  final _currentpasswordKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();
bool vis=true;

  getPassword() async {
    var result = await httpGet("userpassword", {
      "id": widget.firstlist[0],
    });

    password = result.data;
    
  
    // setState(() {  print(password) ;
    // });
  }

    changepassword() async {
    // var data = utf8.encode(textfieldsStrings[1]); // data being hashed
    // var hashvalue = sha1.convert(data);

    await httpPost("change-password", {
      
      "id": widget.firstlist[0],
      "password":textfieldsStrings[1],// hashvalue.toString(),
    });
     // print(textfieldsStrings[1]) ;
    setState(() {});
  }
    @override
  void initState() {
   getPassword();
   //print(password) ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
       // const BackgroundImage(image: 'assets/images/login.jpg'),
        Scaffold(
          //backgroundColor: Colors.transparent,
          appBar: AppBar(
           // backgroundColor: Colors.transparent,
           backgroundColor:primaryColor ,
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
            title:  Text(
              'Reset Password'.tr(),
              style: textColor7,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                 

                     passTextFiled(),
                     passTextFiled1(),
                     passTextFiled2(),

                    const SizedBox(
                      height: 20,
                    ),
                    roundedButton(),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }


  Widget passTextFiled(){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,),
      child: Container(
        height: size.height * 0.08,
        width: size.width *0.9,
        decoration: BoxDecoration(
          color: Colors.grey[400]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Form(
          key: _currentpasswordKey ,
        child: Center(
          child: TextFormField(
             onChanged: (value) {
              setState(() {
                 textfieldsStrings[0]= value;
              });
               
            },

              validator: (value) {
              
                   if (value!.length < 8) {
                              buildSnackError(
                                'Invalid password'.tr(),
                                context,
                                size,
                              );
                              return '';
                   }
                            return null;

                            },

                      
                     
            decoration: InputDecoration(
              // prefixIcon: const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Icon(
              //    FontAwesomeIcons.lock,
              //     size: 28,
              //     color: kWhite,
              //   ),
              // ),
             
              suffixIcon:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: IconButton(
                  icon:  Icon( vis?Icons.visibility_off:Icons.visibility,size: 28,color: iconColor,),
                  onPressed:()  {
                    setState(() {
                      vis=!vis;
                    });
                  },
                ),
                
              ),
              
              contentPadding: const EdgeInsets.all(18),
              hintText: "Current Passsword".tr(),
              hintStyle: bodyText,
          
              
              
            ),
            obscureText: vis,
            style: bodyText,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
      ),
    );
  
}


 Widget passTextFiled1(){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey[400]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Form(
          key: _passwordKey,
        child: Center(
          child: TextFormField(
             onChanged: (value) {
              setState(() {
                 textfieldsStrings[1]= value;
              });
               
            },

              validator: (value) {
              
                   if (value!.length < 8) {
                              buildSnackError(
                                'Invalid password'.tr(),
                                context,
                                size,
                              );
                              return '';
                            } else if (!RegExp(
                                    r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$')
                                .hasMatch(value)) {
                              buildSnackError(
                                'Invalid password'.tr(),
                                context,
                                size,
                              );
                              return '';
                            }
                            return null;

                            },


                      
                     
            decoration: InputDecoration(
              // prefixIcon: const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Icon(
              //    FontAwesomeIcons.lock,
              //     size: 28,
              //     color: kWhite,
              //   ),
              // ),
             
              suffixIcon:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: IconButton(
                  icon:  Icon( vis?Icons.visibility_off:Icons.visibility,size: 28,color: iconColor,),
                  onPressed:()  {
                    setState(() {
                      vis=!vis;
                    });
                  },
                ),
                
              ),
              
              contentPadding: const EdgeInsets.all(18),
              hintText: "New Passsword".tr(),
              hintStyle: bodyText,
          
              
              
            ),
            obscureText: vis,
            style: bodyText,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
      ),
    );
  
}

 Widget passTextFiled2(){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey[400]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Form(
          key: _confirmPasswordKey,
        child: Center(
          child: TextFormField(
             onChanged: (value) {
              setState(() {
                 textfieldsStrings[2]= value;
              });
               
            },

              validator: (value) {
              
                    if (value != textfieldsStrings[1]) {
                        buildSnackError(
                          'Passwords must match'.tr(),
                          context,
                          size,
                        );
                        return '';
                      }
                      return null;

                            },

                      
                     
            decoration: InputDecoration(
              // prefixIcon: const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Icon(
              //    FontAwesomeIcons.lock,
              //     size: 28,
              //     color: kWhite,
              //   ),
              // ),
             
              suffixIcon:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: IconButton(
                  icon:  Icon( vis?Icons.visibility_off:Icons.visibility,size: 28,color: iconColor,),
                  onPressed:()  {
                    setState(() {
                      vis=!vis;
                    });
                  },
                ),
                
              ),
              
              contentPadding: const EdgeInsets.all(18),
              hintText: "Confirm New Passsword".tr(),
              hintStyle: bodyText,
          
              
              
            ),
            obscureText: vis,
            style: bodyText,
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
      height: size.height * 0.07,
      width: size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
        onPressed: () async {
                        String h = textfieldsStrings[0];
                             if( textfieldsStrings[2]==''|| textfieldsStrings[1]==''|| h==''){
                                     buildSnackError(
                          'All fields are required'.tr(),
                          context,
                          size,
                        );
                     

                             }else
                            if (password == h && textfieldsStrings[2]== textfieldsStrings[1]) {
                              changepassword();
                                 buildSnackError(
                                  "Password Changed".tr(),
                                  context,
                                  size);
                              Navigator.pop(context);
                            }
                            else if(textfieldsStrings[2]!= textfieldsStrings[1]){
                                buildSnackError(
                          'Passwords must match'.tr(),
                          context,
                          size,
                        );
                     
                      }


                             else if(password != h) {
                              buildSnackError(
                                  "The current password is incorrect!".tr(),
                                  context,
                                  size);
                            }
    
        },
        
        child: Text(
          'Reset Password'.tr(),
          style: pText1
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
