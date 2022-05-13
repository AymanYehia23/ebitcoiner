import 'package:flutter/material.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
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
            color: const Color(0xff1d1a27),
            border: Border.all(
              color: const Color(0xff302C3F),
            ),
            borderRadius: BorderRadius.circular((8.0)),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 1.h,
                ),
                height: 9.h,
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
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 14.h,
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
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 12.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Algorithm',
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
                            algorithm,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12.sp,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 7.5.h,
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
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            power,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12.sp,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              Container(
                height: 18.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 1.h,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 8.h,
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
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 8.h,
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
                        ),
                      ],
                    ),
                    availability
                        ? DefaultGradientButton(
                            height: 8.h,
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
                          )
                        : DefaultDisabledButton(
                            height: 8.h,
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
                          )
                  ],
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
