import 'package:flutter/material.dart';

class ShowDialog {
  static const String alertDialogTitle = "Local não encontrado";

  static show(BuildContext context, String content) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          alertDialogTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        content: Text(content, textAlign: TextAlign.center),
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
