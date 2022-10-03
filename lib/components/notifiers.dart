import 'package:flutter/material.dart';

class Notifiers {
  static void showSnackBarScaffoldLock(
      String content, GlobalKey<ScaffoldMessengerState> scaffoldKey) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(content)));
  }

  static void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          content,
          style: const TextStyle(color: Colors.redAccent),
        )));
  }
}
