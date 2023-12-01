import 'package:flutter/material.dart';
import 'package:rainfalldata/pages/dashboard.dart';

class GifSplashScreen extends StatefulWidget {
  const GifSplashScreen({super.key});

  @override
  _GifSplashScreenState createState() => _GifSplashScreenState();
}

class _GifSplashScreenState extends State<GifSplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
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
