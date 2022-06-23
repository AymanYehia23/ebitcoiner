import 'package:flutter/material.dart';
import 'package:hash_store/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class GradientBackgroundContainer extends StatelessWidget {
  final Widget? child;

  const GradientBackgroundContainer({
    Key? key,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: ColorManager.backGround,
          ),
          Container(
            margin: EdgeInsets.only(right: 4.w),
            height: 30.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.secondary.withOpacity(0.2),
                  ColorManager.purple.withOpacity(0.2)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 1],
                transform: const GradientRotation(-225),
              ),
              borderRadius: BorderRadius.circular((2160)),
              backgroundBlendMode: BlendMode.overlay,
              color: ColorManager.backGround,
            ),
          ),
        ],
      ),
    );
  }
}
