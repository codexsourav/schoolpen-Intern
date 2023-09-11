import 'package:flutter/material.dart';
import 'package:schoolpen/Widgets/HeaderSec.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

// Define a StatelessWidget called FingerPrintPage
class FingerPrintPage extends StatelessWidget {
  const FingerPrintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // Display a header section with a specified height and no image
        HeaderSec(height: 200, showImage: false),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              Image.asset(AssetsPath.fingerprint),
              // Display a fingerprint image
              const SizedBox(height: 20),
              Text(
                "28%",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text(
                "Touch the sensor",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Put your finger on the sensor and lift after you feel vibration.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  height: 1.34,
                  color: AppColors.lightBlack,
                ),
              ),
            ],
          ),
        ),
      ]),
      // For Only Navigation To Next Page
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(19, 0, 0, 0),
        elevation: 0,
        onPressed: () {
          // Navigate to the '/myname' route when the button is pressed
          Navigator.pushNamed(context, '/myname');
        },
        child: const Center(
            child: Icon(
          Icons.keyboard_arrow_right_rounded,
          color: Colors.white,
        )),
      ),
    );
  }
}
