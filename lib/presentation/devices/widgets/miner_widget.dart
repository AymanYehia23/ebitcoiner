import 'package:flutter/material.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/core/constants/enums.dart';
import 'package:sizer/sizer.dart';

class MinerWidget extends StatelessWidget {
  final String yourMinerPic;
  final String minerName;
  final String startDate;
  final String totalMined;
  final String hostFees;
  final AsicStatus status;

  const MinerWidget({
    Key? key,
    required this.yourMinerPic,
    required this.minerName,
    required this.startDate,
    required this.totalMined,
    required this.hostFees,
    required this.status,
  }) : super(key: key);

  Color borderColor() {
    if (status == AsicStatus.online) {
      return ColorManager.green;
    } else if (status == AsicStatus.offline) {
      return ColorManager.red;
    } else {
      return ColorManager.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      margin: EdgeInsets.only(bottom: 2.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        border: Border.all(color: borderColor()),
        borderRadius: BorderRadius.circular((8.0)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 2.h, left: 4.w),
            height: 10.h,
            child: Row(
              children: [
                Image.asset(
                  yourMinerPic,
                  height: 9.h,
                  width: 12.w,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  minerName,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 9.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start Date',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        startDate,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.sp,
                            ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 9.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Host Fees',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        hostFees,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.sp,
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 9.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Mined',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        totalMined,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.sp,
                            ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 9.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Status',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundColor: borderColor(), radius: 0.5.h),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            status.name,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 13.sp,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
