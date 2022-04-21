import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/logic/cubit/devices/devices_cubit.dart';
import 'package:hash_store/presentation/devices/widgets/miners_total_widget.dart';
import 'package:hash_store/presentation/devices/widgets/your_miners_widget.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/strings.dart';
import '../widgets/devices_change_chart_button.dart';
import '../widgets/devices_chart_widget.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 6.8.h,
        ),
        const GradientBackgroundContainer(),
        SingleChildScrollView(
          primary: true,
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
                Text(
                  'Miners Gains',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  width: double.infinity,
                  height: 7.h,
                  decoration: const BoxDecoration(
                    color: Color(0xff1d1a27),
                    border: Border(
                      bottom: BorderSide(
                        width: 0.7,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Last Profits',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Container(
                        width: 10.w,
                        height: 10.w,
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((40)),
                          color: const Color(0xff302c3f),
                        ),
                        child: SvgPicture.asset(
                          Strings.filterIcon,
                        ),
                      ),
                    ],
                  ),
                ),
                const DevicesChangeChartButton(),
                const DevicesChartWidget(),
                SizedBox(
                  height: 5.h,
                ),
                FutureBuilder(
                  future: context.read<DevicesCubit>().getAsicContract(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final asicContractList =
                        context.read<DevicesCubit>().asicContractList;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Miners (${asicContractList.length})',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: asicContractList.length,
                          itemBuilder: (context,index) {
                            return YourMinersWidget(
                              yourMinerPic: Strings.minerImage,
                              minerName: asicContractList[index].asicName!,
                              startDate: asicContractList[index].startDate!.substring(0,10),
                              totalMined: asicContractList[index].totalMined!.toStringAsFixed(2),
                              hostFees: '${asicContractList[index].hostFees}%',
                              status: context.read<DevicesCubit>().getAsicStatus(index),
                            );
                          }
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
