import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pallete.dart';
import '../widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
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
                   TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email'.tr(),
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password'.tr(),
                    inputAction: TextInputAction.done,
                  ),
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
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'HomeScreen'),
                 child: RoundedButton(
                    buttonName: 'Login'.tr(),
                  ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                child: Container(
                  // ignore: sort_child_properties_last
                  child:  Text(
                    'Create New Account'.tr(),
                    style: kBodyText,
                  ),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'HomeScreen'),
                child: Container(
                  // ignore: sort_child_properties_last
                  child:  Text(
                    'Guest'.tr(),
                    style: kBodyText,
                  ),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
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
}