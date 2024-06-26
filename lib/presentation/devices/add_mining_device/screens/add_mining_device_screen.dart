import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/cubit/asic_contract/asic_contract_cubit.dart';
import '../../../../logic/cubit/devices/devices_cubit.dart';
import '../../../shared_components/default_toast.dart';
import '../../../shared_components/loading_dialog.dart';
import '../../../shared_components/loading_widget.dart';
import '../widgets/buy_mining_device_widget.dart';

class BuyMiningDeviceScreen extends StatelessWidget {
  const BuyMiningDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        BlocListener<AsicContractCubit, AsicContractState>(
          listener: (context, state) async {
            if (state is AddAsicContractSuccessState) {
              Navigator.of(context).pop();
              defaultToast(text: 'Purchased successfully');
              await context.read<DevicesCubit>().getAsicContract();
            } else if (state is AddAsicContractLoadingState) {
              loadingDialog(context: context);
            } else if (state is AddAsicContractErrorState) {
              Navigator.of(context).pop();
              defaultToast(
                text: state.errorMessage,
                isError: true,
              );
            }
            if (state is GetAsicsErrorState) {
              defaultToast(
                text: state.errorMessage,
                isError: true,
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon:
                    const Icon(Icons.close_rounded, color: ColorManager.white),
              ),
              title: Title(
                child: Text(
                  'Buy Mining Device',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 13.sp),
                ),
                color: ColorManager.white,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              primary: true,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Choose desired device',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FutureBuilder(
                        future: context.read<AsicContractCubit>().getAsics(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const LoadingWidget();
                          }
                          final asicsList =
                              context.read<AsicContractCubit>().asicsList;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: asicsList.length,
                            itemBuilder: ((context, index) {
                              return BuyMiningDeviceWidget(
                                asicId: asicsList[index].sId!,
                                yourMinerPic: Strings.minerImage,
                                yourMinerName: asicsList[index].asicName!,
                                currencyIcon: context
                                    .read<AsicContractCubit>()
                                    .currencyIcon(index),
                                currencyName: asicsList[index].cryptoName!,
                                algorithm: asicsList[index].algorithm!,
                                power:
                                    '${asicsList[index].hashPower!.toStringAsFixed(0)} GH/S',
                                unitPrice:
                                    '\$${asicsList[index].price.toString()}',
                                maintenancePrice:
                                    '${asicsList[index].hostFees.toString()}%',
                                availability: asicsList[index].availability!,
                              );
                            }),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
