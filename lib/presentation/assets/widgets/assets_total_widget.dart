import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/assets/assets_cubit.dart';

class AssetsTotalWidget extends StatelessWidget {
  const AssetsTotalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<AssetsCubit>().getUserBalance(),
        builder: (context, snapshot) {
          String _totalBalance = '';
          String _totalBTC = '';
          String _totalETH = '';
          String _totalRVN = '';
          String _totalLTCT = '';
          if (snapshot.connectionState == ConnectionState.waiting) {
            _totalBalance = '';
            _totalBTC = '';
            _totalETH = '';
            _totalRVN = '';
            _totalLTCT = '';
          } else if (snapshot.connectionState == ConnectionState.done) {
            _totalBalance =
                context.watch<AssetsCubit>().totalBalance.toString();
            _totalBTC = context.watch<AssetsCubit>().totalBTC.toString();
            _totalETH = context.watch<AssetsCubit>().totalETH.toString();
            _totalRVN = context.watch<AssetsCubit>().totalRVN.toString();
            _totalLTCT = context.watch<AssetsCubit>().totalLTCT.toString();
          }
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            height: context.select((AssetsCubit a) => a.isExpanded)
                ? (35.h)
                : (18.h),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.white),
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: (13.sp),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Builder(builder: (context) {
                          return Text(
                            '\$$_totalBalance',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: (14.sp),
                                      fontWeight: FontWeight.bold,
                                    ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: (1.h),
                ),
                Row(
                  children: [
                    Image.asset(
                      Strings.btcIcon,
                      height: (4.5.h),
                      width: (8.w),
                    ),
                    SizedBox(
                      width: (2.w),
                    ),
                    Image.asset(
                      Strings.ethIcon,
                      height: (4.5.h),
                      width: (8.w),
                    ),
                    SizedBox(
                      width: (2.w),
                    ),
                    Image.asset(
                      Strings.rvnIcon,
                      height: (4.5.h),
                      width: (8.w),
                    ),
                    SizedBox(
                      width: (2.w),
                    ),
                    Image.asset(
                      Strings.ltctIcon,
                      height: (4.5.h),
                      width: (8.w),
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
                          color: ColorManager.darkPurple,
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
                            Image.asset(
                              Strings.btcIcon,
                              width: (6.w),
                              height: (3.h),
                            ),
                            SizedBox(
                              width: (2.w),
                            ),
                            Text(
                              'BTC (Bitcoin)',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: (13.sp),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Spacer(),
                            Builder(
                              builder: (context) {
                                return Text(
                                  '\$$_totalBTC',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: (13.sp),
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                        const Divider(color: ColorManager.gray),
                        Row(
                          children: [
                            Image.asset(
                              Strings.ethIcon,
                              width: (6.w),
                              height: (3.h),
                            ),
                            SizedBox(
                              width: (2.w),
                            ),
                            Text(
                              'ETH (Ethereum)',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: (13.sp),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Spacer(),
                            Builder(
                              builder: (context) {
                                return Text(
                                  '\$$_totalETH',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: (13.sp),
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                        const Divider(color: ColorManager.gray),
                        Row(
                          children: [
                            Image.asset(
                              Strings.rvnIcon,
                              width: (6.w),
                              height: (3.h),
                            ),
                            SizedBox(
                              width: (2.w),
                            ),
                            Text(
                              'RVN',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: (13.sp),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Spacer(),
                            Builder(
                              builder: (context) {
                                return Text(
                                  '\$$_totalRVN',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: (13.sp),
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                        const Divider(color: ColorManager.gray),
                        Row(
                          children: [
                            Image.asset(
                              Strings.ltctIcon,
                              width: (6.w),
                              height: (3.h),
                            ),
                            SizedBox(
                              width: (2.w),
                            ),
                            Text(
                              'LTCT',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: (13.sp),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Spacer(),
                            Builder(
                              builder: (context) {
                                return Text(
                                  '\$$_totalLTCT',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
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
        });
  }
}
