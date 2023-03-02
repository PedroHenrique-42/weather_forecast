import 'package:flutter/material.dart';

class ShowSnackBar {
  static show(BuildContext context, String content) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1500),
        showCloseIcon: true,
        closeIconColor: Colors.white,
        backgroundColor: Colors.red,
        content: Text(
          content,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
