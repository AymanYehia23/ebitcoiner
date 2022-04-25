import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/presentation/assets/widgets/assets_total_widget.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/strings.dart';
import '../../shared_components/default_gradient_button.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Balance',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
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
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
