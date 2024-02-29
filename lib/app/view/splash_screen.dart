import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xoxo_game/app/view/home_screen.dart';
import 'package:xoxo_game/utils/colors.dart';
import 'package:xoxo_game/utils/widgets/custom_loading.dart';


class SplashScreen extends StatefulWidget {
   static String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the home screen after 3 seconds
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App icon or logo
            Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),

            // App name
            const SizedBox(height: 20),
             Text(
              'Tic Tac Trio',
              style:GoogleFonts.poppins(fontSize: 30,)
            ),

            // Loading indicator
            const SizedBox(height: 40),
            const CustomLoadingAnimation(),
          ],
        ),
      ),
    );
  }
}