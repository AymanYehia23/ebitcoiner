import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/data/models/chart_model.dart';
import 'package:hash_store/data/models/plan_contract_model.dart';
import 'package:hash_store/data/repositories/get_user_data_repo.dart';
import 'package:hash_store/data/repositories/plan_contract_repo.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/strings.dart';
import '../../../data/models/login_model.dart';
import '../../currency_converter_cubit.dart';

part 'assets_state.dart';

class AssetsCubit extends Cubit<AssetsState> {
  AssetsCubit(this._planContractRepo, this._userDataRepo, this.userData,
      this._converter)
      : super(AssetsInitial());

  final PlanContractRepo _planContractRepo;
  final UserDataRepo _userDataRepo;
  User userData;
  List<PlanContractModel> plansContractList = [];
  final CurrencyConverter _converter;

  Future<void> getPlanContract() async {
    emit(AssetsGetPlanContractLoadingState());
    try {
      plansContractList = await _planContractRepo.getPlanContract();
      emit(AssetsGetPlanContractSuccessState());
    } on DioError catch (_) {
      emit(AssetsGetPlanContractErrorState());
    }
  }

  Future<void> getUserData() async {
    emit(AssetsGetUserDataLoadingState());
    try {
      userData = await _userDataRepo.getUserData();
      emit(AssetsGetUserDataSuccessState());
    } on DioError catch (_) {
      emit(AssetsGetUserDataErrorState());
    }
  }

  //Assets total UI logic
  bool isExpanded = false;
  String expandedIcon = Strings.featherChevronDownIcon;
  double totalProfit = 0.0;
  double totalBTC = 0.0;
  double totalETH = 0.0;
  double totalLTCT = 0.0;

  Future<void> getTotalProfit() async {
    totalProfit = 0.0;
    totalBTC = 0.0;
    totalETH = 0.0;
    totalLTCT = 0.0;
    await getPlanContract();
    emit(AssetsGetTotalProfitLoadingState());
    if (plansContractList.isNotEmpty) {
      for (PlanContractModel element in plansContractList) {
        if (element.cryptoName == 'BTC') {
          totalBTC += await _converter.convertCryptocurrencyToUSD(
            currencyType: Currency.btc,
            currencyAmount: (element.totalMined! + userData.balance!.btc!),
          );
          totalBTC = double.parse((totalBTC).toStringAsFixed(2));
        } else if (element.cryptoName == 'ETH') {
          totalETH += await _converter.convertCryptocurrencyToUSD(
            currencyType: Currency.eth,
            currencyAmount: (element.totalMined! + userData.balance!.eth!),
          );
          totalETH = double.parse((totalETH).toStringAsFixed(2));
        } else if (element.cryptoName == 'LTCT') {
          totalLTCT += await _converter.convertCryptocurrencyToUSD(
            currencyType: Currency.ltct,
            currencyAmount: element.totalMined,
          );
          totalLTCT = double.parse((totalLTCT).toStringAsFixed(2));
        }
      }
      emit(AssetsGetTotalProfitSuccessState());
      totalProfit = totalBTC + totalETH + totalLTCT;
    } else {
      totalProfit = 0.0;
      totalBTC = 0.0;
      totalETH = 0.0;
      totalLTCT = 0.0;
      emit(AssetsGetTotalProfitEmptyState());
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
  int selectedPlanButton = -1;
  Currency currency = Currency.btc;
  List<ChartData> selectedChartData = [];
  List<ChartData> btcChartData = [];
  List<ChartData> ethChartData = [];
  List<ChartData> ltctChartData = [];
  List<ChartDataItem> btcChartDataList = [];
  List<ChartDataItem> ethChartDataList = [];
  List<ChartDataItem> ltctChartDataList = [];
  int btcPlanNumber = 0;
  int ethPlanNumber = 0;
  int ltctPlanNumber = 0;

  Future<void> getAllChartData() async {
    btcChartDataList = [];
    ethChartDataList = [];
    ltctChartDataList = [];
    btcChartData = [];
    ethChartData = [];
    ltctChartData = [];
    btcPlanNumber = 0;
    ethPlanNumber = 0;
    ltctPlanNumber = 0;
    emit(AssetsChartLoadingState());
    for (var plan in plansContractList) {
      if (plan.cryptoName == 'BTC') {
        for (var element in plan.hourlyGains!) {
          btcChartData.add(ChartData(element.date, element.profit as double));
        }
        btcChartDataList.add(
          ChartDataItem(
            'BTC Plan ${btcPlanNumber += 1}',
            plan.cryptoName,
            btcChartData,
          ),
        );
      } else if (plan.cryptoName == 'ETH') {
        for (var element in plan.hourlyGains!) {
          ethChartData.add(
            ChartData(
              element.date,
              element.profit as double,
            ),
          );
        }
        ethChartDataList.add(
          ChartDataItem(
            'ETH Plan ${ethPlanNumber += 1}',
            plan.cryptoName,
            ethChartData,
          ),
        );
      } else {
        for (var element in plan.hourlyGains!) {
          ltctChartData.add(ChartData(element.date, element.profit as double));
        }
        ltctChartDataList.add(
          ChartDataItem(
            'LTCT Plan ${ltctPlanNumber += 1}',
            plan.cryptoName,
            ltctChartData,
          ),
        );
      }
    }
    emit(AssetsChartSuccessState());
  }

  void changeChartButton(Currency selectedCurrency) {
    selectedChartData = [];
    selectedPlanButton = -1;
    if (selectedCurrency == Currency.btc) {
      currency = selectedCurrency;
      emit(AssetsChartBtcState());
    } else if (selectedCurrency == Currency.eth) {
      currency = selectedCurrency;
      emit(AssetsChartEthState());
    } else {
      currency = selectedCurrency;
      emit(AssetsChartLTCTState());
    }
  }

  int getPlansCount() {
    if (currency == Currency.btc) {
      return btcPlanNumber;
    } else if (currency == Currency.eth) {
      return ethPlanNumber;
    } else {
      return ltctPlanNumber;
    }
  }

  List<ChartDataItem> getPlans() {
    if (currency == Currency.btc) {
      return btcChartDataList;
    } else if (currency == Currency.eth) {
      return ethChartDataList;
    } else {
      return ltctChartDataList;
    }
  }

  void getChartData(String planId) {
    if (currency == Currency.btc) {
      selectedChartData = btcChartDataList
          .firstWhere((element) => element.id == planId)
          .chartDataList;
      emit(AssetsChartBtcDataState());
    } else if (currency == Currency.eth) {
      selectedChartData = ethChartDataList
          .firstWhere((element) => element.id == planId)
          .chartDataList;
      emit(AssetsChartEthDataState());
    } else {
      selectedChartData = ltctChartDataList
          .firstWhere((element) => element.id == planId)
          .chartDataList;
      emit(AssetsChartLTCTDataState());
    }
  }

  Future<void> getAllAssetsData() async {
    await getUserData();
    await getTotalProfit();
    await getAllChartData();
  }
}
