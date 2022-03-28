import 'package:flutter/material.dart';
import 'package:hash_store/presentation/buy_mining_device/widgets/buy_mining_device_widget.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class BuyMiningDeviceScreen extends StatelessWidget {
  const BuyMiningDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: s.w(16.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: s.h(24.0),
                ),
                Text(
                  'Choose desired device',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: s.h(30),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const BuyMiningDeviceWidget(
                  yourMinerPic: 'assets/images/antMinerE9_image.svg',
                  yourMinerName: 'AntMiner E9',
                  currencyIcn1: 'assets/images/btc_icon.svg',
                  currencyIcn2: 'assets/images/eth_icon.svg',
                  currencyName1: 'BTC (Bitcoin)',
                  currencyName2: 'ETH (Ethereum)',
                  algorithm: 'SHA-256',
                  profitability: 'From 143%',
                  power: '23 580 GH/S',
                  unitPrice: '\$12,000',
                  maintenancePrice: '\$112.69/mth',
                ),
                SizedBox(
                  height: s.h(16.0),
                ),
                const BuyMiningDeviceWidget(
                  yourMinerPic: 'assets/images/antMinerL7_image.svg',
                  yourMinerName: 'AntMiner L7 9500 Mh',
                  currencyIcn1: 'assets/images/btc_icon.svg',
                  currencyIcn2: 'assets/images/eth_icon.svg',
                  currencyName1: 'BTC (Bitcoin)',
                  currencyName2: 'ETH (Ethereum)',
                  algorithm: 'SHA-256',
                  profitability: 'From 143%',
                  power: '23 580 GH/S',
                  unitPrice: '\$12,000',
                  maintenancePrice: '\$112.69/mth',
                ),
                SizedBox(
                  height: s.h(16.0),
                ),
                const BuyMiningDeviceWidget(
                  yourMinerPic: 'assets/images/antMinerL7_image.svg',
                  yourMinerName: 'AntMiner S19 Pro',
                  currencyIcn1: 'assets/images/btc_icon.svg',
                  currencyIcn2: 'assets/images/eth_icon.svg',
                  currencyName1: 'BTC (Bitcoin)',
                  currencyName2: 'ETH (Ethereum)',
                  algorithm: 'SHA-256',
                  profitability: 'From 143%',
                  power: '23 580 GH/S',
                  unitPrice: '\$12,000',
                  maintenancePrice: '\$112.69/mth',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
