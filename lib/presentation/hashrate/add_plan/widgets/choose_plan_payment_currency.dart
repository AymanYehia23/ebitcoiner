import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/presentation/shared_components/default_gradient_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/cubit/plan_contract/plan_contract_cubit.dart';
import '/core/constants/enums.dart';
import '/core/constants/strings.dart';

class ChoosePlanPaymentCurrency extends StatelessWidget {
  const ChoosePlanPaymentCurrency({Key? key, required this.planId})
      : super(key: key);
  final String planId;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      color: ColorManager.lightBlack,
      height: 25.h,
      child: Column(
        children: [
          Text(
            'Choose the payment currency',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(
            width: double.infinity,
            height: (6.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<PlanContractCubit>()
                            .choosePaymentCurrency(Currency.btc);
                      },
                      child: Container(
                        width: (20.w),
                        height: (4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((20)),
                          color: context
                                      .watch<PlanContractCubit>()
                                      .paymentCurrency ==
                                  'BTC'
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
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
                        context
                            .read<PlanContractCubit>()
                            .choosePaymentCurrency(Currency.eth);
                      },
                      child: Container(
                        width: (20.w),
                        height: (4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((20)),
                          color: context
                                      .watch<PlanContractCubit>()
                                      .paymentCurrency ==
                                  'ETH'
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
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
                        context
                            .read<PlanContractCubit>()
                            .choosePaymentCurrency(Currency.rvn);
                      },
                      child: Container(
                        width: (20.w),
                        height: (4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((20)),
                          color: context
                                      .watch<PlanContractCubit>()
                                      .paymentCurrency ==
                                  'RVN'
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: DefaultGradientButton(
              isFilled: false,
              text: Text(
                'Buy now',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: (12.sp),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onPressed: () async {
                await context.read<PlanContractCubit>().addPlanContract(planId);
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
