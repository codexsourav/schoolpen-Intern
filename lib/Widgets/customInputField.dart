import 'package:flutter/material.dart';
import 'package:schoolpen/constents/Colors.dart';

// ignore: must_be_immutable
class CustomInputField extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  Widget? suffixIcon;
  String? Function(String?)? validate;
  void Function()? ontap;

  bool? obscureText;
  bool enabled;

  TextInputType? keyboardType;

  CustomInputField(
      {super.key,
      this.controller,
      this.hint,
      this.suffixIcon,
      this.validate,
      this.ontap,
      this.enabled = true,
      this.keyboardType = TextInputType.text,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      keyboardType: keyboardType,
      cursorColor: AppColors.brand,
      onTap: ontap,
      enabled: enabled,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.inputBgColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.brand,
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.darkGray,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      validator: validate,
    );
  }
}
