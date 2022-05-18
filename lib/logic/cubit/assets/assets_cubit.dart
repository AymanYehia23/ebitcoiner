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
import '../../../data/data_providers/currency_converter_api.dart';

part 'assets_state.dart';

class AssetsCubit extends Cubit<AssetsState> {
  AssetsCubit(this._planContractRepo, this._userDataRepo, this.userData,
      this._converter)
      : super(AssetsInitial());

  final PlanContractRepo _planContractRepo;
  final UserDataRepo _userDataRepo;
  User userData;
  List<GetPlanContractResponseModel> plansContractList = [];
  final CurrencyConverter _converter;

  Future<void> getPlanContract() async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(AssetsGetPlanContractLoadingState());
    try {
      plansContractList = await _planContractRepo.getPlanContract();
      emit(AssetsGetPlanContractSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      }
      emit(AssetsGetPlanContractErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(AssetsGetPlanContractErrorState(errorMessage: errorMessage));
    }
  }

  Future<void> getUserData() async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(AssetsGetUserDataLoadingState());
    try {
      userData = await _userDataRepo.getUserData();
      emit(AssetsGetUserDataSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else if (error.response!.statusCode == 401) {
        emit(UnauthorizedAssetsState());
        return;
      }
      emit(AssetsGetUserDataErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(AssetsGetUserDataErrorState(errorMessage: errorMessage));
    }
  }

  //Assets total UI logic
  bool isExpanded = false;
  String expandedIcon = Strings.featherChevronDownIcon;
  double totalBTC = 0.0;
  double totalETH = 0.0;
  double totalRVN = 0.0;
  double totalLTCT = 0.0;
  double totalBalance = 0.0;

  Future<void> getUserBalance() async {
    totalBTC = await _converter.convertCryptocurrencyToUSD(
      currencyType: Currency.btc,
      currencyAmount: (userData.balance!.btc!),
    );
    totalBTC = double.parse((totalBTC).toStringAsFixed(2));

    totalETH = await _converter.convertCryptocurrencyToUSD(
      currencyType: Currency.eth,
      currencyAmount: (userData.balance!.eth!),
    );
    totalETH = double.parse((totalETH).toStringAsFixed(2));

    totalRVN = await _converter.convertCryptocurrencyToUSD(
      currencyType: Currency.rvn,
      currencyAmount: (userData.balance!.rvn!),
    );
    totalRVN = double.parse((totalRVN).toStringAsFixed(2));

    totalLTCT = await _converter.convertCryptocurrencyToUSD(
      currencyType: Currency.ltct,
      currencyAmount: (userData.balance!.ltct!),
    );
    totalLTCT = double.parse((totalLTCT).toStringAsFixed(2));

    totalBalance = totalBTC + totalETH + totalRVN + totalLTCT;
    totalBalance = double.parse((totalBalance).toStringAsFixed(2));
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
  Currency currency = Currency.non;
  List<ChartData> selectedChartData = [];
  List<ChartData> btcChartData = [];
  List<ChartData> ethChartData = [];
  List<ChartData> rvnChartData = [];
  List<ChartData> ltctChartData = [];
  List<ChartDataItem> btcChartDataList = [];
  List<ChartDataItem> ethChartDataList = [];
  List<ChartDataItem> rvnChartDataList = [];
  List<ChartDataItem> ltctChartDataList = [];
  int btcPlanNumber = 0;
  int ethPlanNumber = 0;
  int rvnPlanNumber = 0;
  int ltctPlanNumber = 0;

  Future<void> getAllChartData() async {
    await getPlanContract();
    btcChartDataList = [];
    ethChartDataList = [];
    rvnChartDataList = [];
    ltctChartDataList = [];
    btcChartData = [];
    ethChartData = [];
    rvnChartData = [];
    ltctChartData = [];
    btcPlanNumber = 0;
    ethPlanNumber = 0;
    rvnPlanNumber = 0;
    ltctPlanNumber = 0;
    emit(AssetsChartLoadingState());
    for (var plan in plansContractList) {
      if (plan.cryptoName == 'BTC' && plan.planStatus!) {
        for (var element in plan.hourlyGains!) {
          btcChartData.add(ChartData(element.date!, element.profit!));
        }
        btcChartDataList.add(
          ChartDataItem(
            'BTC Plan ${btcPlanNumber += 1}',
            plan.cryptoName!,
            btcChartData,
          ),
        );
      } else if (plan.cryptoName == 'ETH' && plan.planStatus!) {
        for (var element in plan.hourlyGains!) {
          ethChartData.add(
            ChartData(
              element.date!,
              element.profit!,
            ),
          );
        }
        ethChartDataList.add(
          ChartDataItem(
            'ETH Plan ${ethPlanNumber += 1}',
            plan.cryptoName!,
            ethChartData,
          ),
        );
      } else if (plan.cryptoName == 'RVN' && plan.planStatus!) {
        for (var element in plan.hourlyGains!) {
          rvnChartData.add(ChartData(element.date!, element.profit!));
        }
        rvnChartDataList.add(
          ChartDataItem(
            'RVN Plan ${rvnPlanNumber += 1}',
            plan.cryptoName!,
            rvnChartData,
          ),
        );
      } else if (plan.cryptoName == 'LTCT' && plan.planStatus!) {
        for (var element in plan.hourlyGains!) {
          ltctChartData.add(ChartData(element.date!, element.profit!));
        }
        ltctChartDataList.add(
          ChartDataItem(
            'LTCT Plan ${ltctPlanNumber += 1}',
            plan.cryptoName!,
            ltctChartData,
          ),
        );
      }
    }
    emit(AssetsChartSuccessState());
  }

  double getMaxChartValue() {
    if (selectedChartData.isEmpty) {
      return 1;
    } else {
      return selectedChartData[0].y * 2;
    }
  }

  double getMinChartValue() {
    if (selectedChartData.isEmpty) {
      return 0;
    } else {
      return selectedChartData[0].y / 2;
    }
  }

  double getInterChartValue() {
    if (selectedChartData.isEmpty) {
      return 0.10;
    } else {
      return (getMaxChartValue() - getMinChartValue()) / 10;
    }
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
    } else if (selectedCurrency == Currency.rvn) {
      currency = selectedCurrency;
      emit(AssetsChartRVNState());
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
    } else if (currency == Currency.rvn) {
      return rvnPlanNumber;
    } else {
      return ltctPlanNumber;
    }
  }

  List<ChartDataItem> getPlans() {
    if (currency == Currency.btc) {
      return btcChartDataList;
    } else if (currency == Currency.eth) {
      return ethChartDataList;
    } else if (currency == Currency.rvn) {
      return rvnChartDataList;
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
    } else if (currency == Currency.rvn) {
      selectedChartData = rvnChartDataList
          .firstWhere((element) => element.id == planId)
          .chartDataList;
      emit(AssetsChartRVNDataState());
    } else {
      selectedChartData = ltctChartDataList
          .firstWhere((element) => element.id == planId)
          .chartDataList;
      emit(AssetsChartLTCTDataState());
    }
  }
}
