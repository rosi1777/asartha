import 'package:flutter/material.dart';

class CustomSnackbar {
  void showSnackbar(String message, BuildContext context) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
