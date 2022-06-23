import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hash_store/core/constants/colors.dart';
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
        isError ? ColorManager.red : ColorManager.green,
    textColor: ColorManager.white,
    fontSize: 10.sp,
  );
}
