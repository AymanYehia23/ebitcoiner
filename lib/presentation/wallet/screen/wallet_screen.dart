import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/logic/cubit/wallet/wallet_cubit.dart';
import 'package:ebitcoiner/presentation/assets/widgets/assets_total_widget.dart';
import 'package:ebitcoiner/presentation/router/app_router.dart';
import 'package:ebitcoiner/presentation/wallet/widgets/change_transaction_widget.dart';
import 'package:ebitcoiner/presentation/wallet/widgets/deposit_widget.dart';
import 'package:ebitcoiner/presentation/wallet/widgets/withdraw_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/strings.dart';
import '../../../logic/cubit/assets/assets_cubit.dart';
import '../../shared_components/default_gradient_button.dart';
import '../../shared_components/default_toast.dart';
import '../../shared_components/gradient_background_container.dart';
import '../../shared_components/loading_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    void _onRefresh() async {
      await context.read<AssetsCubit>().getUserData();
      await context.read<AssetsCubit>().getUserBalance();
      if (context.read<WalletCubit>().isDeposit) {
        await context.read<WalletCubit>().getDeposits();
      } else {
        await context.read<WalletCubit>().getWithdraws();
      }
      _refreshController.refreshCompleted();
    }

    return BlocListener<WalletCubit, WalletState>(
      listener: (context, state) {
        if (state is WalletGetDepositsErrorState) {
          defaultToast(text: state.errorMessage, isError: true);
        }
        if (state is WalletGetWithdrawsErrorState) {
          defaultToast(text: state.errorMessage, isError: true);
        }
      },
      child: Stack(
        children: [
          const GradientBackgroundContainer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              header: WaterDropMaterialHeader(
                backgroundColor: ColorManager.secondary.withOpacity(0.8),
              ),
              onRefresh: _onRefresh,
              child: FutureBuilder(
                  future: context.read<WalletCubit>().isDeposit
                      ? context.read<WalletCubit>().getDeposits()
                      : context.read<WalletCubit>().getWithdraws(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingWidget();
                    }
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Balance',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          const AssetsTotalWidget(),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DefaultGradientButton(
                                  isFilled: false,
                                  height: 7.h,
                                  text: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Strings.plusIcon,
                                        width: 3.w,
                                        height: 3.h,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        'Deposit',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: (13.sp),
                                            ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouter.deposit);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Expanded(
                                child: DefaultGradientButton(
                                  isFilled: false,
                                  height: 7.h,
                                  text: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Strings.arrowUpRightIcon,
                                        width: 3.w,
                                        height: 3.h,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        'Withdraw',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: (13.sp),
                                            ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouter.withdraw);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Transaction History',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          const ChangeTransactionWidget(),
                          SizedBox(
                            height: 2.h,
                          ),
                          Builder(
                            builder: (context) {
                              final isDeposit =
                                  context.watch<WalletCubit>().isDeposit;
                              final depositList =
                                  context.read<WalletCubit>().depositList;
                              final withdrawList =
                                  context.read<WalletCubit>().withdrawList;
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: isDeposit
                                    ? depositList.length
                                    : withdrawList.length,
                                itemBuilder: ((context, index) {
                                  return isDeposit
                                      ? DepositWidget(
                                          id: depositList[index].txnId!,
                                          time: depositList[index].createdAt!,
                                          amount: depositList[index].amount!,
                                          currency:
                                              depositList[index].currency!,
                                          status: context
                                              .read<WalletCubit>()
                                              .getDepositsStatus(index),
                                        )
                                      : WithdrawWidget(
                                          id: withdrawList[index].txnId!,
                                          amount: withdrawList[index].amount!,
                                          currency:
                                              withdrawList[index].currency!,
                                          time: withdrawList[index].createdAt!,
                                          status: context
                                              .read<WalletCubit>()
                                              .getWithdrawsStatus(index),
                                          address: withdrawList[index].address!,
                                        );
                                }),
                              );
                            },
                          ),
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
