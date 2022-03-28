import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/devices/widgets/your_miners_widget.dart';
import 'package:hash_store/presentation/hashrate/widgets/hashrate_total_widget.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

import '../../../core/constants/strings.dart';
import '../../../data/models/chart_model.dart';
import '../../assets/widgets/assets_change_chart_button.dart';
import '../../assets/widgets/assets_chart_widget.dart';

class DevicesScreen extends StatelessWidget {
  DevicesScreen({Key? key}) : super(key: key);

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
        SizedBox(
          height: s.h(60.0),
        ),
        const GradientBackgroundContainer(),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: s.w(16.0)),
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
                  'Miners Gains',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: s.h(28.0)),
                ),
                SizedBox(
                  height: s.h(12.0),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: s.w(16)),
                  width: double.infinity,
                  height: s.h(64),
                  decoration: const BoxDecoration(
                    color: Color(0xff1d1a27),
                    border: Border(
                      bottom: BorderSide(
                        width: 0.7,
                        color: Colors.grey,
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
                SizedBox(
                  height: s.h(40.0),
                ),
                Text(
                  'Your Miners (2)',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: s.h(28.0)),
                ),
                SizedBox(
                  height: s.h(12.0),
                ),
                const YourMinersWidget(
                  yourMinerPic: 'assets/images/antMinerE9_image.svg',
                  currencyIcn: 'assets/images/btc_icon.svg',
                  currency: 'Bitcoin — SHA-256',
                  antMiner: 'AntMiner E9',
                  maintenanceStart: '18 Jan 2022',
                  maintenanceEnd: '18 Jan 2023',
                  maintenancePrice: '\$112.69	/month',
                  profit: '\$112.69/day',
                  isEnd: false,
                  closeToEnd: true,
                ),
                SizedBox(
                  height: s.h(15.0),
                ),
                const YourMinersWidget(
                  yourMinerPic: 'assets/images/antMinerE9_image.svg',
                  currencyIcn: 'assets/images/btc_icon.svg',
                  currency: 'Bitcoin — SHA-256',
                  antMiner: 'AntMiner E9',
                  maintenanceStart: '18 Jan 2022',
                  maintenanceEnd: '18 Jan 2023',
                  maintenancePrice: '\$112.69	/month',
                  profit: '\$112.69/day',
                  isEnd: false,
                  closeToEnd: false,
                ),
                SizedBox(
                  height: s.h(96.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
