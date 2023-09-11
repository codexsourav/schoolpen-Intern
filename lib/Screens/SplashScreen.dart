import 'dart:async';
import 'package:flutter/material.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AssetsPath.logo,
              width: 84,
              height: 88,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.only(top: 34, bottom: 51),
              child: Image.asset(AssetsPath.brand),
            ),
            SimpleCircularProgressBar(
              backStrokeWidth: 5,
              backColor: AppColors.lightWhite,
              progressColors: [AppColors.brand, AppColors.secendery],
              fullProgressColor: AppColors.brand,
              progressStrokeWidth: 5,
              size: 40,
              mergeMode: true,
              animationDuration: 2,
            ),
          ],
        ),
      ),
    );
  }
}
