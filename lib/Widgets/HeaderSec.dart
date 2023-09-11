import 'package:flutter/material.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

// ignore: must_be_immutable
class HeaderSec extends StatelessWidget {
  double? height;
  bool? showImage;
  HeaderSec({super.key, this.height = 450, this.showImage = true});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedBottomClipper(),
      child: Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsPath.topBg),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter),
          color: AppColors.brand,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.secendery, AppColors.brand]),
        ),
        child: showImage!
            ? Container(
                margin: const EdgeInsets.only(top: 60),
                child: Image.asset(
                  AssetsPath.brandCharacter,
                  width: MediaQuery.of(context).size.width,
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height * 0.85) // Start at the left-bottom corner
      ..quadraticBezierTo(size.width / 2, size.height, size.width,
          size.height * 0.85) // Create the curved bottom
      ..lineTo(size.width, 0) // Move to the top-right corner
      ..lineTo(0, 0); // Move to the top-left corner
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
