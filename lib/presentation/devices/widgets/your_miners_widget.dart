import 'package:flutter/material.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:sizer/sizer.dart';

class YourMinersWidget extends StatelessWidget {
  final String yourMinerPic;
  final String minerName;
  final String startDate;
  final String totalMined;
  final String hostFees;
  final Status status;

  const YourMinersWidget({
    Key? key,
    required this.yourMinerPic,
    required this.minerName,
    required this.startDate,
    required this.totalMined,
    required this.hostFees,
    required this.status,
  }) : super(key: key);

  Color borderColor(){
    if(status == Status.online){
      return Colors.green;
    }
    else if(status == Status.offline){
      return Colors.red;
    }
    else{
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      margin: EdgeInsets.only(bottom: 2.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1d1a27),
        border: Border.all(
          color: borderColor()
        ),
        borderRadius: BorderRadius.circular((8.0)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 2.h, left: 4.w),
            height: 10.h,
            child: Row(
              children: [
                Image(
                  height: 9.h,
                  width: 12.w,
                  image: AssetImage(yourMinerPic),
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
                          CircleAvatar(backgroundColor: borderColor(),radius: 0.5.h),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            status.name,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
