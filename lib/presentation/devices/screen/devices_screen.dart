import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/logic/cubit/devices/devices_cubit.dart';
import 'package:ebitcoiner/presentation/devices/widgets/miners_total_widget.dart';
import 'package:ebitcoiner/presentation/devices/widgets/miner_widget.dart';
import 'package:ebitcoiner/presentation/shared_components/gradient_background_container.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/strings.dart';
import '../../shared_components/default_toast.dart';
import '../../shared_components/loading_dialog.dart';
import '../../shared_components/loading_widget.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    void _onRefresh() async {
      await context.read<DevicesCubit>().getAsicContract();
      _refreshController.refreshCompleted();
    }

    return BlocListener<DevicesCubit, DevicesState>(
      listener: (context, state) {
        if (state is UnauthorizedDevicesState) {
          loadingDialog(context: context);
        }
        if (state is GetAsicContractErrorState) {
          defaultToast(
            text: state.errorMessage,
            isError: true,
          );
        }
      },
      child: Stack(
        children: [
          const GradientBackgroundContainer(),
          SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            header: WaterDropMaterialHeader(
              backgroundColor: ColorManager.secondary.withOpacity(0.8),
            ),
            onRefresh: _onRefresh,
            child: FutureBuilder(
              future: context.read<DevicesCubit>().getAsicContract(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingWidget();
                }
                final asicContractList =
                    context.watch<DevicesCubit>().asicContractList;
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4.5.h,
                            ),
                            const MinersTotalWidget(),
                            SizedBox(
                              height: 5.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Miners (${asicContractList.length})',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: MinerWidget(
                              yourMinerPic: Strings.minerImage,
                              minerName: asicContractList[index].asicName!,
                              startDate: asicContractList[index].startDate!,
                              totalMined: asicContractList[index]
                                  .totalMined!
                                  .toStringAsFixed(2),
                              hostFees: '${asicContractList[index].hostFees}%',
                              status: context
                                  .read<DevicesCubit>()
                                  .getAsicStatus(index),
                            ),
                          );
                        },
                        childCount: asicContractList.length,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 12.h,
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
