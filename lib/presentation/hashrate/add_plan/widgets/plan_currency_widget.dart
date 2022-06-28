import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/core/constants/enums.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/cubit/plan_contract/plan_contract_cubit.dart';
import '/core/constants/strings.dart';

class PlanCurrencyWidget extends StatelessWidget {
  const PlanCurrencyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: (4.w), vertical: 1.h),
      width: double.infinity,
      height: (6.h),
      color: ColorManager.primary,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  context.read<PlanContractCubit>().chooseCurrency(Currency.btc);
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                    color: context.watch<PlanContractCubit>().cryptoName == 'BTC'
                        ? ColorManager.darkPurple
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Strings.btcIcon,
                         width: (6.w),
                        height: (3.5.h),
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
                  context.read<PlanContractCubit>().chooseCurrency(Currency.eth);
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                     color: context.watch<PlanContractCubit>().cryptoName == 'ETH'
                        ? ColorManager.darkPurple
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Strings.ethIcon,
                       width: (6.w),
                        height: (3.5.h),
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
                  context.read<PlanContractCubit>().chooseCurrency(Currency.rvn);
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                    color: context.watch<PlanContractCubit>().cryptoName == 'RVN'
                        ? ColorManager.darkPurple
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Strings.rvnIcon,
                        width: (6.w),
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
               InkWell(
                onTap: () {
                  context.read<PlanContractCubit>().chooseCurrency(Currency.ltct);
                },
                child: Container(
                  width: (20.w),
                  height: (4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                    color: context.watch<PlanContractCubit>().cryptoName == 'LTCT'
                        ? ColorManager.darkPurple
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
