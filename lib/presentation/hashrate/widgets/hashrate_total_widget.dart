import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/colors.dart';
import 'package:hash_store/logic/cubit/hash_rate/hash_rate_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/strings.dart';

class HashrateTotalWidget extends StatelessWidget {
  const HashrateTotalWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 2.w,
      ),
      height:
          context.select((HashRateCubit h) => h.isTotalExpanded) ? 34.h : 17.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        border: Border.all(
          color: ColorManager.white,
        ),
        borderRadius: BorderRadius.circular((8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Strings.miningIcon,
                width: (4.w),
                height: (3.h),
              ),
              SizedBox(
                width: 2.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Active Hashrate Power',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Builder(builder: (context) {
                    return Text(
                      '${context.watch<HashRateCubit>().totalPower.toStringAsFixed(2)} GH/S',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    );
                  })
                ],
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Image.asset(
                Strings.btcIcon,
                height: (4.5.h),
                width: (8.w),
              ),
              SizedBox(
                width: 2.w,
              ),
              Image.asset(
                Strings.ethIcon,
                height: (4.5.h),
                width: (8.w),
              ),
              SizedBox(
                width: 2.w,
              ),
              Image.asset(
                Strings.rvnIcon,
                height: (4.5.h),
                width: (8.w),
              ),
              SizedBox(
                width: 2.w,
              ),
              Image.asset(
                Strings.ltctIcon,
                height: (4.5.h),
                width: (8.w),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  context.read<HashRateCubit>().changeTotalSize();
                },
                child: Container(
                  width: (8.w),
                  height: (8.w),
                  decoration: BoxDecoration(
                    color: ColorManager.darkPurple,
                    borderRadius: BorderRadius.circular(
                      (32),
                    ),
                  ),
                  child: SvgPicture.asset(
                    context.read<HashRateCubit>().expandedTotalIcon,
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: context.select((HashRateCubit h) => h.isTotalExpanded)
                ? 17.h
                : 0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Strings.btcIcon,
                        height: (3.h),
                        width: (6.w),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BTC (Bitcoin)',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          if (context.read<HashRateCubit>().btcActivePlans > 0)
                            Text(
                              '${context.read<HashRateCubit>().btcActivePlans} active plan',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: ColorManager.secondary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '${context.watch<HashRateCubit>().totalBTCPower} GH/S',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11.sp,
                            ),
                      ),
                    ],
                  ),
                  const Divider(color: ColorManager.gray),
                  Row(
                    children: [
                      Image.asset(
                        Strings.ethIcon,
                        height: (3.h),
                        width: (6.w),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ETH (Ethereum)',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          if (context.read<HashRateCubit>().ethActivePlans > 0)
                            Text(
                              '${context.read<HashRateCubit>().ethActivePlans} active plan',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: ColorManager.secondary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '${context.watch<HashRateCubit>().totalETHPower} GH/S',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11.sp,
                            ),
                      ),
                    ],
                  ),
                  const Divider(color: ColorManager.gray),
                  Row(
                    children: [
                      Image.asset(
                        Strings.rvnIcon,
                        height: (3.h),
                        width: (6.w),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'RVN',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          if (context.read<HashRateCubit>().rvnActivePlans > 0)
                            Text(
                              '${context.read<HashRateCubit>().rvnActivePlans} active plan',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: ColorManager.secondary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '${context.watch<HashRateCubit>().totalRVNPower} GH/S',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11.sp,
                            ),
                      ),
                    ],
                  ),
                  const Divider(color: ColorManager.gray),
                  Row(
                    children: [
                      Image.asset(
                        Strings.ltctIcon,
                        height: (3.h),
                        width: (6.w),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LTCT',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          if (context.read<HashRateCubit>().ltctActivePlans > 0)
                            Text(
                              '${context.read<HashRateCubit>().ltctActivePlans} active plan',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: ColorManager.secondary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '${context.watch<HashRateCubit>().totalLTCTPower} GH/S',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11.sp,
                            ),
                      ),
                    ],
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
