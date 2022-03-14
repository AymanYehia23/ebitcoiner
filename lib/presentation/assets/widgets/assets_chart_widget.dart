import 'package:flutter/material.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/chart_model.dart';

class AssetsChartWidget extends StatefulWidget {
  final List<ChartData> data;
  const AssetsChartWidget({
    Key? key,
    required this.data,
  }) : super(
          key: key,
        );

  @override
  State<AssetsChartWidget> createState() => _AssetsChartWidgetState();
}

class _AssetsChartWidgetState extends State<AssetsChartWidget> {
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
            dataSource: widget.data,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: 'BTC',
            color: const Color(0xffff4980),
            borderRadius: BorderRadius.all(
              Radius.circular(s.h(5)),
            ),
            width: 0.5,
          ),
        ],
      ),
    );
  }
}
