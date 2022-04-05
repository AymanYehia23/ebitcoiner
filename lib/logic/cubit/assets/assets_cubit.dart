import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/data/models/chart_model.dart';
import 'package:hash_store/data/models/plan_contract_model.dart';
import 'package:hash_store/data/repositories/plan_contract_repo.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/strings.dart';
import '../../currency_converter_cubit.dart';

part 'assets_state.dart';

class AssetsCubit extends Cubit<AssetsState> {
  AssetsCubit(
      this._planContractRepo, this._planContractsResponseModel, this._converter)
      : super(AssetsInitial());

  final PlanContractRepo _planContractRepo;
  PlanContractsResponseModel _planContractsResponseModel;
  final CurrencyConverter _converter;

  Future<void> getPlanContract() async {
    emit(AssetsGetPlanContractLoadingState());
    try {
      _planContractsResponseModel = await _planContractRepo.getPlanContract();
      emit(AssetsGetPlanContractSuccessState());
      await getTotalProfit();
    } on DioError catch (_) {
      emit(AssetsGetPlanContractErrorState());
    }
  }

  //Assets total UI logic
  bool isExpanded = false;
  String expandedIcon = Strings.featherChevronDownIcon;
  String totalProfit = '0.00000';
  String totalBTC = '0.00000';
  String totalETH = '0.00000';
  String totalRVN = '0.00000';

  Future<void> getTotalProfit() async {
    emit(AssetsGetTotalProfitLoadingState());
    if (_planContractsResponseModel.cryptoName == 'BTC') {
      totalProfit = await _converter.convertCryptocurrencyToUSD(
        currencyType: Currency.btc,
        currencyAmount: _planContractsResponseModel.totalMined,
      );
      totalBTC = totalProfit;
      emit(AssetsGetTotalProfitSuccessState());
    } else if (_planContractsResponseModel.cryptoName == 'ETH') {
      totalProfit = await _converter.convertCryptocurrencyToUSD(
        currencyType: Currency.eth,
        currencyAmount: _planContractsResponseModel.totalMined,
      );
      totalETH = totalProfit;
      emit(AssetsGetTotalProfitSuccessState());
    } else if (_planContractsResponseModel.cryptoName == 'RVN') {
      totalProfit = await _converter.convertCryptocurrencyToUSD(
        currencyType: Currency.rvn,
        currencyAmount: _planContractsResponseModel.totalMined,
      );
      totalRVN = totalProfit;
      emit(AssetsGetTotalProfitSuccessState());
    } else {
      totalProfit = '0.00000';
      totalBTC = '0.00000';
      totalETH = '0.00000';
      totalRVN = '0.00000';
      emit(AssetsGetTotalProfitErrorState());
    }
  }

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

  Future<void> getChartData(Currency selectedCurrency) async {
    emit(AssetsChartLoadingState());
    if (selectedCurrency == Currency.btc) {
      currency = selectedCurrency;
      chartData = [];
      if (_planContractsResponseModel.cryptoName == 'BTC') {
        for (var element in _planContractsResponseModel.hourlyGains!) {
          chartData.add(ChartData(element.date, element.profit as double));
        }
      }
      emit(AssetsChartBtcState());
    } else if (selectedCurrency == Currency.eth) {
      currency = selectedCurrency;
      chartData = [];
      if (_planContractsResponseModel.cryptoName == 'ETH') {
        for (var element in _planContractsResponseModel.hourlyGains!) {
          chartData.add(ChartData(element.date, element.profit as double));
        }
      }
      emit(AssetsChartEthState());
    } else {
      currency = selectedCurrency;
      chartData = [];
      if (_planContractsResponseModel.cryptoName == 'RVN') {
        for (var element in _planContractsResponseModel.hourlyGains!) {
          chartData.add(ChartData(element.date, element.profit as double));
        }
      }
      emit(AssetsChartRvnState());
    }
  }
}
