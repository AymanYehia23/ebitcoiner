import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:sizer/sizer.dart';

import '../../shared_components/default_gradient_button.dart';
import 'choose_plan_payment_currency.dart';

class ChooseDesiredPlanWidget extends StatelessWidget {
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
  const ChooseDesiredPlanWidget({
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
            color: const Color(0xff1d1a27),
            border: Border.all(
              color: const Color(0xff302C3F),
            ),
            borderRadius: BorderRadius.circular((8.0)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 9.h,
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
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mining Currency',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
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
                              SvgPicture.asset(
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
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            power,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 13.sp,
                                    ),
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Plan Duration',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            planDuration,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
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
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            profitability,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 13.sp,
                                    ),
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              const Divider(),
              SizedBox(
                height: 2.h,
              ),
              Padding(
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
            ],
          ),
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
