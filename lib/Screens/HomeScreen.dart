import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schoolpen/Widgets/CustomButton.dart';
import 'package:schoolpen/Widgets/HeaderSec.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

// Define a StatelessWidget called HomePage
class HomePage extends StatelessWidget {
  // Constructor for HomePage
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the system UI overlay style to light status bar icons
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display a header section with a specified height
            HeaderSec(height: 480),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(AssetsPath.logo2), // Display an image asset
                  const SizedBox(height: 2),
                  Text(
                    "Learn everything with AI",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "learn and grow with ai to stay up to date, with ever evolving demand of ai in the future",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.34,
                      color: AppColors.lightBlack,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      children: [
                        // Display a custom button with the title "Get started"
                        CustomButton(
                            title: "Get started",
                            onClick: () {
                              // Navigate to the '/faceid' route on button click
                              Navigator.of(context).pushNamed('/faceid');
                            }),
                        const SizedBox(height: 20),
                        // Display a custom button with the title "Join as admin"
                        CustomButton(
                            title: "Join as admin",
                            onClick: () {
                              // Navigate to the '/login' route on button click
                              Navigator.of(context).pushNamed('/login');
                            }),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
