import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pallete.dart';
import '../widgets/background-image.dart';
import '../widgets/rounded-button.dart';
import '../widgets/text-field-input.dart';

// ignore: use_key_in_widget_constructors
class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
    final GlobalKey<FormState>emailKey=GlobalKey();
    String email ='';
    
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/login.jpg'),
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
            title:  Text(
              'Forgot Password'.tr(),
              style: kBodyText,
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
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: size.width * 0.8,
                      child:  Text(
                        'Enter your email we will send instruction to reset your password'.tr(),
                        style: kBodyText,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email'.tr(),
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundedButton(buttonName: 'Send'.tr())
                  ],
                ),
              )
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
          key: emailKey,
        child: Center(
          child: TextFormField(
           
             onChanged: (value) {
              setState(() {
                email= value;
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


}
