import 'package:flutter/material.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/core/constants/enums.dart';
import 'package:sizer/sizer.dart';

class DepositWidget extends StatelessWidget {
  const DepositWidget({
    Key? key,
    required this.id,
    required this.amount,
    required this.currency,
    required this.time,
    required this.status,
  }) : super(key: key);
  final String id;
  final String amount;
  final String currency;
  final String time;
  final TransactionStatus status;

  Color getStatusColor() {
    if (status == TransactionStatus.processing) {
      return ColorManager.blue;
    } else if (status == TransactionStatus.sent) {
      return ColorManager.green;
    } else {
      return ColorManager.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          height: 10.h,
          color: ColorManager.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ID: $id',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: (11.sp),
                        ),
                  ),
                  Text(
                    '$amount $currency',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: (11.sp),
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    time,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: (10.sp),
                        ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: getStatusColor(), radius: 0.5.h),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        status.name,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: (10.sp),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
