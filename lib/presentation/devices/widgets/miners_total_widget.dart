import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/logic/cubit/devices/devices_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/strings.dart';

class MinersTotalWidget extends StatelessWidget {
  const MinersTotalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<DevicesCubit>().getAsicContract(),
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 2.h,
          ),
          height: 12.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff1d1a27),
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular((8)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Strings.miningIcon,
                width: (4.w),
                height: (3.h),
              ),
              SizedBox(
                width: 2.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Miners Total Mined',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Builder(builder: (context) {
                    return Text(
                      '${context.watch<DevicesCubit>().totalMined.toStringAsFixed(2)} GH/S',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    );
                  })
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
