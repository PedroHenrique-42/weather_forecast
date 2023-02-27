import 'package:flutter/material.dart';

class ShowDialog {
  static const String alertDialogTitle = "Ocorreu um problema";

  static show(BuildContext context, String content) {
    return showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
          alertDialogTitle,
          textAlign: TextAlign.center,
          style: Theme.of(dialogContext).textTheme.headlineMedium,
        ),
        content: Text(content, textAlign: TextAlign.center),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(dialogContext),
            icon: const Icon(Icons.close, color: Colors.red),
          )
        ],
      ),
    );
  }
}
