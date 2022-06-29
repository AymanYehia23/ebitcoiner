import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/presentation/shared_components/default_disabled_button.dart';
import 'package:sizer/sizer.dart';

import '../../../shared_components/default_gradient_button.dart';
import 'choose_plan_payment_currency.dart';

class BuyPlanWidget extends StatelessWidget {
  final String planId;
  final String price;
  final String minersPic;
  final String text;
  final String currencyIcn;
  final String currencyName;
  final String power;
  final String planDuration;
  final String profitability;
  final bool availability;
  const BuyPlanWidget({
    Key? key,
    required this.planId,
    required this.price,
    required this.minersPic,
    required this.text,
    required this.currencyIcn,
    required this.currencyName,
    required this.power,
    required this.planDuration,
    required this.profitability,
    required this.availability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 41.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.primary,
            border: Border.all(
              color: ColorManager.darkPurple,
            ),
            borderRadius: BorderRadius.circular((8.0)),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      minersPic,
                      height: 12.h,
                      width: 17.w,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      text,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Mining Currency',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  currencyIcn,
                                  height: 5.w,
                                  width: 5.w,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  currencyName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 13.sp,
                                      ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Power',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              power,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.sp,
                                  ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Plan Duration',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              planDuration,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.sp,
                                  ),
                            ),
                          ]),
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Profitability',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              profitability,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.sp,
                                  ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style:
                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              price,
                              style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: availability
                            ? DefaultGradientButton(
                                isFilled: true,
                                height: 6.8.h,
                                text: Text(
                                  'Buy Plan',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        ChoosePlanPaymentCurrency(planId: planId),
                                  );
                                },
                              )
                            : DefaultDisabledButton(
                                height: 6.8.h,
                                text: Text(
                                  'Buy Plan',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
