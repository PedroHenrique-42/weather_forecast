import 'package:flutter/material.dart';

class ShowSnackBar {
  static const String alertDialogTitle = "Ocorreu um problema!";

  static show(BuildContext context, String content) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1500),
        showCloseIcon: true,
        closeIconColor: Colors.white,
        backgroundColor: Colors.grey,
        content: Text(
          content,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
