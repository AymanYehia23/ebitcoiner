import 'package:flutter/widgets.dart';

class Sizer {
  BuildContext context;
  Sizer({
    required this.context,
  });

  double h(
    double n,
  ) {
    return (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top) *
        (n / 812);
  }

  double w(
    double n,
  ) {
    return MediaQuery.of(context).size.width * (n / 375);
  }
}
