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
      padding: EdgeInsets.symmetric(
        horizontal: s.w(16.0),
        vertical: s.h(16.0),
      ),
      height: s.h(225),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff302C3F),
        ),
        borderRadius: BorderRadius.circular(s.h(8)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  currencyPic,
                  height: s.h(32.0),
                  width: s.h(32.0),
                ),
                SizedBox(
                  width: s.w(8.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currency,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(19.0),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'Booking Date: $bookingDate',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: s.h(15.0),
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
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(4),
                      ),
                      Text(
                        totalMined,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(17.0),
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
                        'Avg Daily Income',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(4),
                      ),
                      Text(
                        avgDailyIncome,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(17.0),
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
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(4),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/mining_pink_icon.svg',
                            height: s.h(16.0),
                            width: s.h(16.0),
                          ),
                          SizedBox(
                            width: s.w(4),
                          ),
                          Text(
                            currentHashPower,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: s.h(17.0),
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
                              fontSize: s.h(15.0),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(4),
                      ),
                      Text(
                        expiredOn,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(17.0),
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
