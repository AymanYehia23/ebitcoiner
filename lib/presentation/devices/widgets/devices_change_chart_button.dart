import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/logic/cubit/devices/devices_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/enums.dart';
import '../../../core/constants/strings.dart';

class DevicesChangeChartButton extends StatelessWidget {
  const DevicesChangeChartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: (4.w), vertical: 1.h),
      width: double.infinity,
      height: (12.h),
      color: const Color(0xff1d1a27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              context.read<DevicesCubit>().changeChartButton(Currency.btc);
            },
            child: Container(
              width: (20.w),
              height: (4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((20)),
                color:
                    context.watch<DevicesCubit>().currency == Currency.btc
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
                    style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
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
              context.read<DevicesCubit>().changeChartButton(Currency.eth);
            },
            child: Container(
              width: (20.w),
              height: (4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((20)),
                color:
                    context.watch<DevicesCubit>().currency == Currency.eth
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
                    style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: (12.sp),
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              context
                  .read<DevicesCubit>()
                  .changeChartButton(Currency.rvn);
            },
            child: Container(
              width: (20.w),
              height: (4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((20)),
                color:
                    context.watch<DevicesCubit>().currency == Currency.rvn
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
                    style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: (12.sp),
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              context.read<DevicesCubit>().changeChartButton(Currency.ltct);
            },
            child: Container(
              width: (20.w),
              height: (4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((20)),
                color: context.watch<DevicesCubit>().currency == Currency.ltct
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
    );
  }
}