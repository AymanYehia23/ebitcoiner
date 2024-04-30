import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/core/constants/enums.dart';
import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/logic/cubit/withdraw/withdraw_cubit.dart';
import 'package:ebitcoiner/presentation/router/app_router.dart';
import 'package:ebitcoiner/presentation/shared_components/gradient_background_container.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sizer/sizer.dart';

import '../../../shared_components/loading_widget.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    void _onRefresh() async {
      await context.read<WithdrawCubit>().getUserData();
      _refreshController.refreshCompleted();
    }

    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ColorManager.black,
            title: Text(
              'Withdraw',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            header: WaterDropMaterialHeader(
              backgroundColor: ColorManager.secondary.withOpacity(0.8),
            ),
            onRefresh: _onRefresh,
            child: FutureBuilder(
                future: context.read<WithdrawCubit>().getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingWidget();
                  }
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                    height: 40.h,
                    width: double.infinity,
                    color: ColorManager.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Choose Currency to Withdraw',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<WithdrawCubit>()
                                .selectCurrency(Currency.btc);
                            Navigator.of(context)
                                .pushNamed(AppRouter.withdrawCurrency);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                Strings.btcIcon,
                                height: 4.h,
                                width: 8.w,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'BTC',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const Spacer(),
                              Text(
                                '${context.watch<WithdrawCubit>().userData.balance!.btc!.toStringAsFixed(12)} BTC',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () {
                            context
                                .read<WithdrawCubit>()
                                .selectCurrency(Currency.eth);
                            Navigator.of(context)
                                .pushNamed(AppRouter.withdrawCurrency);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                Strings.ethIcon,
                                height: 4.h,
                                width: 8.w,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'ETH',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const Spacer(),
                              Text(
                                '${context.watch<WithdrawCubit>().userData.balance!.eth!.toStringAsFixed(12)} ETH',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () {
                            context
                                .read<WithdrawCubit>()
                                .selectCurrency(Currency.rvn);
                            Navigator.of(context)
                                .pushNamed(AppRouter.withdrawCurrency);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                Strings.rvnIcon,
                                height: 4.h,
                                width: 8.w,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'RVN',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const Spacer(),
                              Text(
                                '${context.watch<WithdrawCubit>().userData.balance!.rvn!.toStringAsFixed(12)} RVN',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () {
                            context
                                .read<WithdrawCubit>()
                                .selectCurrency(Currency.ltct);
                            Navigator.of(context)
                                .pushNamed(AppRouter.withdrawCurrency);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                Strings.ltctIcon,
                                height: 4.h,
                                width: 8.w,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'LTCT',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const Spacer(),
                              Text(
                                '${context.watch<WithdrawCubit>().userData.balance!.ltct!.toStringAsFixed(12)} LTCT',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
