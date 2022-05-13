import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                            ? const Color(0xffFF4980)
                            : const Color(0xffb7b4c7)),
                  ),
                ),
                decoration: BoxDecoration(
                  color: isDeposit
                      ? const Color(0xffFF4980).withOpacity(0.1)
                      : null,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.w),
                    bottomLeft: Radius.circular(2.w),
                  ),
                  border: Border.all(color: Colors.grey.shade900),
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
                            ? const Color(0xffb7b4c7)
                            : const Color(0xffFF4980)),
                  ),
                ),
                decoration: BoxDecoration(
                  color: isDeposit
                      ? null
                      : const Color(0xffFF4980).withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2.w),
                    bottomRight: Radius.circular(2.w),
                  ),
                  border: Border.all(color: Colors.grey.shade900),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
