import 'package:flutter/material.dart';

class NotificationDialog {
  static void show(
      BuildContext context, {
        required String title,
        required String message,
        required bool isSuccess,
      }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            color: isSuccess ? Colors.green : Colors.red,
          ),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
