import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lung_sense/user_store.dart';
import 'package:lung_sense/analysis.dart';
import 'package:lung_sense/on_board.dart';
import 'package:lung_sense/base_url_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 500,
      splashIconSize: double.infinity,
      centered: true,
      backgroundColor: Colors.white,
      splashTransition: SplashTransition.scaleTransition,
      splash: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Image.asset('assets/logo.jpeg'),
      ),
      animationDuration: const Duration(milliseconds: 1500),
      nextScreen:
          UserStore().baseUrl == null
              ? const BaseUrlScreen()
              : (UserStore().isLoggedIn ? const Analysis() : const OnBoard()),
    );
  }
}
