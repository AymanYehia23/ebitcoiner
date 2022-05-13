import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/logic/cubit/assets/assets_cubit.dart';
import 'package:sizer/sizer.dart';

class AssetsChangeChartButton extends StatelessWidget {
  const AssetsChangeChartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: (4.w), vertical: 1.h),
      width: double.infinity,
      height: (12.h),
      color: const Color(0xff1d1a27),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    context.read<AssetsCubit>().changeChartButton(Currency.btc);
                    await context.read<AssetsCubit>().getAllChartData();
                  },
                  child: Container(
                    width: (20.w),
                    height: (4.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((20)),
                      color:
                          context.watch<AssetsCubit>().currency == Currency.btc
                              ? const Color(0xff302c3f)
                              : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Strings.btcIcon,
                          width: (6.w),
                          height: (3.5.h),
                        ),
                        SizedBox(
                          width: (1.w),
                        ),
                        Text(
                          'BTC',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: (12.sp),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    context.read<AssetsCubit>().changeChartButton(Currency.eth);
                    await context.read<AssetsCubit>().getAllChartData();
                  },
                  child: Container(
                    width: (20.w),
                    height: (4.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((20)),
                      color:
                          context.watch<AssetsCubit>().currency == Currency.eth
                              ? const Color(0xff302c3f)
                              : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Strings.ethIcon,
                          width: (6.w),
                          height: (3.5.h),
                        ),
                        SizedBox(
                          width: (1.w),
                        ),
                        Text(
                          'ETH',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: (12.sp),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    context.read<AssetsCubit>().changeChartButton(Currency.rvn);
                    await context.read<AssetsCubit>().getAllChartData();
                  },
                  child: Container(
                    width: (20.w),
                    height: (4.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((20)),
                      color:
                          context.watch<AssetsCubit>().currency == Currency.rvn
                              ? const Color(0xff302c3f)
                              : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Strings.rvnIcon,
                         width: (6.w),
                          height: (3.5.h),
                        ),
                        SizedBox(
                          width: (1.w),
                        ),
                        Text(
                          'RVN',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: (12.sp),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    context
                        .read<AssetsCubit>()
                        .changeChartButton(Currency.ltct);
                    await context.read<AssetsCubit>().getAllChartData();
                  },
                  child: Container(
                    width: (20.w),
                    height: (4.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((20)),
                      color:
                          context.watch<AssetsCubit>().currency == Currency.ltct
                              ? const Color(0xff302c3f)
                              : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Strings.ltctIcon,
                          width: (6.w),
                          height: (3.5.h),
                        ),
                        SizedBox(
                          width: (1.w),
                        ),
                        Text(
                          'LTCT',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: (12.sp),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: context.read<AssetsCubit>().getPlansCount(),
              itemBuilder: (context, index) => InkWell(
                radius: 0,
                onTap: () {
                  context.read<AssetsCubit>().getChartData(
                        context.read<AssetsCubit>().getPlans()[index].id,
                      );
                  context.read<AssetsCubit>().selectedPlanButton = index;
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color:
                            context.watch<AssetsCubit>().selectedPlanButton ==
                                    index
                                ? const Color(0xffFF4980)
                                : Colors.transparent,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      context.read<AssetsCubit>().getPlans()[index].id,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: (10.sp),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
