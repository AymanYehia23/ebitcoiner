import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/logic/cubit/hash_rate/hash_rate_cubit.dart';
import 'package:hash_store/presentation/hashrate/widgets/active_plans_widget.dart';
import 'package:hash_store/presentation/hashrate/widgets/expired_plans_widget.dart';
import 'package:hash_store/presentation/hashrate/widgets/hashrate_total_widget.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';
import '../../../data/models/plan_contract_model.dart';
import '../../../logic/cubit/assets/assets_cubit.dart';
import '../../assets/widgets/assets_change_chart_button.dart';
import '../../assets/widgets/assets_chart_widget.dart';

class HashRateScreen extends StatelessWidget {
  const HashRateScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
          ),
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.8.h,
                ),
                FutureBuilder(
                    future: context.read<HashRateCubit>().getTotalPower(),
                    builder: (context, snapshot) {
                      return const HashrateTotalWidget();
                    }),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Hashrate Profits',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: (22.sp),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: (1.h)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: (4.w)),
                  width: double.infinity,
                  height: (8.h),
                  decoration: const BoxDecoration(
                    color: Color(0xff1d1a27),
                    border: Border(
                      bottom: BorderSide(
                        width: 0.3,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Last Profits',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: (14.sp),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Container(
                        width: 10.w,
                        height: 10.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xff302c3f),
                        ),
                        child: SvgPicture.asset(
                          Strings.filterIcon,
                        ),
                      ),
                    ],
                  ),
                ),
                const AssetsChangeChartButton(),
                const AssetsChartWidget(),
                SizedBox(height: 5.h),
                Text(
                  'Active Plans (${context.read<AssetsCubit>().userData.activePlans})',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 1.h),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      context.read<HashRateCubit>().activePlans.length,
                  itemBuilder: (context, index) => ActivePlansWidget(
                    totalMined:
                        '${context.read<HashRateCubit>().activePlans[index].totalMined?.toStringAsFixed(6)}',
                    avgDailyIncome: getHourlyProfits(
                      context
                          .read<HashRateCubit>()
                          .activePlans[index]
                          .hourlyGains,
                    ),
                    bookingDate:
                        '${context.read<HashRateCubit>().activePlans[index].startDate}',
                    expiredOn:
                        '${context.read<HashRateCubit>().activePlans[index].endDate}',
                    currency:
                        '${context.read<HashRateCubit>().activePlans[index].cryptoName}',
                    currencyPic: getCurrencyPic(
                      context
                          .read<HashRateCubit>()
                          .activePlans[index]
                          .cryptoName,
                    ),
                    currentHashPower:
                        '${context.read<HashRateCubit>().activePlans[index].hashPower?.toStringAsFixed(2)}',
                  ),
                ),
                SizedBox(height: 5.h),
                const ExpiredPlansWidget(),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
