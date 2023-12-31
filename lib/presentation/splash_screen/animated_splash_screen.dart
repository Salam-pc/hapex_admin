import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/main_variables.dart';
import 'package:hapex_admin/presentation/homepage/homepage.dart';
import 'package:hapex_admin/presentation/login_page/loginpage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(loginToken);
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image(image: AssetImage('assets/images/splash_logo_gif.gif')),
        nextScreen:
            //  loginToken.isEmpty ?
            // LoginPage(),
            // :
            HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: splashBGColor,
      ),
    );
  }
}
