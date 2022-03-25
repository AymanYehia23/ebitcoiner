import 'package:flutter/material.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class DefaultGradientSmallButton extends StatelessWidget {
  final Function onPressed;
  const DefaultGradientSmallButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: s.h(56.0),
        width: s.w(155.5),
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
        child: Text(
          'Buy Plan',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: s.h(17.0),
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
