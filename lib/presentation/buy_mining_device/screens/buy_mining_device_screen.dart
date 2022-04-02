import 'package:flutter/material.dart';
import 'package:hash_store/presentation/buy_mining_device/widgets/buy_mining_device_widget.dart';
import 'package:hash_store/presentation/buy_mining_device/widgets/pay_for_buy_device_widget.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

class BuyMiningDeviceScreen extends StatelessWidget {
  const BuyMiningDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close_rounded, color: Colors.white),
        ),
        title: Title(
          child: Text(
            'Buy Mining Device',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 13.sp),
          ),
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const GradientBackgroundContainer(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Choose desired device',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 2.h,
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
                    height: 2.h,
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
                    height: 2.h,
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
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
      bottomSheet: const PayForBuyDevice(
        yourMinerPic: 'assets/images/antMinerL7_image.svg',
        yourMinerName: 'AntMiner E9',
        yourMinerRate: 'Forever — 23 580 GH/S',
      ),
    );
  }
}
