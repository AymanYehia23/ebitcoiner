import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:sizer/sizer.dart';

class DefaultGradientButton extends StatelessWidget {
  final bool isFilled;
  final Widget text;
  final Function onPressed;
  final double? hight;
  final double? radius;
  const DefaultGradientButton(
      {Key? key,
      required this.isFilled,
      required this.text,
      required this.onPressed,
      this.hight,
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
                height: hight ?? 6.8.h,
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
                      Color(0xffff4980),
                      Color(0xff4f56ff),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: text),
          )
        : SizedBox(
            width: double.infinity,
            height:6.8.h,
            child: OutlineGradientButton(
              gradient: const LinearGradient(
                colors: [
                  Color(0xffff4980),
                  Color(0xff4f56ff),
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
