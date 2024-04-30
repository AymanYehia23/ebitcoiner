import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/presentation/shared_components/default_toast.dart';
import 'package:ebitcoiner/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/cubit/assets/assets_cubit.dart';
import '../../../../logic/cubit/hash_rate/hash_rate_cubit.dart';
import '../../../../logic/cubit/plan_contract/plan_contract_cubit.dart';
import '../../../shared_components/loading_dialog.dart';
import '../../../shared_components/loading_widget.dart';
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
          listener: (context, state) async {
            if (state is AddPlanContractSuccessState) {
              Navigator.of(context).pop();
              defaultToast(text: 'Purchased successfully');
              await context.read<HashRateCubit>().getTotalPower();
              await context.read<AssetsCubit>().getUserData();
            } else if (state is AddPlanContractLoadingState) {
              loadingDialog(context: context);
            } else if (state is AddPlanContractErrorState) {
              Navigator.of(context).pop();
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
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                      color: ColorManager.primary,
                      border: Border(
                        bottom: BorderSide(
                          width: 0.1,
                          color: ColorManager.gray,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 1.h),
                        Text(
                          'Choose Currency',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                                return const LoadingWidget();
                              }
                              return BlocBuilder<PlanContractCubit,
                                  PlanContractState>(
                                builder: (context, state) {
                                  final plansModel = context
                                      .read<PlanContractCubit>()
                                      .plansModel;
                                  if (state is GetPlansLoadingState) {
                                    return const LoadingWidget();
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
