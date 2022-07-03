import 'package:flutter/material.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/presentation/shared_components/default_disabled_button.dart';
import 'package:ebitcoiner/presentation/shared_components/default_gradient_button.dart';
import 'package:sizer/sizer.dart';

import 'choose_miner_payment_currency.dart';

class BuyMiningDeviceWidget extends StatelessWidget {
  final String asicId;
  final String yourMinerPic;
  final String yourMinerName;
  final String currencyIcon;
  final String currencyName;
  final String algorithm;
  final String power;
  final String unitPrice;
  final String maintenancePrice;
  final bool availability;

  const BuyMiningDeviceWidget({
    Key? key,
    required this.asicId,
    required this.yourMinerPic,
    required this.yourMinerName,
    required this.currencyIcon,
    required this.currencyName,
    required this.algorithm,
    required this.power,
    required this.unitPrice,
    required this.maintenancePrice,
    required this.availability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 52.h,
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
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 1.h,
                        ),
                        child: Row(
                          children: [
                            Image(
                              height: 7.h,
                              width: 7.h,
                              image: AssetImage(yourMinerPic),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Center(
                              child: Text(
                                yourMinerName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
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
                                    currencyIcon,
                                    height: 6.w,
                                    width: 6.w,
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
                                          fontSize: 12.sp,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Algorithm',
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
                              Text(
                                algorithm,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 12.sp,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
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
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                power,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 12.sp,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: ColorManager.gray,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 1.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Unit Price',
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
                                  Text(
                                    unitPrice,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Host Fees',
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
                                  Text(
                                    maintenancePrice,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: 1.h,
                      ),
                      availability
                          ? Expanded(
                              child: DefaultGradientButton(
                                isFilled: true,
                                text: Text(
                                  'Buy Device',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        ChooseMinerPaymentCurrency(
                                      asicId: asicId,
                                    ),
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: DefaultDisabledButton(
                                text: Text(
                                  'Buy Device',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
