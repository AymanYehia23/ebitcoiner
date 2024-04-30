import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/logic/cubit/assets/assets_cubit.dart';

import 'package:sizer/sizer.dart';

class AssetsHeaderWidget extends StatelessWidget {
  const AssetsHeaderWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userName = context.read<AssetsCubit>().userData.userName;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello👋 $userName',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          'Available Balance',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
