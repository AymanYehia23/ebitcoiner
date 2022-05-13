import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/presentation/shared_components/default_toast.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/cubit/plan_contract/plan_contract_cubit.dart';
import '../widgets/buy_plan_widget.dart';
import '../../add_plan/widgets/contract_period_widget.dart';
import '../widgets/plan_currency_widget.dart';

class ChooseDesiredPlanScreen extends StatelessWidget {
  const ChooseDesiredPlanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        BlocListener<PlanContractCubit, PlanContractState>(
          listener: (context, state) {
            if (state is AddPlanContractSuccessState) {
              defaultToast( text: 'Purchased successfully');
              Navigator.of(context).pop();
            }
            if (state is AddPlanContractErrorState) {
              defaultToast(
                text: state.errorMessage,
                isError: true,
              );
            }
            if (state is GetPlansErrorState) {
              defaultToast(
                text: state.errorMessage,
                isError: true,
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
                        const PlanCurrencyWidget(),
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
                            future:
                                context.read<PlanContractCubit>().getPlans(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return BlocBuilder<PlanContractCubit,
                                  PlanContractState>(
                                builder: (context, state) {
                                  final plansModel = context
                                      .read<PlanContractCubit>()
                                      .plansModel;
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
                                      return BuyPlanWidget(
                                        planId: plansModel.plans![index].sId!,
                                        currencyIcn: context
                                            .read<PlanContractCubit>()
                                            .currencyIcon(),
                                        currencyName: plansModel
                                            .plans![index].cryptoName!,
                                        price:
                                            '\$${plansModel.plans![index].price.toString()}',
                                        minersPic: context
                                            .read<PlanContractCubit>()
                                            .minersPic(plansModel
                                                .plans![index].price!),
                                        profitability:
                                            'From ${plansModel.plans![index].profitability.toString()}%',
                                        power:
                                            '${plansModel.plansHashPower![index].hashrate!.toStringAsFixed(2)} GH/S',
                                        planDuration: context
                                                    .read<PlanContractCubit>()
                                                    .planType ==
                                                'long'
                                            ? '${plansModel.plans![index].planDuration!} Year'
                                            : '${plansModel.plans![index].planDuration!} Month',
                                        text:
                                            plansModel.plans![index].planName!,
                                        availability: plansModel
                                            .plans![index].availability!,
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