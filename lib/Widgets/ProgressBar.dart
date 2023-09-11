import 'package:flutter/material.dart';
import 'package:schoolpen/constents/Colors.dart';

// ignore: must_be_immutable
class ProgressBar extends StatelessWidget {
  double value;
  double tweek;

  ProgressBar({super.key, this.value = 50, this.tweek = 0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 20,
        decoration: BoxDecoration(
          color: AppColors.lightWhite,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            Container(
              width: constraints.maxWidth * (value / 100),
              decoration: BoxDecoration(
                color: AppColors.brand,
                gradient: LinearGradient(
                    colors: [AppColors.brand, AppColors.secendery]),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      );
    });
  }
}
