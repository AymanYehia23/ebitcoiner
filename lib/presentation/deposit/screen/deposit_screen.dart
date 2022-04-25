import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/logic/cubit/deposit/deposit_cubit.dart';
import 'package:hash_store/logic/cubit/withdraw/withdraw_cubit.dart';
import 'package:hash_store/presentation/shared_components/default_textfield.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';
import '../widgets/choose_deposit_currency_widget.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  late TextEditingController _addressController;

  @override
  void initState() {
    _addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text(
              'Deposit',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  height: 9.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff302c3f),
                    borderRadius: BorderRadius.circular(2.w),
                  ),
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
                        'You can only deposit from wallet\nto your balance',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                  height: 9.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff302c3f),
                    borderRadius: BorderRadius.circular(2.w),
                  ),
                  child: Center(
                    child: Text(
                      'Choose Currency to Deposit',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                const ChooseDepositCurrencyWidget(),
                SizedBox(
                  height: 6.h,
                ),
                BlocBuilder<WithdrawCubit, WithdrawState>(
                  builder: (context, state) {
                    final _address = context
                        .watch<DepositCubit>()
                        .depositAddressModel
                        .address!;

                    _addressController.text = _address;
                    return Column(
                      children: [
                        DefaultTextField(
                          text: 'Address',
                          readOnly: true,
                          controller: _addressController,
                          fontSize: 10.sp,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.copy),
                            color: Colors.white,
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: _address));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('copied to clipboard'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                          ),
                          borderColor: Colors.transparent,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        context.watch<DepositCubit>().depositCurrency == ''
                            ? const SizedBox()
                            : QrImage(
                                data: _address,
                                version: QrVersions.auto,
                                size: 200.0,
                                backgroundColor: Colors.white,
                              ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
