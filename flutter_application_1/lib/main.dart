
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_profile.dart';
import 'first_page.dart';
import 'screens.dart';


void main() async {
  
    WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
   runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: MyApp()
    ),
  );
}


// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
      fontFamily: 'Comfortaa-VariableFont_wght'
      ),

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
       initialRoute:'homeScreen',
      routes: {
        'homeScreen' : (context) =>const SplashScreen(),
        'LoginScreen': (context) => const LoginScreen(firstlist: [],),
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) =>  const CreateNewAccount(firstlist: [],),
        'HomeScreen' :  (context) => const HomeScreen(firstlist: [],),
        'Profile': (context) =>const Profile(firstlist: [],)
      },
    debugShowCheckedModeBanner: false,
    );
  }
}
