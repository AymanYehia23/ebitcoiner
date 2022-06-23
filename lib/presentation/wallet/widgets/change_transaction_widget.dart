import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/wallet/wallet_cubit.dart';

class ChangeTransactionWidget extends StatelessWidget {
  const ChangeTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final isDeposit = context.watch<WalletCubit>().isDeposit;
      return Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                context.read<WalletCubit>().changeTransaction(true);
                await context.read<WalletCubit>().getDeposits();
              },
              child: Container(
                height: 6.h,
                child: Center(
                  child: Text(
                    'Deposit',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: (13.sp),
                          color: isDeposit
                              ? ColorManager.secondary
                              : ColorManager.lightGray,
                        ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: isDeposit
                      ? ColorManager.secondary.withOpacity(0.1)
                      : null,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.w),
                    bottomLeft: Radius.circular(2.w),
                  ),
                  border: Border.all(color: ColorManager.darkGray),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () async {
                context.read<WalletCubit>().changeTransaction(false);
                await context.read<WalletCubit>().getWithdraws();
              },
              child: Container(
                height: 6.h,
                child: Center(
                  child: Text(
                    'Withdraw',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: (13.sp),
                          color: isDeposit
                              ? ColorManager.lightGray
                              : ColorManager.secondary,
                        ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: isDeposit
                      ? null
                      : ColorManager.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2.w),
                    bottomRight: Radius.circular(2.w),
                  ),
                  border: Border.all(color: ColorManager.darkGray),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
