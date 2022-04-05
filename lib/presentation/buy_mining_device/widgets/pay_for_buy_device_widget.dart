import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'buy_mining_device_widget.dart';

class PayForBuyDevice extends StatelessWidget {
  final String yourMinerPic;
  final String yourMinerName;
  final String yourMinerRate;
  const PayForBuyDevice({
    Key? key,
    required this.yourMinerPic,
    required this.yourMinerName,
    required this.yourMinerRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(top: 4.h),
            color: const Color(0xff1d1a27),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(
                yourMinerPic,
                height: 7.h,
                width: 7.h,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                yourMinerName,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 0.25.h,
              ),
              Text(
                yourMinerRate,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 12.5.sp,
                      color: const Color.fromRGBO(255, 73, 128, 1),
                    ),
              ),
            ]),
          );
  }
}
