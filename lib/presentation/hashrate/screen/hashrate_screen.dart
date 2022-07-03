import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/logic/cubit/hash_rate/hash_rate_cubit.dart';
import 'package:ebitcoiner/presentation/hashrate/widgets/plan_widget.dart';
import 'package:ebitcoiner/presentation/hashrate/widgets/hashrate_total_widget.dart';
import 'package:ebitcoiner/presentation/shared_components/default_toast.dart';
import 'package:ebitcoiner/presentation/shared_components/gradient_background_container.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sizer/sizer.dart';
import '../../../logic/cubit/assets/assets_cubit.dart';
import '../../shared_components/loading_widget.dart';

class HashRateScreen extends StatelessWidget {
  const HashRateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    void _onRefresh() async {
      await context.read<HashRateCubit>().getTotalPower();
      await context.read<AssetsCubit>().getUserData();
      _refreshController.refreshCompleted();
    }

    return BlocListener<HashRateCubit, HashRateState>(
      listener: (context, state) {
        if (state is HashRateGetPlanContractErrorState) {
          defaultToast(
            text: state.errorMessage,
            isError: true,
          );
        }
      },
      child: Stack(
        children: [
          const GradientBackgroundContainer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              header: WaterDropMaterialHeader(
                backgroundColor: ColorManager.secondary.withOpacity(0.8),
              ),
              onRefresh: _onRefresh,
              child: FutureBuilder(
                  future: context.read<HashRateCubit>().getTotalPower(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingWidget();
                    }
                    return SingleChildScrollView(
                      primary: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4.8.h,
                          ),
                          const HashrateTotalWidget(),
                          SizedBox(height: 5.h),
                          Text(
                            'Active Plans (${context.watch<AssetsCubit>().userData.activePlans})',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(height: 1.h),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: context
                                .watch<HashRateCubit>()
                                .activePlans
                                .length,
                            itemBuilder: (context, index) => PlanWidget(
                              isExpired: false,
                              totalMined: context
                                  .read<HashRateCubit>()
                                  .activePlans[index]
                                  .totalMined!
                                  .toStringAsFixed(6),
                              avgDailyIncome: context
                                  .read<HashRateCubit>()
                                  .getHourlyProfits(
                                      index: index, isActive: true),
                              bookingDate: context
                                  .read<HashRateCubit>()
                                  .activePlans[index]
                                  .startDate!,
                              expiredOn: context
                                  .read<HashRateCubit>()
                                  .activePlans[index]
                                  .endDate!,
                              currency: context
                                  .read<HashRateCubit>()
                                  .activePlans[index]
                                  .cryptoName!,
                              currencyPic: context
                                  .read<HashRateCubit>()
                                  .getCurrencyPic(index: index, isActive: true),
                              currentHashPower: context
                                  .read<HashRateCubit>()
                                  .activePlans[index]
                                  .hashPower!
                                  .toStringAsFixed(2),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 2.h,
                            ),
                            height: context.select(
                                    (HashRateCubit h) => h.isExpiredExpanded)
                                ? 45.h
                                : 10.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManager.darkPurple,
                              ),
                              borderRadius: BorderRadius.circular((8)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Expired plans (${context.read<HashRateCubit>().expiredPlans.length})',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context
                                              .read<HashRateCubit>()
                                              .changeExpiredSize();
                                        },
                                        child: Container(
                                          width: 8.w,
                                          height: 8.w,
                                          decoration: BoxDecoration(
                                            color: ColorManager.darkPurple,
                                            borderRadius: BorderRadius.circular(
                                              (32),
                                            ),
                                          ),
                                          child: SvgPicture.asset(
                                            context
                                                .read<HashRateCubit>()
                                                .expandedExpiredIcon,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                context.read<HashRateCubit>().isExpiredExpanded
                                    ? Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.h),
                                        height: 35.h,
                                        child: SingleChildScrollView(
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: context
                                                .read<HashRateCubit>()
                                                .expiredPlans
                                                .length,
                                            itemBuilder: (context, index) =>
                                                PlanWidget(
                                              isExpired: true,
                                              totalMined: context
                                                  .read<HashRateCubit>()
                                                  .expiredPlans[index]
                                                  .totalMined!
                                                  .toStringAsFixed(6),
                                              avgDailyIncome: context
                                                  .read<HashRateCubit>()
                                                  .getHourlyProfits(
                                                      index: index,
                                                      isActive: false),
                                              bookingDate: context
                                                  .read<HashRateCubit>()
                                                  .expiredPlans[index]
                                                  .startDate!,
                                              expiredOn: context
                                                  .read<HashRateCubit>()
                                                  .expiredPlans[index]
                                                  .endDate!,
                                              currency: context
                                                  .read<HashRateCubit>()
                                                  .expiredPlans[index]
                                                  .cryptoName!,
                                              currencyPic: context
                                                  .read<HashRateCubit>()
                                                  .getCurrencyPic(
                                                      index: index,
                                                      isActive: false),
                                              currentHashPower: context
                                                  .read<HashRateCubit>()
                                                  .expiredPlans[index]
                                                  .hashPower!
                                                  .toStringAsFixed(2),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
