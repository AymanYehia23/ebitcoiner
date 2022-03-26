import 'package:flutter/material.dart';
import 'package:hash_store/presentation/assets/widgets/assets_change_chart_button.dart';
import 'package:hash_store/presentation/choose_desired_plan/widgets/choose_desired_plan_widget.dart';
import 'package:hash_store/presentation/choose_desired_plan/widgets/contract_period_widget.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class ChooseDesiredPlanScreen extends StatefulWidget {
  const ChooseDesiredPlanScreen({Key? key}) : super(key: key);

  @override
  State<ChooseDesiredPlanScreen> createState() =>
      _ChooseDesiredPlanScreenState();
}

class _ChooseDesiredPlanScreenState extends State<ChooseDesiredPlanScreen> {
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Add new hashrate plan',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: s.h(19),
                  ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: s.h(225),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xff1d1a27),
                    border: Border(
                      bottom: BorderSide(
                        width: 0.7,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: s.h(8)),
                      Text(
                        'Choose Currency',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(19.0),
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: s.h(8),
                      ),
                      const AssetsChangeChartButton(),
                      const Divider(),
                      Text(
                        'Contract period',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(19.0),
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: s.h(8),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: s.w(16),
                          vertical: s.h(8),
                        ),
                        child: const ContractPeriodWidget(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: s.h(40.0),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: s.w(16.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose desired Plan',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(28),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: s.h(12.0),
                      ),
                      const ChooseDesiredPlanWidget(
                        price: '\$ 200',
                        minersPic: 'assets/images/miners_image.svg',
                        text: 'Lite Miners',
                        currencyIcn: 'assets/images/btc_icon.svg',
                        currencyName: 'BTC (Bitcoin)',
                        power: '23 580 GH/S',
                        pricePer1Gh: '\$ 0.0120',
                        profitability: 'From 143%',
                      ),
                      SizedBox(
                        height: s.h(16.0),
                      ),
                      const ChooseDesiredPlanWidget(
                        price: '\$ 500',
                        minersPic: 'assets/images/regular_miners_image.svg',
                        text: 'Regular Miners',
                        currencyIcn: 'assets/images/btc_icon.svg',
                        currencyName: 'BTC (Bitcoin)',
                        power: '23 580 GH/S',
                        pricePer1Gh: '\$ 0.0120',
                        profitability: 'From 143%',
                      ),
                      SizedBox(
                        height: s.h(16.0),
                      ),
                      const ChooseDesiredPlanWidget(
                        price: '\$ 1000',
                        minersPic: 'assets/images/pro_miners_image.svg',
                        text: 'Pro Miners',
                        currencyIcn: 'assets/images/btc_icon.svg',
                        currencyName: 'BTC (Bitcoin)',
                        power: '23 580 GH/S',
                        pricePer1Gh: '\$ 0.0120',
                        profitability: 'From 143%',
                      ),
                      SizedBox(
                        height: s.h(16.0),
                      ),
                      const ChooseDesiredPlanWidget(
                        price: '\$ 5000',
                        minersPic: 'assets/images/elite_miners_image.svg',
                        text: 'Elite Miners',
                        currencyIcn: 'assets/images/btc_icon.svg',
                        currencyName: 'BTC (Bitcoin)',
                        power: '23 580 GH/S',
                        pricePer1Gh: '\$ 0.0120',
                        profitability: 'From 143%',
                      ),
                      SizedBox(
                        height: s.h(70.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
