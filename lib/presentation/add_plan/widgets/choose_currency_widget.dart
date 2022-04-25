import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/logic/cubit/plans/plans_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/strings.dart';

class ChooseCurrencyWidget extends StatelessWidget {
  const ChooseCurrencyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: (4.w), vertical: 1.h),
      width: double.infinity,
      height: (6.h),
      color: const Color(0xff1d1a27),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  context.read<PlansCubit>().chooseCurrency(Currency.btc);
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                    color: context.watch<PlansCubit>().cryptoName == 'BTC'
                        ? const Color(0xff302c3f)
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Strings.btcIcon,
                        width: (3.w),
                        height: (3.h),
                      ),
                      SizedBox(
                        width: (1.w),
                      ),
                      Text(
                        'BTC',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: (12.sp),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<PlansCubit>().chooseCurrency(Currency.eth);
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                     color: context.watch<PlansCubit>().cryptoName == 'ETH'
                        ? const Color(0xff302c3f)
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Strings.ethIcon,
                       width: (3.w),
                        height: (3.h),
                      ),
                      SizedBox(
                        width: (1.w),
                      ),
                      Text(
                        'ETH',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: (12.sp),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: ()  {
                  context.read<PlansCubit>().chooseCurrency(Currency.rvn);
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                    color: context.watch<PlansCubit>().cryptoName == 'RVN'
                        ? const Color(0xff302c3f)
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Strings.rvnIcon,
                       width: (3.w),
                        height: (3.h),
                      ),
                      SizedBox(
                        width: (1.w),
                      ),
                      Text(
                        'RVN',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: (12.sp),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
               InkWell(
                onTap: () {
                  context.read<PlansCubit>().chooseCurrency(Currency.ltct);
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                    color: context.watch<PlansCubit>().cryptoName == 'LTCT'
                        ? const Color(0xff302c3f)
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Strings.ltctIcon,
                        width: (6.w),
                        height: (3.5.h),
                      ),
                      SizedBox(
                        width: (1.w),
                      ),
                      Text(
                        'LTCT',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: (12.sp),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
