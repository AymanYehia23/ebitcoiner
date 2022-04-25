import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/logic/cubit/assets/assets_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/chart_model.dart';

class AssetsChartWidget extends StatelessWidget {
  const AssetsChartWidget({
    Key? key,
  }) : super(
          key: key,
        );
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<AssetsCubit>().getAllChartData(),
      builder: (context,snapshot) {
        return Container(
          color: const Color(0xff1d1a27),
          width: double.infinity,
          height: 30.h,
          child: Builder(builder: (context) {
            final planContractState = context.watch<AssetsCubit>().state;
            if (planContractState is AssetsGetPlanContractLoadingState ||
                planContractState is AssetsChartLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SfCartesianChart(
              primaryXAxis: CategoryAxis(
                visibleMinimum: 4,
                visibleMaximum: 8,
                interval: 0.5,
              ),
              primaryYAxis: NumericAxis(
                minimum: context.read<AssetsCubit>().getMaxChartValue(),
                maximum: context.read<AssetsCubit>().getMinChartValue(),
                interval: context.read<AssetsCubit>().getInterChartValue(),
                labelFormat: '{value}',
                decimalPlaces: 5,
              ),
              zoomPanBehavior: ZoomPanBehavior(
                enablePanning: true,
              ),
              series: <ChartSeries<ChartData, String>>[
                ColumnSeries<ChartData, String>(
                  dataSource: context.read<AssetsCubit>().selectedChartData,
                  xValueMapper: (ChartData data, _) =>
                      data.x!.isNotEmpty ? data.x?.substring(14, 19) : data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  color: const Color(0xffff4980),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular((5)),
                    topRight: Radius.circular((5)),
                  ),
                  width: 0.5,
                ),
              ],
            );
          }),
        );
      }
    );
  }
}
