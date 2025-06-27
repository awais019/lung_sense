import 'package:flutter/material.dart';

import 'package:lung_sense/splash_screen.dart';
import 'package:lung_sense/user_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserStore().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
