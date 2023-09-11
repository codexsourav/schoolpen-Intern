import 'package:flutter/material.dart';
import 'package:schoolpen/Screens/AuthPages/LoginPage.dart';
import 'package:schoolpen/Screens/AuthPages/OtpPage.dart';
import 'package:schoolpen/Screens/AuthPages/SchoolInfoPage.dart';
import 'package:schoolpen/Screens/AuthPages/SignupPage.dart';
import 'package:schoolpen/Screens/FaceIdScreen.dart';
import 'package:schoolpen/Screens/FingerPrintScreen.dart';
import 'package:schoolpen/Screens/HomeScreen.dart';
import 'package:schoolpen/Screens/LicensekeyScreen.dart';
import 'package:schoolpen/Screens/SplashScreen.dart';
import 'package:schoolpen/Screens/UserInfoPages/MyNamePage.dart';
import 'package:schoolpen/Screens/UserInfoPages/MyRigionPage.dart';
import 'package:schoolpen/Screens/UserInfoPages/WhyUseInfo.dart';
import 'package:schoolpen/Screens/UserInfoPages/WhyUsePage.dart';

class Routes {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/splash":
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case "/home":
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) =>
              FadeTransition(opacity: animation, child: const HomePage()),
        );
      case "/faceid":
        return MaterialPageRoute(
          builder: (context) => const FaceIdPage(),
        );
      case "/fingerprint":
        return MaterialPageRoute(
          builder: (context) => const FingerPrintPage(),
        );
      case "/myname":
        return MaterialPageRoute(
          builder: (context) => MyNamePage(),
        );
      case "/myregion":
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MyRigionPage(),
        );
      case "/whyuse":
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => WhyUsePage(),
        );
      case "/whyuseinfo":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          String typeSelect = settings.arguments as String;
          return WhyUseInfoPage(selectType: typeSelect);
        });
      case "/login":
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case "/signup":
        return MaterialPageRoute(
          builder: (context) => const SignupPage(),
        );
      case "/otp":
        return MaterialPageRoute(
          builder: (context) => const OtpPage(),
        );
      case "/schoolinfo":
        return MaterialPageRoute(
          builder: (context) => const SchoolInfoPage(),
        );
      case "/LicensekeyPage":
        return MaterialPageRoute(
          builder: (context) => const LicensekeyPage(),
        );
      default:
        return null;
    }
  }
}
