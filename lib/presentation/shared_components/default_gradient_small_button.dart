import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultGradientSmallButton extends StatelessWidget {
  final Function onPressed;
  const DefaultGradientSmallButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 6.8.h,
        width: 50.w,
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
        child: Text(
          'Buy Plan',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
