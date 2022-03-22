import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class MinersGainsWidget extends StatelessWidget {
  const MinersGainsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Container(
      height: s.h(352),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff4f56ff),
            Color(0xffff4980),
          ],
        ),
        borderRadius: BorderRadius.circular(s.h(12)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff4f56ff).withOpacity(0.4),
            blurRadius: s.h(20),
          ),
          BoxShadow(
            color: const Color(0xffff4980).withOpacity(0.4),
            blurRadius: s.h(20),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(s.h(5)),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0xff1d1a27),
            borderRadius: BorderRadius.circular(s.h(8)),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0x00302c3f),
                  Color(0xff302c3f),
                  Color(0x00302c3f),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(280),
              ),
              borderRadius: BorderRadius.circular(s.h(8)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: s.w(17)),
              child: Column(
                children: [
                  SizedBox(
                    height: s.h(40),
                  ),
                  Center(
                    child: SvgPicture.asset(
                      Strings.mainersImage,
                      width: s.h(106),
                      height: s.h(106),
                    ),
                  ),
                  SizedBox(
                    height: s.h(12),
                  ),
                  Text(
                    'Boost Your Hashrate With Private Mining Devices',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(22),
                          fontWeight: FontWeight.bold,
                          letterSpacing: s.h(0.6),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: s.h(8),
                  ),
                  Text(
                    'Up to 10 TH/s',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(20),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffff4980),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: s.h(24),
                  ),
                  DefaultGradientButton(
                    isFilled: false,
                    text: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'See mining devices',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: s.h(19),
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: s.w(4),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: s.h(20),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
