import 'package:flutter/material.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

class CustomKeyboard extends StatelessWidget {
  final ValueSetter<String> onKeyPressed;

  CustomKeyboard({required this.onKeyPressed});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 30,
      children: List.generate(12, (index) {
        if (index == 11) {
          // Add the backspace button
          return InkWell(
            onTap: () {
              onKeyPressed('submit');
            },
            child: Center(
                child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                  child: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 25,
              )),
            )),
          );
        } else if (index == 10) {
          return InkWell(
            onTap: () {
              onKeyPressed("0");
            },
            child: Center(
              child: Text(
                "0",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black),
              ),
            ),
          );
        } else if (index == 9) {
          return InkWell(
            onTap: () {
              onKeyPressed('backspace');
            },
            child: Center(
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: AppColors.darkGray.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      AppColors
                          .darkGray, // Change this color to the desired color
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      AssetsPath.cross,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return _NumberBtn(
            onKeyPressed: onKeyPressed,
            value: (index + 1).toString(),
          );
        }
      }),
    );
  }
}

class _NumberBtn extends StatelessWidget {
  const _NumberBtn({
    super.key,
    required this.onKeyPressed,
    required this.value,
  });

  final ValueSetter<String> onKeyPressed;
  final String value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onKeyPressed(value);
      },
      child: Center(
        child: Text(
          "$value",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.black),
        ),
      ),
    );
  }
}
