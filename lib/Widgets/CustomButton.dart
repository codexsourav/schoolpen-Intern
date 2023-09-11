import 'package:flutter/material.dart';
import 'package:schoolpen/constents/Colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? title;
  void Function()? onClick;
  bool? disable;
  Color? color;
  double? height;

  CustomButton(
      {super.key,
      this.title,
      this.onClick,
      this.disable = false,
      this.color,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height ?? 60,
        decoration: BoxDecoration(
            color: color ?? AppColors.brand,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            title ?? "Click Me",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
