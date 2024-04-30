import 'package:flutter/material.dart';
import 'package:ebitcoiner/core/constants/colors.dart';

import 'loading_widget.dart';

Future loadingDialog({required BuildContext context}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return const PopScope(
        canPop: false,
        child: Dialog(
          child: LoadingWidget(),
          backgroundColor: ColorManager.transparent,
        ),
      );
    },
  );
}
