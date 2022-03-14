import 'package:flutter/material.dart';

import '../../sizer/sizer.dart';

class AssetsHeaderWidget extends StatelessWidget {
  const AssetsHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, Ahmed 👋',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: s.h(19),
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: s.h(8.0),
        ),
        Text(
          'Available Balance',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: s.h(30),
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
