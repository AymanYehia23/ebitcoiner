import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/strings.dart';
import '../../../../logic/cubit/deposit/deposit_cubit.dart';

class ChooseDepositCurrencyWidget extends StatelessWidget {
  const ChooseDepositCurrencyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (6.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () async {
                  context
                      .read<DepositCubit>()
                      .choosePaymentCurrency(Currency.btc);
                  await context.read<DepositCubit>().getDepositAddress();
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                    color:
                        context.watch<DepositCubit>().depositCurrency == 'BTC'
                            ? ColorManager.darkPurple
                            : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Strings.btcIcon,
                        width: (6.w),
                        height: (6.h),
                      ),
                      SizedBox(
                        width: (1.w),
                      ),
                      Text(
                        'BTC',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                      .read<DepositCubit>()
                      .choosePaymentCurrency(Currency.eth);
                  await context.read<DepositCubit>().getDepositAddress();
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                    color:
                        context.watch<DepositCubit>().depositCurrency == 'ETH'
                            ? ColorManager.darkPurple
                            : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Strings.ethIcon,
                        width: (6.w),
                        height: (6.h),
                      ),
                      SizedBox(
                        width: (1.w),
                      ),
                      Text(
                        'ETH',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                      .read<DepositCubit>()
                      .choosePaymentCurrency(Currency.rvn);
                  await context.read<DepositCubit>().getDepositAddress();
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                    color:
                        context.watch<DepositCubit>().depositCurrency == 'RVN'
                            ? ColorManager.darkPurple
                            : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Strings.rvnIcon,
                        width: (6.w),
                        height: (6.h),
                      ),
                      SizedBox(
                        width: (1.w),
                      ),
                      Text(
                        'RVN',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                      .read<DepositCubit>()
                      .choosePaymentCurrency(Currency.ltct);
                  await context.read<DepositCubit>().getDepositAddress();
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                    color:
                        context.watch<DepositCubit>().depositCurrency == 'LTCT'
                            ? ColorManager.darkPurple
                            : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Strings.ltctIcon,
                        width: (6.w),
                        height: (6.h),
                      ),
                      SizedBox(
                        width: (1.w),
                      ),
                      Text(
                        'LTCT',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
