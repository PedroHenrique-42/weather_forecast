import 'package:flutter/material.dart';

class ShowDialog {
  static const String alertDialogTitle = "Ocorreu um problema!";

  static show(BuildContext context, Object error) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(alertDialogTitle),
        content: Text(error.toString()),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.red),
          )
        ],
      ),
    );
  }
}
