import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

Future defaultToast({
  required String text,
  bool isError = false,
}) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
    msg: text,
    toastLength: isError ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor:
        isError ? const Color(0xffcc3300) : const Color(0xff339900),
    textColor: Colors.white,
    fontSize: 10.sp,
  );
}
