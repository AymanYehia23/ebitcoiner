import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future defaultToast({
  required String text,
  bool isError = false,
}) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: isError ? Colors.red : Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
