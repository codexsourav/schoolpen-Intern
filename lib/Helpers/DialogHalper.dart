import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, {required AlertDialog dialog}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}
