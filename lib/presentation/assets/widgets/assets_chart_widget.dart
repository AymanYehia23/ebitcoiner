import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/logic/cubit/assets/assets_cubit.dart';
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
        return BlocBuilder<AssetsCubit, AssetsState>(
          builder: (context, state) {
            if (state is AssetsGetPlanContractLoadingState) {
              return Container(
                color: ColorManager.primary,
                width: double.infinity,
                height: 30.h,
              );
            }
            return Container(
              color: ColorManager.primary,
              width: double.infinity,
              height: 30.h,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  visibleMinimum: 4,
                  visibleMaximum: 8,
                  interval: 0.5,
                ),
                primaryYAxis: NumericAxis(
                  minimum: context.watch<AssetsCubit>().getMaxChartValue(),
                  maximum: context.watch<AssetsCubit>().getMinChartValue(),
                  interval: context.watch<AssetsCubit>().getInterChartValue(),
                  labelFormat: '{value}',
                  decimalPlaces: 5,
                ),
                zoomPanBehavior: ZoomPanBehavior(
                  enablePanning: true,
                ),
                series: <ChartSeries<ChartData, String>>[
                  ColumnSeries<ChartData, String>(
                    dataSource: context.watch<AssetsCubit>().selectedChartData,
                    xValueMapper: (ChartData data, _) =>
                        data.x.isNotEmpty ? data.x.substring(14, 19) : data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    color: ColorManager.secondary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular((5)),
                      topRight: Radius.circular((5)),
                    ),
                    width: 0.5,
                  ),
                ],
              ),
            );
          },
        );
      }
    );
  }
}
