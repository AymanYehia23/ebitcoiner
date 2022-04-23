import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/logic/cubit/asics/asics_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/enums.dart';
import '../../../core/constants/strings.dart';
import '../../shared_components/default_gradient_button.dart';

class ChooseAsicPaymentCurrency extends StatelessWidget {
  const ChooseAsicPaymentCurrency({Key? key,required this.asicId}) : super(key: key);
  final String asicId;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      color: Colors.black54,
      height: 25.h,
      child: BlocBuilder<AsicsCubit, AsicsState>(
        builder: (context, state) {
          if (state is AddAsicContractLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Text(
                'Choose the payment currency',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                width: double.infinity,
                height: (6.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<AsicsCubit>()
                                .choosePaymentCurrency(Currency.btc);
                          },
                          child: Container(
                            width: (20.w),
                            height: (4.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular((20)),
                              color:
                                  context.watch<AsicsCubit>().paymentCurrency ==
                                          'BTC'
                                      ? const Color(0xff302c3f)
                                      : null,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Strings.btcIcon,
                                  width: (3.w),
                                  height: (3.h),
                                ),
                                SizedBox(
                                  width: (1.w),
                                ),
                                Text(
                                  'BTC',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: (12.sp),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<AsicsCubit>()
                                .choosePaymentCurrency(Currency.eth);
                          },
                          child: Container(
                            width: (20.w),
                            height: (4.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular((20)),
                              color:
                                  context.watch<AsicsCubit>().paymentCurrency ==
                                          'ETH'
                                      ? const Color(0xff302c3f)
                                      : null,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Strings.ethIcon,
                                  width: (24),
                                  height: (24),
                                ),
                                SizedBox(
                                  width: (1.w),
                                ),
                                Text(
                                  'ETH',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: (12.sp),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<AsicsCubit>()
                                .choosePaymentCurrency(Currency.rvn);
                          },
                          child: Container(
                            width: (20.w),
                            height: (4.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular((20)),
                              color:
                                  context.watch<AsicsCubit>().paymentCurrency ==
                                          'RVN'
                                      ? const Color(0xff302c3f)
                                      : null,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Strings.rvnIcon,
                                  width: (3.5.w),
                                  height: (3.5.h),
                                ),
                                SizedBox(
                                  width: (1.w),
                                ),
                                Text(
                                  'RVN',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: DefaultGradientButton(
                  isFilled: false,
                  height: 4.h,
                  text: Text(
                    'Buy now',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: (12.sp),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  onPressed: () async {
                    await context.read<AsicsCubit>().addAsicContract(asicId);
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
