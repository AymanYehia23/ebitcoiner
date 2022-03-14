import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared_components/default_gradient_button.dart';
import '../../sizer/sizer.dart';

class AssetsTotalWidget extends StatefulWidget {
  const AssetsTotalWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AssetsTotalWidget> createState() => _AssetsTotalWidgetState();
}

class _AssetsTotalWidgetState extends State<AssetsTotalWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: s.h(16.0),
        horizontal: s.w(16.0),
      ),
      height: _isExpanded ? s.h(270) : s.h(128),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(s.w(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/assets_icon.svg',
                width: s.h(24),
                height: s.h(24),
              ),
              SizedBox(
                width: s.w(7.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: s.h(17),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '\$12,020.64',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(19),
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
              const Spacer(),
              SizedBox(
                width: s.w(115.0),
                height: s.h(40.0),
                child: DefaultGradientButton(
                  isFilled: false,
                  text: Text(
                    'Withdraw',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(17),
                        ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: s.h(10.0),
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/btc_icon.svg',
                height: s.h(32),
                width: s.h(32.0),
              ),
              SizedBox(
                width: s.w(8.0),
              ),
              SvgPicture.asset(
                'assets/images/eth_icon.svg',
                height: s.h(32),
                width: s.h(32.0),
              ),
              SizedBox(
                width: s.w(8.0),
              ),
              SvgPicture.asset(
                'assets/images/rvn_icon.svg',
                height: s.h(32),
                width: s.h(32.0),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Container(
                  width: s.h(32),
                  height: s.h(32),
                  decoration: BoxDecoration(
                    color: const Color(0xff302c3f),
                    borderRadius: BorderRadius.circular(
                      s.h(32),
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/feather_chevron_down_icon.svg',
                  ),
                ),
              ),
            ],
          ),
          if (_isExpanded)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: s.h(24),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/btc_icon.svg',
                      height: s.h(24),
                      width: s.h(24),
                    ),
                    SizedBox(
                      width: s.w(8),
                    ),
                    Text(
                      'BTC (Bitcoin)',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(17),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      '\$10,020.64',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(17),
                          ),
                    ),
                  ],
                ),
                const Divider(color: Colors.grey),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/eth_icon.svg',
                      height: s.h(24),
                      width: s.h(24),
                    ),
                    SizedBox(
                      width: s.w(8),
                    ),
                    Text(
                      'ETH (Ethereum)',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(17),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      '\$2,000.0',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(17),
                          ),
                    ),
                  ],
                ),
                const Divider(color: Colors.grey),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/rvn_icon.svg',
                      height: s.h(24),
                      width: s.h(24),
                    ),
                    SizedBox(
                      width: s.w(8),
                    ),
                    Text(
                      'RVN (Raven)',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(17),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      '\$0',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(17),
                          ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
