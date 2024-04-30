import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/presentation/shared_components/default_gradient_button.dart';
import 'package:sizer/sizer.dart';

import '../../router/app_router.dart';

class MinersGainsWidget extends StatelessWidget {
  const MinersGainsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (46.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            ColorManager.purple,
            ColorManager.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorManager.purple.withOpacity(0.4),
            blurRadius: (20),
          ),
          BoxShadow(
            color: ColorManager.secondary.withOpacity(0.4),
            blurRadius: (20),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular((8)),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  ColorManager.backGround,
                  ColorManager.darkPurple,
                  ColorManager.backGround,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(280),
              ),
              borderRadius: BorderRadius.circular((8)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: (4.w)),
              child: Column(
                children: [
                  SizedBox(
                    height: (5.h),
                  ),
                  Center(
                    child: SvgPicture.asset(
                      Strings.eliteMinersImage,
                      width: (26.w),
                      height: (13.h),
                    ),
                  ),
                  SizedBox(
                    height: (2.h),
                  ),
                  Text(
                    'Boost Your Hashrate With Private Mining Devices',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: (16.sp),
                          fontWeight: FontWeight.bold,
                          letterSpacing: (0.6),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: (1.h),
                  ),
                  Text(
                    'Up to 10 TH/s',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: (15.sp),
                          fontWeight: FontWeight.bold,
                          color: ColorManager.secondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: (3.h),
                  ),
                  DefaultGradientButton(
                    isFilled: false,
                    text: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'See mining devices',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: (13.sp),
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: (1.w),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: (3.h),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AppRouter.buyMiningDevice);
                    },
                  ),
                  SizedBox(
                    height: 0.2.h,
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
