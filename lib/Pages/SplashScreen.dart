import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:place_time/Pages/SplashScreen2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1500,
        splash: Column(
          children: [
            Icon(
                Icons.map_sharp,
              size: 34,
            ),
            Text(
              "Place Time",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
        nextScreen: SplashScreen2(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
