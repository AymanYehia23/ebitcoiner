import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/logic/cubit/plans/plans_cubit.dart';
import 'package:hash_store/presentation/add_plan/widgets/choose_desired_plan_widget.dart';
import 'package:hash_store/presentation/add_plan/widgets/contract_period_widget.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../widgets/choose_currency_widget.dart';

class ChooseDesiredPlanScreen extends StatelessWidget {
  const ChooseDesiredPlanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        BlocListener<PlansCubit, PlansState>(
          listener: (context, state) {
            if (state is AddPlansSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Purchased successfully'),
                  duration: Duration(seconds: 3),
                ),
              );
              Navigator.of(context).pushReplacementNamed(AppRouter.home);
            }
            if (state is AddPlansErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No sufficient balance'),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Add new hashrate plan',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 3.h,
                    ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              primary: true,
              child: Column(
                children: [
                  Container(
                    height: 30.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xff1d1a27),
                      border: Border(
                        bottom: BorderSide(
                          width: 0.1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 1.h),
                        Text(
                          'Choose Currency',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const ChooseCurrencyWidget(),
                        const Divider(),
                        Text(
                          'Contract period',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 1.h,
                          ),
                          child: const ContractPeriodWidget(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose desired Plan',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        FutureBuilder(
                            future: context.read<PlansCubit>().getPlans(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return BlocBuilder<PlansCubit, PlansState>(
                                builder: (context, state) {
                                  final plansModel =
                                      context.read<PlansCubit>().plansModel;
                                  if (state is GetPlansLoadingState) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: plansModel.plans!.length,
                                    itemBuilder: ((context, index) {
                                      return ChooseDesiredPlanWidget(
                                        planId: plansModel.plans![index].sId!,
                                        currencyIcn: context
                                            .read<PlansCubit>()
                                            .currencyIcon(),
                                        currencyName: plansModel
                                            .plans![index].cryptoName!,
                                        price:
                                            '\$${plansModel.plans![index].price.toString()}',
                                        minersPic: context
                                            .read<PlansCubit>()
                                            .minersPic(plansModel
                                                .plans![index].price!),
                                        profitability:
                                            'From ${plansModel.plans![index].profitability.toString()}%',
                                        power:
                                            '${plansModel.plansHashPower![index].hashrate!.toStringAsFixed(2)} ${context.read<PlansCubit>().unitOfPower()}',
                                        planDuration: context
                                                    .read<PlansCubit>()
                                                    .planType ==
                                                'long'
                                            ? '${plansModel.plans![index].planDuration!} Year'
                                            : '${plansModel.plans![index].planDuration!} Month',
                                        text:
                                            plansModel.plans![index].planName!,
                                            availability: plansModel.plans![index].availability!,
                                      );
                                    }),
                                  );
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
