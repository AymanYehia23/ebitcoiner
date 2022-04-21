import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/hash_rate/hash_rate_cubit.dart';

class ExpiredPlansWidget extends StatelessWidget {
  const ExpiredPlansWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 2.h,
      ),
      height:
          context.select((HashRateCubit h) => h.isExpiredExpanded) ? 40.h : 9.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff302C3F),
        ),
        borderRadius: BorderRadius.circular((8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Expired plans (0)',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              InkWell(
                onTap: () {
                  context.read<HashRateCubit>().changeExpiredSize();
                },
                child: Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: const Color(0xff302c3f),
                    borderRadius: BorderRadius.circular(
                      (32),
                    ),
                  ),
                  child: SvgPicture.asset(
                    context.read<HashRateCubit>().expandedExpiredIcon,
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
