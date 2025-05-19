import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lung_sense/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: const Text(
        'Lung Sense',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      splashTransition: SplashTransition.decoratedBoxTransition,
      animationDuration: const Duration(milliseconds: 1000),
      nextScreen: const Home(),
    );
  }
}
