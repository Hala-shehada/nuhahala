import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pallete.dart';
import '../widgets/background-image.dart';
import 'package:http/http.dart' as http;
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  
    String email = '';
    String verifyLink = '';
    bool verifyButton = false;
    String newPass = '';
    Future checkUser()async{
      
      var response = await http.post(Uri.parse("http://192.168.1.104/gradpro/check.php")
      ,
      body: {
        "myEmail" : email,
      }
      );
      var link = json.decode(response.body);
      if(link == "Invalid User"){
       Fluttertoast.showToast(
        msg: 'There is no account for this user',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor:  Colors.grey[500],
        textColor: Colors.white,
        fontSize: 16.0
    );
       
      }else{
        setState(() {
          verifyLink=link;
          verifyButton=true;
        });
      
             Fluttertoast.showToast(
        msg: 'Click Verify Button To Rset Password ',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[500],
        textColor: Colors.white,
        fontSize: 16.0
    );

      }
      // print(link);

    }


    Future resetPassword() async{
      var response = await http.post(Uri.parse(verifyLink));
     String responseapi = response.body.toString().replaceAll("\n","");
    var link = json.decode(responseapi);

      
       setState(() {
          newPass=link;
       });
      //  print(link);
      
       Fluttertoast.showToast(
        msg: 'Your password has been reset :$newPass',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[500],
        textColor: Colors.white,
        fontSize: 16.0
    );

    }

  // sendMail() async {
  //   String username = EMAIL;
  //   String password = PASS;

  //   final smtpServer = gmail(username, password);
  //   // Creating the Gmail server

  //   // Create our email message.
  //   final message = Message()
  //     ..from = Address(username)
  //     ..recipients.add('abc@gmail.com') //recipent email
  //     //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com']) //cc Recipents emails
  //     //..bccRecipients.add(Address('bccAddress@example.com')) //bcc Recipents emails
  //     ..subject =
  //         'Password recover link from shawondeveloper : ${DateTime.now()}' //subject of the email
  //     //..text =
  //     //'This is the plain text.\nThis is line 2 of the text part.'
  //     ..html =
  //         "<h3>Thanks for with localhost. Please click this link to reset your password</h3>\n<p> <a href='$verifylink'>Click me to reset</a></p>"; //body of the email

  //   try {
  //     final sendReport = await send(message, smtpServer);
  //     print('Message sent: ' +
  //         sendReport.toString()); //print if the email is sent
  //   } on MailerException catch (e) {
  //     print('Message not sent. \n' +
  //         e.toString()); //print if the email is not sent
  //     // e.toString() will show why the email is not sending
  //   }
  // }




 
    
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
                  
                    SizedBox(
                      width: size.width * 0.8,
                      child:  Text(
                        'Enter your email we will send instruction to reset your password'.tr(),
                        style: kBodyText,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                
                    emailTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    // roundedButton(),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    verifyButton? roundedButton1():roundedButton(),
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
        child: Center(
          child: TextFormField(
           
             onChanged: (value) {
              setState(() {
                email= value;
                
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
        onPressed: () {
         
        checkUser();
        },
        
        child: Text(
          'Send'.tr(),
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

   Widget roundedButton1(){
  Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
        onPressed: () {
         resetPassword();
      
        },
        
        child: Text(
          'Verify'.tr(),
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }




}
