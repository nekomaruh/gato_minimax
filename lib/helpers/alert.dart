import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAlert(BuildContext context, String title, String message) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Platform.isIOS
          ? CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          MaterialButton(
              child: Text('Ok'), onPressed: () => Navigator.pop(context))
        ],
      )
          : AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoButton(
              child: Text('Ok'), onPressed: () => Navigator.pop(context))
        ],
      ));
}
