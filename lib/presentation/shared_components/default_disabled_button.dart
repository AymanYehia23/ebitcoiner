import 'package:flutter/material.dart';
import 'package:hash_store/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultDisabledButton extends StatelessWidget {
  final Widget text;
  final double? height;
  const DefaultDisabledButton({Key? key, required this.text,this.height})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 8.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              (56.0),
            ),
          ),
          color: ColorManager.darkPurple,
        ),
        child: text);
  }
}
