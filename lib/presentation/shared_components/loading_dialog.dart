import 'package:flutter/material.dart';
import 'package:hash_store/core/constants/colors.dart';

import 'loading_widget.dart';

Future loadingDialog({required BuildContext context}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: const Dialog(
          child: LoadingWidget(),
          backgroundColor: ColorManager.transparent,
        ),
      );
    },
  );
}
