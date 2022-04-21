import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/chart_model.dart';

class DevicesChartWidget extends StatelessWidget {
  const DevicesChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1d1a27),
      width: double.infinity,
      height: 30.h,
      child: Builder(builder: (context) {
        return SfCartesianChart(
          primaryXAxis: CategoryAxis(
            visibleMinimum: 4,
            visibleMaximum: 8,
            interval: 0.5,
          ),
          primaryYAxis: NumericAxis(
            minimum: 0.00001,
            maximum: 0.0001,
            interval: 0.00001,
            labelFormat: '{value}',
            decimalPlaces: 7,
          ),
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
          ),
          series: <ChartSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              dataSource: [],
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
}