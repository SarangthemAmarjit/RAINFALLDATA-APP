import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rainfalldata/pages/dashboard.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  _GifSplashScreenState createState() => _GifSplashScreenState();
}

class _GifSplashScreenState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      context.router.replaceNamed('/homepage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SizedBox(
            height: 300,
            child: Image.asset(
              'assets/images/splashok.gif',
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
        ),
      )),
    );
  }
}
