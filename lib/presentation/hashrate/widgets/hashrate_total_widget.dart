import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

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
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 2.h,
      ),
      height: _isExpanded ? 40.h : 17.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1d1a27),
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular((8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/mining_icon.svg',
                width: (8.5.w),
                height: (8.5.w),
              ),
              SizedBox(
                width: 2.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Active Hashrate Power',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '23 580 GH/S',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/btc_icon.svg',
                width: (8.w),
                height: (8.w),
              ),
              SizedBox(
                width: 1.w,
              ),
              SvgPicture.asset(
                'assets/images/eth_icon.svg',
                width: (8.w),
                height: (8.w),
              ),
              SizedBox(
                width: 1.w,
              ),
              SvgPicture.asset(
                'assets/images/rvn_icon.svg',
                width: (8.5.w),
                height: (9.w),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Container(
                  width: (8.w),
                  height: (8.w),
                  decoration: BoxDecoration(
                    color: const Color(0xff302c3f),
                    borderRadius: BorderRadius.circular(
                      (32),
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
                  height: 4.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      Strings.btcIcon,
                      height: (4.h),
                      width: (4.w),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BTC (Bitcoin)',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '1 active plan',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: const Color(0xffff4980),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '20 580 GH/S',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 11.sp,
                          ),
                    ),
                  ],
                ),
                const Divider(color: Colors.grey),
                Row(
                  children: [
                    SvgPicture.asset(
                      Strings.ethIcon,
                      height: (4.h),
                      width: (4.w),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ETH (Ethereum)',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '1 active plan',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: const Color(0xffff4980),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '3 000 GH/S',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 11.sp,
                          ),
                    ),
                  ],
                ),
                const Divider(color: Colors.grey),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/rvn_icon.svg',
                      height: (4.5.h),
                      width: (5.w),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      children: [
                        Text(
                          'RVN (Raven)',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: const Color(0xffff4980),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '0 \$',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 11.sp,
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
