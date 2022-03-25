import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

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
    Sizer s = Sizer(context: context);
    return Container(
      height: s.h(235),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(s.w(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: s.h(16),
              vertical: s.w(16.0),
            ),
            height: s.h(66.0),
            width: double.infinity,
            child: Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    currencyPic,
                    height: s.h(32),
                    width: s.h(32.0),
                  ),
                  SizedBox(
                    width: s.w(8.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currency,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(14.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Booking Date: $bookingDate',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(10.0),
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: s.h(16),
                    vertical: s.w(16.0),
                  ),
                  height: s.h(71.0),
                  width: s.w(170.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Mined',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(10.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        totalMined,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(12.0),
                            ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: s.h(16),
                    vertical: s.w(16.0),
                  ),
                  height: s.h(71.0),
                  width: s.w(170.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Avg Daily Income',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(10.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        avgDailyIncome,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(12.0),
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
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: s.h(16),
                    vertical: s.w(16.0),
                  ),
                  height: s.h(71.0),
                  width: s.w(170.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Current HashPower',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(10.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/mining_pink_icon.svg',
                              height: s.h(16.0),
                              width: s.w(16.0),
                            ),
                            Text(
                              currentHashPower,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: s.h(12.0),
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: s.h(16),
                    vertical: s.w(16.0),
                  ),
                  height: s.h(71.0),
                  width: s.w(170.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Expired on',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(10.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        expiredOn,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(12.0),
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
