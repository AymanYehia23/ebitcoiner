import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/strings.dart';
import '../../../data/models/plan_contract_model.dart';
import '../../../logic/cubit/hash_rate/hash_rate_cubit.dart';
import 'active_plans_widget.dart';

class ExpiredPlansWidget extends StatelessWidget {
  const ExpiredPlansWidget({Key? key}) : super(key: key);
  String getHourlyProfits(List<HourlyGains>? hourlyGains) {
    double total = 0.0;
    int minutes = 0;
    if (hourlyGains!.isNotEmpty) {
      for (var element in hourlyGains) {
        total += element.profit!;
        minutes += 5;
      }
      return (total / minutes).toStringAsFixed(6);
    }
    return '0.000000';
  }
    String getCurrencyPic(String? currencyName) {
    if (currencyName == 'BTC') {
      return Strings.btcIcon;
    } else if (currencyName == 'ETH') {
      return Strings.ethIcon;
    } else if (currencyName == 'RVN') {
      return Strings.rvnIcon;
    } else {
      return Strings.ltctIcon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 2.h,
      ),
      height:
          context.select((HashRateCubit h) => h.isExpiredExpanded) ? 40.h : 9.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff302C3F),
        ),
        borderRadius: BorderRadius.circular((8)),
      ),
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expired plans (${context.read<HashRateCubit>().expiredPlans.length})',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                InkWell(
                  onTap: () {
                    context.read<HashRateCubit>().changeExpiredSize();
                  },
                  child: Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: BoxDecoration(
                      color: const Color(0xff302c3f),
                      borderRadius: BorderRadius.circular(
                        (32),
                      ),
                    ),
                    child: SvgPicture.asset(
                      context.read<HashRateCubit>().expandedExpiredIcon,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h,),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: context.read<HashRateCubit>().expiredPlans.length,
              itemBuilder: (context, index) => ActivePlansWidget(
                totalMined:
                    '${context.read<HashRateCubit>().expiredPlans[index].totalMined?.toStringAsFixed(6)}',
                avgDailyIncome: getHourlyProfits(
                  context.read<HashRateCubit>().expiredPlans[index].hourlyGains,
                ),
                bookingDate:
                    '${context.read<HashRateCubit>().expiredPlans[index].startDate}',
                expiredOn:
                    '${context.read<HashRateCubit>().expiredPlans[index].endDate}',
                currency:
                    '${context.read<HashRateCubit>().expiredPlans[index].cryptoName}',
                currencyPic: getCurrencyPic(
                  context.read<HashRateCubit>().expiredPlans[index].cryptoName,
                ),
                currentHashPower:
                    '${context.read<HashRateCubit>().expiredPlans[index].hashPower?.toStringAsFixed(2)}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
