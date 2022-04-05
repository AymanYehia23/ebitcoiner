import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/presentation/hashrate/widgets/active_plans_widget.dart';
import 'package:hash_store/presentation/hashrate/widgets/expired_plans_widget.dart';
import 'package:hash_store/presentation/hashrate/widgets/hashrate_total_widget.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';
import '../../../data/models/chart_model.dart';
import '../../assets/widgets/assets_change_chart_button.dart';
import '../../assets/widgets/assets_chart_widget.dart';

class HashRateScreen extends StatelessWidget {
  HashRateScreen({Key? key}) : super(key: key);

  final data = [
    ChartData('Sun', 55),
    ChartData('Mon', 45),
    ChartData('Tue', 70),
    ChartData('Wed', 95),
    ChartData('Thu', 75),
    ChartData('Fri', 55),
    ChartData('Sat', 55),
  ];

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.8.h,
                ),
                const HashrateTotalWidget(),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Hashrate Gains',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 7.h,
                  decoration: const BoxDecoration(
                    color: Color(0xff1d1a27),
                    border: Border(
                      bottom: BorderSide(
                        width: 0.7,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Last 7 days gains',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Container(
                        width: 10.w,
                        height: 10.w,
                        padding: EdgeInsets.symmetric(horizontal: 2.w,),
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
                AssetsChartWidget(
                  data: data,
                ),
                SizedBox(height: 5.h),
                Text(
                  'Active Plans (2)',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 1.h),
                const ActivePlansWidget(
                  currencyPic: 'assets/images/btc_icon.svg',
                  currency: 'Bitcoin — Starter',
                  totalMined: '0.000002130 BTC',
                  avgDailyIncome: '14.0323213 BTC',
                  currentHashPower: '23 580 GH/S',
                  expiredOn: '12 Jan 2022',
                  bookingDate: '12 Jan 2021',
                ),
                SizedBox(height: 2.h),
                const ActivePlansWidget(
                  currencyPic: 'assets/images/eth_icon.svg',
                  currency: 'Ethereum — Starter',
                  totalMined: '0.000002130 BTC',
                  avgDailyIncome: '14.0323213 BTC',
                  currentHashPower: '23 580 GH/S',
                  expiredOn: '12 Jan 2022',
                  bookingDate: '12 Jan 2021',
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
