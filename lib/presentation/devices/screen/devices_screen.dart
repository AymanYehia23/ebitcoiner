import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/devices/widgets/your_miners_widget.dart';
import 'package:hash_store/presentation/hashrate/widgets/hashrate_total_widget.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

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
    return Stack(
      children: [
        SizedBox(
          height: 6.8.h,
        ),
        const GradientBackgroundContainer(),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.5.h,
                ),
                const HashrateTotalWidget(),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Miners Gains',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  width: double.infinity,
                  height: 7.h,
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
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Container(
                        width: 10.w,
                        height: 10.w,
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((40)),
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
                  height:5.h,
                ),
                Text(
                  'Your Miners (2)',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 22.sp,fontWeight: FontWeight.bold,),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                const YourMinersWidget(
                  yourMinerPic: 'assets/images/antMinerE9_image.png',
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
                  height: 2.h,
                ),
                const YourMinersWidget(
                  yourMinerPic: 'assets/images/antMinerE9_image.png',
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
                  height: 12.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
