import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import '../sizer/sizer.dart';

class DefaultGradientButton extends StatelessWidget {
  final bool isFilled;
  final Widget text;
  final Function onPressed;
  const DefaultGradientButton({
    Key? key,
    required this.isFilled,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return isFilled
        ? Container(
            height: s.h(56.0),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  s.h(56.0),
                ),
              ),
              gradient: const LinearGradient(
                colors: [
                  Color(0xffff4980),
                  Color(0xff4f56ff),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: TextButton(
              child:text,
              onPressed: onPressed(),
            ),
          )
        : SizedBox(
            width: double.infinity,
            height: s.h(56.0),
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
              onTap: onPressed(),
              radius: Radius.circular(s.h(56.0)),
            ),
          );
  }
}