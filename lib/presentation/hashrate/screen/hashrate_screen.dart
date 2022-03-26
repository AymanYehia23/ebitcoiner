import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/presentation/hashrate/widgets/active_plans_widget.dart';
import 'package:hash_store/presentation/hashrate/widgets/expired_plans_widget.dart';
import 'package:hash_store/presentation/hashrate/widgets/hashrate_total_widget.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

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
    Sizer s = Sizer(context: context);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: s.w(16.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: s.h(32.0),
                ),
                const HashrateTotalWidget(),
                SizedBox(
                  height: s.h(40.0),
                ),
                Text(
                  'Hashrate Gains',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: s.h(30),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: s.h(12.0),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: s.w(16)),
                  height: s.h(64),
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
                              fontSize: s.h(19),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Container(
                        width: s.h(40),
                        height: s.h(40),
                        padding: EdgeInsets.all(s.h(4)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(s.h(40)),
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
                SizedBox(height: s.h(40.0)),
                Text(
                  'Active Plans (2)',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: s.h(30),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: s.h(12.0)),
                const ActivePlansWidget(
                  currencyPic: 'assets/images/btc_icon.svg',
                  currency: 'Bitcoin — Starter',
                  totalMined: '0.000002130 BTC',
                  avgDailyIncome: '14.0323213 BTC',
                  currentHashPower: '23 580 GH/S',
                  expiredOn: '12 Jan 2022',
                  bookingDate: '12 Jan 2021',
                ),
                SizedBox(height: s.h(15.0)),
                const ActivePlansWidget(
                  currencyPic: 'assets/images/eth_icon.svg',
                  currency: 'Ethereum — Starter',
                  totalMined: '0.000002130 BTC',
                  avgDailyIncome: '14.0323213 BTC',
                  currentHashPower: '23 580 GH/S',
                  expiredOn: '12 Jan 2022',
                  bookingDate: '12 Jan 2021',
                ),
                SizedBox(height: s.h(40.0)),
                const ExpiredPlansWidget(),
                SizedBox(height: s.h(75.0)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
