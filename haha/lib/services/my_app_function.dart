import 'package:flutter/material.dart';

class MyAppFunction {
  static Future<void> showErrorOrWarningDialog({
    required BuildContext context,
    required String subtitle,
    bool isError = true,
    required Function fct,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isError ? 'Error' : 'Warning'),
          content: Text(subtitle),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                fct(); // Call the function passed as a parameter
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
