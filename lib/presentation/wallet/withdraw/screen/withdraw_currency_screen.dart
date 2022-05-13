import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/logic/cubit/withdraw/withdraw_cubit.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/shared_components/default_toast.dart';
import 'package:sizer/sizer.dart';

import '../../../shared_components/default_disabled_button.dart';
import '../../../shared_components/gradient_background_container.dart';
import '../../withdraw/widgets/withdraw_form.dart';

class WithdrawCurrencyScreen extends StatefulWidget {
  const WithdrawCurrencyScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawCurrencyScreen> createState() => _WithdrawCurrencyScreenState();
}

class _WithdrawCurrencyScreenState extends State<WithdrawCurrencyScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _addressController;
  late final TextEditingController _amountController;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await context
          .read<WithdrawCubit>()
          .withdrawRequest(_addressController.text.trim(), _amountController.text.trim());
    }
  }

  @override
  void initState() {
    _formKey = GlobalKey();
    _addressController = TextEditingController();
    _amountController = TextEditingController();
    _addressController.addListener(_checkOfEmptyValue);
    _amountController.addListener(_checkOfEmptyValue);
    context.read<WithdrawCubit>().changeIsEmpty(true);
    super.initState();
  }

  void _checkOfEmptyValue() {
    if (_addressController.text.isNotEmpty &&
        _amountController.text.isNotEmpty) {
      context.read<WithdrawCubit>().changeIsEmpty(false);
    } else {
      context.read<WithdrawCubit>().changeIsEmpty(true);
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    final _withdrawCubit = context.read<WithdrawCubit>();
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text(
              'Withdraw ${_withdrawCubit.selectedCurrency}',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          body: BlocListener<WithdrawCubit, WithdrawState>(
            listener: (context, state) {
              if (state is WithdrawRequestSuccessState) {
                defaultToast(
                    text: 'Withdrawal request completed successfully');
                Navigator.of(context).pushReplacementNamed(AppRouter.home);
              } else if (state is WithdrawRequestErrorState) {
                defaultToast(
                  text: state.errorMessage,
                  isError: true,
                );
              }
            },
            child: SingleChildScrollView(
              child: SizedBox(
                height: _height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Column(
                    children: [
                      Container(
                        height: 9.h,
                        decoration: BoxDecoration(
                          color: const Color(0xff302c3f),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.h),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: (0.5.h * 1.5.w),
                                color: const Color(0xffb7b4c7),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                'You can only withdraw from ${_withdrawCubit.selectedCurrency}\nbalance to ${_withdrawCubit.selectedCurrency} wallet',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 12.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      WithdrawForm(
                        formKey: _formKey,
                        addressController: _addressController,
                        amountController: _amountController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_withdrawCubit.getAvailableBalance()} ${_withdrawCubit.selectedCurrency} Available',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 10.sp,
                                    ),
                          ),
                          TextButton(
                            onPressed: () {
                              _amountController.text =
                                  _withdrawCubit.getMaxWithdrawBalance();
                            },
                            child: Text(
                              'Max Amount',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 11.sp,
                                    color: const Color(0xffFF4980),
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Builder(builder: (context) {
                        if (context.select((WithdrawCubit w) => w.isEmpty)) {
                          return DefaultDisabledButton(
                            text: Text(
                              'Withdraw',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          );
                        }
                        return DefaultGradientButton(
                          isFilled: true,
                          text: BlocBuilder<WithdrawCubit, WithdrawState>(
                            builder: (context, state) {
                              if (state is WithdrawRequestLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Text(
                                'Withdraw',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              );
                            },
                          ),
                          onPressed: () {
                            _submit();
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
