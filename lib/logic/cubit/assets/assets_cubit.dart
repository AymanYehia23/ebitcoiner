import 'package:bloc/bloc.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/data/models/chart_model.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/strings.dart';

part 'assets_state.dart';

class AssetsCubit extends Cubit<AssetsState> {
  AssetsCubit() : super(AssetsInitial());

  //Assets total UI logic
  bool isExpanded = false;
  String expandedIcon = Strings.featherChevronDownIcon;

  void changeSize() {
    isExpanded = !isExpanded;
    if (isExpanded == true) {
      expandedIcon = Strings.featherChevronUp;
    } else {
      expandedIcon = Strings.featherChevronDownIcon;
    }
    emit(AssetsTotalChangeSizeState());
  }

  //Chart UI logic
  List<ChartData> chartData = [];
  Currency currency = Currency.btc;

  void getChartData(Currency selectedCurrency) {
    emit(AssetsChartLoadingState());
    if (selectedCurrency == Currency.btc) {
      currency = selectedCurrency;
      chartData = [
        ChartData('Sun', 55),
        ChartData('Mon', 45),
        ChartData('Tue', 70),
        ChartData('Wed', 95),
        ChartData('Thu', 75),
        ChartData('Fri', 55),
        ChartData('Sat', 55),
      ];
      emit(AssetsChartBtcState());
    } else if (selectedCurrency == Currency.eth) {
      currency = selectedCurrency;

      chartData = [
        ChartData('Sun', 85),
        ChartData('Mon', 30),
        ChartData('Tue', 70),
        ChartData('Wed', 25),
        ChartData('Thu', 40),
        ChartData('Fri', 60),
        ChartData('Sat', 55),
      ];
      emit(AssetsChartEthState());
    } else {
      currency = selectedCurrency;
      chartData = [
        ChartData('Sun', 30),
        ChartData('Mon', 40),
        ChartData('Tue', 70),
        ChartData('Wed', 55),
        ChartData('Thu', 40),
        ChartData('Fri', 95),
        ChartData('Sat', 55),
      ];
      emit(AssetsChartRvnState());
    }
  }
}
