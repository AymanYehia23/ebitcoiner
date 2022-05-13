class ChartDataItem {
  ChartDataItem(this.id, this.currencyName, this.chartDataList);
  String id;
  String currencyName;
  List<ChartData> chartDataList;
}

class ChartData {
  ChartData(this.x, this.y);

  String x;
  double y;
}
