import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rainfalldata/controller/tapcontroller.dart';

import 'package:rainfalldata/pages/dashboard.dart';
import 'package:rainfalldata/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'KulimPark'),
      home: const GifSplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
