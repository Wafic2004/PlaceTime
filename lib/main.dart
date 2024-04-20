import 'dart:io';

import 'package:flutter/material.dart';
import 'package:place_time/Pages/SplashScreen.dart';
import 'package:place_time/Pages/home.dart';
import 'package:place_time/Pages/loading.dart';
import 'package:place_time/Pages/choose_place.dart';

void main() {

  HttpOverrides.global = MyHttpOverrides();
  runApp(MaterialApp(
    initialRoute: 'SplashScreen',
    routes: {
      'Home': (context) => Home(),
      'Loading': (context) => Loading(),
      'choose_place': (context) => ChoosePlace(),
      'SplashScreen': (context) => SplashScreen(),
    },
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? secContext) {
    return super.createHttpClient(secContext)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}