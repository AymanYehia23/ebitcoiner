import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

import '../../../core/constants/strings.dart';

class HashrateTotalWidget extends StatefulWidget {
  const HashrateTotalWidget({Key? key}) : super(key: key);

  @override
  State<HashrateTotalWidget> createState() => _HashrateTotalWidgetState();
}

class _HashrateTotalWidgetState extends State<HashrateTotalWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: s.w(16.0),
        vertical: s.h(16.0),
      ),
      height: _isExpanded ? s.h(315) : s.h(134),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1d1a27),
        border: Border.all(
          color:  Colors.white,
        ),
        borderRadius: BorderRadius.circular(s.h(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/mining_icon.svg',
                width: s.h(24),
                height: s.h(24),
              ),
              SizedBox(
                width: s.w(12.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Active Hashrate Power',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: s.h(17),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '23 580 GH/S',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(19),
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: s.h(16.0),
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/btc_icon.svg',
                height: s.h(32.0),
                width: s.h(32.0),
              ),
              SizedBox(
                width: s.w(8.0),
              ),
              SvgPicture.asset(
                'assets/images/eth_icon.svg',
                height: s.h(32.0),
                width: s.h(32.0),
              ),
              SizedBox(
                width: s.w(8.0),
              ),
              SvgPicture.asset(
                'assets/images/rvn_icon.svg',
                height: s.h(37.0),
                width: s.h(37.0),
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
                    Strings.featherChevronDownIcon,
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
                  height: s.h(24.0),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      Strings.btcIcon,
                      height: s.h(24),
                      width: s.h(24),
                    ),
                    SizedBox(
                      width: s.w(8),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BTC (Bitcoin)',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: s.h(17),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '1 active plan',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: const Color(0xffff4980),
                                    fontSize: s.h(16),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '20 580 GH/S',
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
                      Strings.ethIcon,
                      height: s.h(24),
                      width: s.h(24),
                    ),
                    SizedBox(
                      width: s.w(8),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ETH (Ethereum)',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: s.h(17),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '1 active plan',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: const Color(0xffff4980),
                                    fontSize: s.h(16),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '3 000 GH/S',
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
                      height: s.h(32.0),
                      width: s.h(32.0),
                    ),
                    SizedBox(width: s.w(8.0),),
                    Column(
                      children: [
                        Text(
                          'RVN (Raven)',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: s.h(17),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          '',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: const Color(0xffff4980),
                                    fontSize: s.h(16),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '0 \$',
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
