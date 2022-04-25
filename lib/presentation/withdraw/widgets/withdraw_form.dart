import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/withdraw/withdraw_cubit.dart';
import '../../shared_components/default_textfield.dart';

class WithdrawForm extends StatelessWidget {
  const WithdrawForm({
    Key? key,
    required this.formKey,
    required this.addressController,
    required this.amountController,
  }) : super(key: key);
  final GlobalKey formKey;
  final TextEditingController addressController;
  final TextEditingController amountController;
  @override
  Widget build(BuildContext context) {
    final _withdrawCubit = context.read<WithdrawCubit>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          DefaultTextField(
            text: '${_withdrawCubit.selectedCurrency} address',
            fontSize: 10.sp,
            controller: addressController,
            validator: (val) {
              if (val!.isEmpty) return 'Enter valid address';
              return null;
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          DefaultTextField(
            text: 'Amount',
            controller: amountController,
            inputType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
            ],
            validator: (val) {
              if (val!.isEmpty) {
                return 'Enter valid amount';
              } else if (double.parse(val) > double.parse(_withdrawCubit.getMaxBalance())) {
                return 'No sufficient balance';
              }
              return null;
            },
            suffixText: _withdrawCubit.selectedCurrency,
          ),
        ],
      ),
    );
  }
}
