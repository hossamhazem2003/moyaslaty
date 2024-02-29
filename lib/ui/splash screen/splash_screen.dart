import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mwaslaty/core/sizes.dart';

import '../home screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, HomeScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/splash.jpg",
          width: Sizes.width(context) * 0.60,
          height: Sizes.height(context) * 0.40,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
