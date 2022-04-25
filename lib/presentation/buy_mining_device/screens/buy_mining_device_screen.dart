import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/logic/cubit/asics/asics_cubit.dart';
import 'package:hash_store/presentation/buy_mining_device/widgets/buy_mining_device_widget.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../router/app_router.dart';

class BuyMiningDeviceScreen extends StatelessWidget {
  const BuyMiningDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        BlocListener<AsicsCubit, AsicsState>(
          listener: (context, state) {
            if (state is AddAsicContractSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Purchased successfully'),
                  duration: Duration(seconds: 3),
                ),
              );
              Navigator.of(context).pushReplacementNamed(AppRouter.home);
            }
            if (state is AddAsicContractErrorState) {
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
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close_rounded, color: Colors.white),
                    ),
                    title: Title(
                      child: Text(
                        'Buy Mining Device',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 13.sp),
                      ),
                      color: Colors.white,
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
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          FutureBuilder(
                              future: context.read<AsicsCubit>().getAsics(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                final asicsList = context.read<AsicsCubit>().asicsList;
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
                                          .read<AsicsCubit>()
                                          .currencyIcon(index),
                                      currencyName: asicsList[index].cryptoName!,
                                      algorithm: asicsList[index].algorithm!,
                                      power:
                                          '${asicsList[index].hashPower!.toStringAsFixed(0)} GH/S',
                                      unitPrice:
                                          '\$${asicsList[index].price!.toString()}',
                                      maintenancePrice:
                                          '${asicsList[index].hostFees!.toString()}%',
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
