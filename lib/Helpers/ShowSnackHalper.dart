import 'package:flutter/material.dart';

void showMySnack(context, {String? mesage, Color? color}) {
  final scaffold = ScaffoldMessenger.of(context);

  scaffold.showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(mesage ?? "Alert Message"),
      duration: Duration(seconds: 3), // Adjust the duration as needed
      showCloseIcon: true,
      closeIconColor: Colors.white,
    ),
  );
}
