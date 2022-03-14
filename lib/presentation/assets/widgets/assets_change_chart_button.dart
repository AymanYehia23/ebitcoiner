import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class AssetsChangeChartButton extends StatefulWidget {
  const AssetsChangeChartButton({
    Key? key,
  }) : super(key: key);

  @override
  State<AssetsChangeChartButton> createState() =>
      _AssetsChangeChartButtonState();
}

class _AssetsChangeChartButtonState extends State<AssetsChangeChartButton> {
  var _selectedCurrency = Currency.btc;
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: s.w(16.0)),
      width: double.infinity,
      height: s.h(48),
      color: const Color(0xff1d1a27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _selectedCurrency = Currency.btc;
              });
            },
            child: Container(
              width: s.w(78),
              height: s.h(32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(s.h(20)),
                color: _selectedCurrency == Currency.btc
                    ? const Color(0xff302c3f)
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/btc_icon.svg',
                    width: s.h(24),
                    height: s.h(24),
                  ),
                  SizedBox(
                    width: s.w(4),
                  ),
                  Text(
                    'BTC',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(15),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selectedCurrency = Currency.eth;
              });
            },
            child: Container(
              width: s.w(78),
              height: s.h(32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(s.h(20)),
                color: _selectedCurrency == Currency.eth
                    ? const Color(0xff302c3f)
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/eth_icon.svg',
                    width: s.h(24),
                    height: s.h(24),
                  ),
                  SizedBox(
                    width: s.w(4),
                  ),
                  Text(
                    'ETH',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(15),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selectedCurrency = Currency.rvn;
              });
            },
            child: Container(
              width: s.w(78),
              height: s.h(32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(s.h(20)),
                color: _selectedCurrency == Currency.rvn? const Color(0xff302c3f):null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/rvn_icon.svg',
                    width: s.h(24),
                    height: s.h(24),
                  ),
                  SizedBox(
                    width: s.w(4),
                  ),
                  Text(
                    'RVN',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(15),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
