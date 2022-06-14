import 'package:flutter/material.dart';
import 'package:nonzero/services/routes.dart';

class ConfirmationDialog {
  static Future<bool?> show({
    required String message,
    VoidCallback? callback,
  }) {
    return showDialog(
      context: Routes.context(),
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: Routes.pop,
              child: Text('Cancel'.toUpperCase()),
            ),
            TextButton(
              onPressed: () {
                Routes.pop(true);
                callback?.call();
              },
              child: Text('Ok'.toUpperCase()),
            ),
          ],
        );
      },
    );
  }
}
