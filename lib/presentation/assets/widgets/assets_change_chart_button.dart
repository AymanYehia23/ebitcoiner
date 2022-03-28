import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/logic/cubit/assets/assets_cubit.dart';
import 'package:sizer/sizer.dart';

class AssetsChangeChartButton extends StatelessWidget {
  const AssetsChangeChartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: (4.w)),
      width: double.infinity,
      height: (9.h),
      color: const Color(0xff1d1a27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              context.read<AssetsCubit>().getChartData(Currency.btc);
            },
            child: Container(
              width: (20.w),
              height: (4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((20)),
                color: context.watch<AssetsCubit>().currency == Currency.btc
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
              context.read<AssetsCubit>().getChartData(Currency.eth);
            },
            child: Container(
             width: (20.w),
              height: (4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((20)),
                color: context.watch<AssetsCubit>().currency == Currency.eth
                    ? const Color(0xff302c3f)
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Strings.ethIcon,
                    width: (24),
                    height: (24),
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
            onTap: () {
              context.read<AssetsCubit>().getChartData(Currency.rvn);
            },
            child: Container(
             width: (20.w),
              height: (4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((20)),
                color: context.watch<AssetsCubit>().currency == Currency.rvn
                    ? const Color(0xff302c3f)
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Strings.rvnIcon,
                    width: (3.5.w),
                    height: (3.5.h),
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
        ],
      ),
    );
  }
}
