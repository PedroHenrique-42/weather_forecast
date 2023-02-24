import 'package:flutter/material.dart';

class ShowSnackBar {
  static const String alertDialogTitle = "Ocorreu um problema!";

  static show(BuildContext context, String content) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        closeIconColor: Colors.white,
        backgroundColor: Colors.red,
        content: Text(
          content,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
