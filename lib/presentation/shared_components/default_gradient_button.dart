import 'package:flutter/material.dart';
import 'package:hash_store/core/constants/colors.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:sizer/sizer.dart';

class DefaultGradientButton extends StatelessWidget {
  final bool isFilled;
  final Widget text;
  final Function onPressed;
  final double? height;
  final double? radius;
  const DefaultGradientButton(
      {Key? key,
      required this.isFilled,
      required this.text,
      required this.onPressed,
      this.height,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFilled
        ? InkWell(
            onTap: () {
              onPressed();
            },
            child: Container(
                height: height ?? 8.h,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      (56.0),
                    ),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      ColorManager.secondary,
                      ColorManager.purple,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: text),
          )
        : SizedBox(
            width: double.infinity,
            height: height ?? 8.h,
            child: OutlineGradientButton(
              gradient: const LinearGradient(
                colors: [
                  ColorManager.secondary,
                  ColorManager.purple,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              strokeWidth: 1,
              child: Center(
                child: text,
              ),
              onTap: () {
                onPressed();
              },
              radius: Radius.circular(radius ?? (56.0)),
            ),
          );
  }
}
