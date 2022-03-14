import 'package:flutter/material.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class GradientBackgroundContainer extends StatelessWidget {
  final Widget? child;

  const GradientBackgroundContainer({
    Key? key,
    this.child,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xff13111a),
          ),
          Container(
            margin: EdgeInsets.only(right: s.w(16.0)),
            height: s.h(218),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xffff4980).withOpacity(0.2),
                  const Color(0xff4f56ff).withOpacity(0.2)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 1],
                transform: const GradientRotation(-225),
              ),
              borderRadius: BorderRadius.circular(s.h(2160)),
              backgroundBlendMode: BlendMode.overlay,
              color:  const Color(0xff13111a),
            ),
          ),
        ],
      ),
    );
  }
}
