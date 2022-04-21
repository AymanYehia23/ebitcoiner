import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ActivePlansWidget extends StatelessWidget {
  final String currencyPic;
  final String currency;
  final String bookingDate;
  final String totalMined;
  final String avgDailyIncome;
  final String currentHashPower;
  final String expiredOn;
  const ActivePlansWidget({
    Key? key,
    required this.currencyPic,
    required this.totalMined,
    required this.avgDailyIncome,
    required this.currentHashPower,
    required this.expiredOn,
    required this.bookingDate,
    required this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.symmetric(
        horizontal:4.w,
        vertical: 2.h,
      ),
      height: 30.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff302C3F),
        ),
        borderRadius: BorderRadius.circular((8)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  currencyPic,
                  height: 8.5.w,
                  width: 8.5.w,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currency,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'Booking Date: $bookingDate',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 10.sp,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Mined',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        totalMined,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11.sp,
                            ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Avg Income Per Minute',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        avgDailyIncome,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11.sp,
                            ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Current HashPower',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 10.sp,
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
                            'assets/images/mining_pink_icon.svg',
                            height: 2.h,
                            width: 3.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            currentHashPower,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11.sp,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Expired on',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize:10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        expiredOn,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11.sp,
                            ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
