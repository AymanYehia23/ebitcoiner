import 'package:flutter/material.dart';

import '../../sizer/sizer.dart';
import 'assets_total_widget.dart';

class AssetsHeaderWidget extends StatelessWidget {
  const AssetsHeaderWidget({
    Key? key,
    required this.s,
  }) : super(key: key);

  final Sizer s;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: s.h(470.0),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xffff4980).withOpacity(0.2),
            const Color(0xff4f56ff).withOpacity(0.2)
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          stops: const [0, 1],
          transform: const GradientRotation(-225),
        ),
        borderRadius: BorderRadius.circular(s.h(2160)),
        backgroundBlendMode: BlendMode.overlay,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: s.w(16.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: s.h(60.0),
            ),
            Text(
              'Hello, Ahmed 👋',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: s.w(17),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: s.h(8.0),
            ),
            Text(
              'Available Balance',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: s.w(28),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: s.w(12),
            ),
            AssetsTotalWidget(s: s),
          ],
        ),
      ),
    );
  }
}
