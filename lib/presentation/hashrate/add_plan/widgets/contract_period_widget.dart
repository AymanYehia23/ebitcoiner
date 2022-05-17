import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/cubit/plan_contract/plan_contract_cubit.dart';

class ContractPeriodWidget extends StatelessWidget {
  const ContractPeriodWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                context
                    .read<PlanContractCubit>()
                    .chooseContractPeriod(Period.long);
              },
              child: Builder(
                builder: (context) {
                  if (context.watch<PlanContractCubit>().planType == 'long') {
                    return DefaultGradientButton(
                      isFilled: false,
                      radius: 8.0,
                      text: Text(
                        'Long',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      onPressed: () {},
                    );
                  }
                  return Container(
                    width: 40.w,
                    height: 9.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff302c3f),
                      borderRadius: BorderRadius.circular(
                        (8.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Long',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                context
                    .read<PlanContractCubit>()
                    .chooseContractPeriod(Period.short);
              },
              child: Builder(
                builder: (context) {
                  if (context.watch<PlanContractCubit>().planType == 'short') {
                    return DefaultGradientButton(
                      radius: 8.0,
                      isFilled: false,
                      text: Text(
                        'Short',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      onPressed: () {},
                    );
                  }
                  return Container(
                    width: 40.w,
                    height: 9.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff302c3f),
                      borderRadius: BorderRadius.circular(
                        (8.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Short',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
