import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
          context.select((HashRateCubit h) => h.isTotalExpanded) ? 40.h : 17.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1d1a27),
        border: Border.all(
          color: Colors.white,
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
              SvgPicture.asset(
                Strings.btcIcon,
                height: (4.h),
                width: (4.w),
              ),
              SizedBox(
                width: 2.w,
              ),
              SvgPicture.asset(
                Strings.ethIcon,
                height: (4.h),
                width: (4.w),
              ),
              SizedBox(
                width: 2.w,
              ),
              SvgPicture.asset(
                Strings.ltctIcon,
                height: (4.5.h),
                width: (5.w),
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
                    color: const Color(0xff302c3f),
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
                ? 20.h
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
                      SvgPicture.asset(
                        Strings.btcIcon,
                        height: (3.h),
                        width: (3.w),
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
                                    color: const Color(0xffff4980),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '${context.watch<HashRateCubit>().totalBTCPower} TH/S',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11.sp,
                            ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Strings.ethIcon,
                        height: (3.h),
                        width: (3.w),
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
                                    color: const Color(0xffff4980),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '${context.watch<HashRateCubit>().totalETHPower} MH/S',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11.sp,
                            ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Strings.ltctIcon,
                        height: (3.5.h),
                        width: (3.5.w),
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
                                    color: const Color(0xffff4980),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '${context.watch<HashRateCubit>().totalLTCTPower} MH/S',
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
