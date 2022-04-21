import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/assets/assets_cubit.dart';
import '../../shared_components/default_gradient_button.dart';

class AssetsTotalWidget extends StatelessWidget {
  const AssetsTotalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      height: context.select((AssetsCubit a) => a.isExpanded) ? (34.h) : (17.h),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Strings.assetsIcon,
                width: (4.w),
                height: (3.h),
              ),
              SizedBox(
                width: (2.w),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: (13.sp),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Builder(builder: (context) {
                    return Text(
                      '\$${context.watch<AssetsCubit>().totalProfit}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: (14.sp),
                            fontWeight: FontWeight.bold,
                          ),
                    );
                  }),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: (30.w),
                height: (5.h),
                child: DefaultGradientButton(
                  isFilled: false,
                  text: Text(
                    'Withdraw',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: (13.sp),
                        ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: (1.h),
          ),
          Row(
            children: [
              SvgPicture.asset(
                Strings.btcIcon,
                height: (4.h),
                width: (4.w),
              ),
              SizedBox(
                width: (2.w),
              ),
              SvgPicture.asset(
                Strings.ethIcon,
                height: (4.h),
                width: (4.w),
              ),
              SizedBox(
                width: (2.w),
              ),
              SvgPicture.asset(
                Strings.ltctIcon,
                height: (4.5.h),
                width: (5.w),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  context.read<AssetsCubit>().changeSize();
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
                    context.read<AssetsCubit>().expandedIcon,
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: context.select((AssetsCubit a) => a.isExpanded)
                ? (17.h)
                : 0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: (3.h),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Strings.btcIcon,
                        height: (3.h),
                        width: (3.w),
                      ),
                      SizedBox(
                        width: (2.w),
                      ),
                      Text(
                        'BTC (Bitcoin)',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: (13.sp),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      Builder(
                        builder: (context) {
                          return Text(
                            '\$${context.watch<AssetsCubit>().totalBTC}',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: (13.sp),
                                    ),
                          );
                        },
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Strings.ethIcon,
                        height: (3.h),
                        width: (3.w),
                      ),
                      SizedBox(
                        width: (2.w),
                      ),
                      Text(
                        'ETH (Ethereum)',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: (13.sp),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      Builder(
                        builder: (context) {
                          return Text(
                            '\$${context.watch<AssetsCubit>().totalETH}',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: (13.sp),
                                    ),
                          );
                        },
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Strings.ltctIcon,
                        height: (3.5.h),
                        width: (3.5.w),
                      ),
                      SizedBox(
                        width: (2.w),
                      ),
                      Text(
                        'LTCT',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: (13.sp),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      Builder(
                        builder: (context) {
                          return Text(
                            '\$${context.watch<AssetsCubit>().totalLTCT}',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: (13.sp),
                                    ),
                          );
                        },
                      ),
                    ],
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
