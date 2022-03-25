import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

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
        horizontal: s.h(16.0),
        vertical: s.w(16.0),
      ),
      height: _isExpanded ? s.h(313) : s.h(140),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1d1a27),
        border: Border.all(
          color:  Colors.white,
        ),
        borderRadius: BorderRadius.circular(s.w(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
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
                            fontSize: s.h(14),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '23 580 GH/S',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(15),
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: s.h(10.0),
          ),
          Expanded(
            child: Row(
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
          ),
          if (_isExpanded)
            SizedBox(
              height: s.h(150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: s.h(32.0),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/btc_icon.svg',
                          height: s.h(32),
                          width: s.h(32.0),
                        ),
                        SizedBox(width: s.w(8.0),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BTC (Bitcoin)',
                              style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: s.h(10.5),
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            Text(
                              '1 active plan',
                              style:
                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: const Color(0xffff4980),
                                        fontSize: s.h(9.5),
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '20 580 GH/S',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: s.h(10.5),
                              ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/eth_icon.svg',
                          height: s.h(32),
                          width: s.h(32.0),
                        ),
                        SizedBox(width: s.w(8.0),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ETH (Ethereum)',
                              style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: s.h(10.5),
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            Text(
                              '1 active plan',
                              style:
                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: const Color(0xffff4980),
                                        fontSize: s.h(9.5),
                                        fontWeight: FontWeight.bold,
                                      ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '3 000 GH/S',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: s.h(10.5),
                              ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/rvn_icon.svg',
                          height: s.h(32),
                          width: s.h(32.0),
                        ),
                        SizedBox(width: s.w(8.0),),
                        Column(
                          children: [
                            Text(
                              'RVN (Raven)',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: s.h(10.5),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              '',
                              style:
                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: const Color(0xffff4980),
                                        fontSize: s.h(9.5),
                                        fontWeight: FontWeight.bold,
                                      ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '0 \$',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: s.h(10.5),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
