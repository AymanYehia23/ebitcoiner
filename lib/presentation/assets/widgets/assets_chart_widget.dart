import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/logic/cubit/assets/assets_cubit.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/chart_model.dart';

class AssetsChartWidget extends StatelessWidget {
  final List<ChartData> data;
  const AssetsChartWidget({
    Key? key,
    required this.data,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Container(
      color: const Color(0xff1d1a27),
      width: double.infinity,
      height: s.h(300),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 100,
          interval: 25,
          labelFormat: '{value}' == '0' ? '{value}' : '{value}K',
        ),
        series: <ChartSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
            dataSource: context.watch<AssetsCubit>().chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: 'BTC',
            color: const Color(0xffff4980),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(s.h(5)),
              topRight: Radius.circular(s.h(5)),
            ),
            width: 0.5,
          ),
        ],
      ),
    );
  }
}
