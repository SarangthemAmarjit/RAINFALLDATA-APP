import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rainfalldata/controller/tapcontroller.dart';

import 'package:rainfalldata/pages/dashboard.dart';
import 'package:rainfalldata/pages/splash_screen.dart';
import 'package:rainfalldata/router/router.dart';

void main() {
  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'KulimPark'),
      builder: EasyLoading.init(),
    );
  }
}
