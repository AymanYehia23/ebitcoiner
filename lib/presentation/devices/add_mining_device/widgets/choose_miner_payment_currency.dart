import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/strings.dart';
import '../../../../logic/cubit/asic_contract/asic_contract_cubit.dart';
import '../../../shared_components/default_gradient_button.dart';

class ChooseMinerPaymentCurrency extends StatelessWidget {
  const ChooseMinerPaymentCurrency({Key? key, required this.asicId})
      : super(key: key);
  final String asicId;
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
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                            .read<AsicContractCubit>()
                            .choosePaymentCurrency(Currency.btc);
                      },
                      child: Container(
                        width: (20.w),
                        height: (4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((20)),
                          color: context
                                      .watch<AsicContractCubit>()
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
                                  .bodyText1!
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
                            .read<AsicContractCubit>()
                            .choosePaymentCurrency(Currency.eth);
                      },
                      child: Container(
                        width: (20.w),
                        height: (4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((20)),
                          color: context
                                      .watch<AsicContractCubit>()
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
                                  .bodyText1!
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
                            .read<AsicContractCubit>()
                            .choosePaymentCurrency(Currency.rvn);
                      },
                      child: Container(
                        width: (20.w),
                        height: (4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((20)),
                          color: context
                                      .watch<AsicContractCubit>()
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
                                  .bodyText1!
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
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: (12.sp),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onPressed: () async {
                await context.read<AsicContractCubit>().addAsicContract(asicId);
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
