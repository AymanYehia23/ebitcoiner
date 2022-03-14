import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

import '../../../data/models/chart_model.dart';
import '../widgets/assets_change_chart_button.dart';
import '../widgets/assets_chart_widget.dart';
import '../widgets/assets_header_widget.dart';
import '../widgets/assets_total_widget.dart';

class AssetsScreen extends StatelessWidget {
  AssetsScreen({Key? key}) : super(key: key);
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: s.h(16), horizontal: s.w(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AssetsHeaderWidget(),
            SizedBox(height: s.h(12),),
            const AssetsTotalWidget(),
            SizedBox(height: s.h(40.0)),
            Text(
              'Hashrate Gains',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: s.h(30),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: s.h(12.0)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: s.w(16)),
              width: double.infinity,
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
                      'assets/images/filter_icon.svg',
                    ),
                  ),
                ],
              ),
            ),
            const AssetsChangeChartButton(),
            AssetsChartWidget(
              data: data,
            ),
          ],
        ),
      ),
    );
  }
}
