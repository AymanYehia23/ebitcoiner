import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:sizer/sizer.dart';

class YourMinersWidget extends StatelessWidget {
  final String yourMinerPic;
  final String currencyIcn;
  final String currency;
  final String antMiner;
  final String maintenanceStart;
  final String maintenanceEnd;
  final String maintenancePrice;
  final String profit;
  final bool isEnd;
  final bool closeToEnd;

  const YourMinersWidget({
    Key? key,
    required this.yourMinerPic,
    required this.currencyIcn,
    required this.currency,
    required this.antMiner,
    required this.maintenanceStart,
    required this.maintenanceEnd,
    required this.maintenancePrice,
    required this.profit,
    required this.isEnd,
    required this.closeToEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String endSupport =
        'Device support stopped, please renew\n maintenance support to re-activate the device';
    return closeToEnd
        ? Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff1d1a27),
              border: Border.all(
                color: Colors.red,
              ),
            ),
            child: Column(
              children: [
                Container(
                  color: const Color.fromRGBO(240, 61, 62, 0.1),
                  height: 5.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.warning,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        isEnd
                            ? endSupport
                            : 'Maintenance support will end on $maintenanceEnd',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 9.sp,
                              color: Colors.red,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2.h, left: 4.w),
                  height: 12.h,
                  child: Row(
                    children: [
                      Image(
                        height: 9.h,
                        width: 12.w,
                        image: AssetImage(yourMinerPic),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            antMiner,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: 0.4.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                currencyIcn,
                                height: 6.w,
                                width: 6.w,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                currency,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 11.5.sp,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  'Device Bought on: $maintenanceStart',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12.5.sp,
                      ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 8.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance Start',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              maintenanceStart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.sp,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 8.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance End',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              maintenanceEnd,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.sp,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 8.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 12.sp,
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
                                  .copyWith(fontSize: 13.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 8.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Profit',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              profit,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.sp,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 8.h,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: DefaultGradientButton(
                      isFilled: true,
                      text: Text(
                        'Renew maintenance support',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      onPressed: () {}),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          )
        : Container(
            height: 30.h,
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
                  padding: EdgeInsets.only(top: 2.h, left: 4.w),
                  height: 10.h,
                  child: Row(
                    children: [
                     Image(
                        height: 9.h,
                        width: 12.w,
                        image: AssetImage(yourMinerPic),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            antMiner,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: 0.4.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                currencyIcn,
                                height: 6.w,
                                width: 6.w,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                currency,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 11.5.sp,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 9.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance Start',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              maintenanceStart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.sp,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 9.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance End',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              maintenanceEnd,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.sp,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 9.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maintenance Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 12.sp,
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
                                    fontSize: 13.sp,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 9.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Profit',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              profit,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13.sp,
                                  ),
                            )
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
