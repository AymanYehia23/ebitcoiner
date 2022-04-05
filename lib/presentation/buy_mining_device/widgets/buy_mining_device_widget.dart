import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/buy_mining_device/widgets/pay_for_buy_device_widget.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:sizer/sizer.dart';

class BuyMiningDeviceWidget extends StatefulWidget {
  final String yourMinerPic;
  final String yourMinerName;
  final String currencyIcn1;
  final String currencyName1;
  final String currencyIcn2;
  final String currencyName2;
  final String algorithm;
  final String profitability;
  final String power;
  final String unitPrice;
  final String maintenancePrice;

  const BuyMiningDeviceWidget({
    Key? key,
    required this.yourMinerPic,
    required this.yourMinerName,
    required this.currencyIcn1,
    required this.currencyIcn2,
    required this.currencyName1,
    required this.currencyName2,
    required this.algorithm,
    required this.profitability,
    required this.power,
    required this.unitPrice,
    required this.maintenancePrice,
  }) : super(key: key);

  @override
  State<BuyMiningDeviceWidget> createState() => _BuyMiningDeviceWidgetState();
}

class _BuyMiningDeviceWidgetState extends State<BuyMiningDeviceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1d1a27),
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular((8.0)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 4.w, top: 2.h),
            height: 9.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  widget.yourMinerPic,
                  height: 7.h,
                  width: 7.h,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  widget.yourMinerName,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
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
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
                            widget.currencyIcn1,
                            height: 6.w,
                            width: 6.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            widget.currencyName1,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12.sp,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            widget.currencyIcn2,
                            height: 6.w,
                            width: 6.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            widget.currencyName2,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
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
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        widget.algorithm,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        widget.power,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 7.5.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Profitability',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        widget.profitability,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
            color: Colors.white,
          ),
          SizedBox(
            height: 18.h,
            child: Column(children: [
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
                              widget.unitPrice,
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
                              'Maintenance Price',
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
                              widget.maintenancePrice,
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                height: 8.h,
                child: DefaultGradientButton(
                  isFilled: true,
                  text: Text(
                    'Buy Device',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const PayForBuyDevice(
                              yourMinerPic:
                                  'assets/images/antMinerL7_image.svg',
                              yourMinerName: 'AntMiner E9',
                              yourMinerRate: 'Forever — 23 580 GH/S',
                            ));
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
