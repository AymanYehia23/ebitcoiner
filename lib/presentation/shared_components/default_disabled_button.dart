import 'package:flutter/material.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class DefaultDisabledButton extends StatelessWidget {
  final Widget text;
  const DefaultDisabledButton({Key? key, required this.text})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Container(
      height: s.h(56.0),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            s.h(56.0),
          ),
        ),
        color: const Color(0xff302c3f),
      ),
      child: text
    );
  }
}
