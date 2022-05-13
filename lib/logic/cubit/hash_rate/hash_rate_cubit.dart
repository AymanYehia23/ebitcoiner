import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/data/repositories/plan_contract_repo.dart';

import '../../../core/constants/strings.dart';
import '../../../data/models/plan_contract_model.dart';

part 'hash_rate_state.dart';

class HashRateCubit extends Cubit<HashRateState> {
  HashRateCubit(this._planContractRepo) : super(HashRateInitial());

  //HashRate total UI logic
  bool isTotalExpanded = false;
  String expandedTotalIcon = Strings.featherChevronDownIcon;
  double totalPower = 0.0;
  double totalBTCPower = 0.0;
  double totalETHPower = 0.0;
  double totalRVNPower = 0.0;
  double totalLTCTPower = 0.0;
  int btcActivePlans = 0;
  int ethActivePlans = 0;
  int rvnActivePlans = 0;
  int ltctActivePlans = 0;

  void changeTotalSize() {
    emit(HashRateTotalChangeSizeInitState());
    isTotalExpanded = !isTotalExpanded;
    if (isTotalExpanded == true) {
      expandedTotalIcon = Strings.featherChevronUp;
    } else {
      expandedTotalIcon = Strings.featherChevronDownIcon;
    }
    emit(HashRateTotalChangeSizeState());
  }

  bool isExpiredExpanded = false;
  String expandedExpiredIcon = Strings.featherChevronDownIcon;

  void changeExpiredSize() {
    emit(HashRateExpiredChangeSizeInitState());
    isExpiredExpanded = !isExpiredExpanded;
    if (isExpiredExpanded == true) {
      expandedExpiredIcon = Strings.featherChevronUp;
    } else {
      expandedExpiredIcon = Strings.featherChevronDownIcon;
    }
    emit(HashRateExpiredChangeSizeState());
  }

  String getCurrencyPic({required int index, required bool isActive}) {
    if (isActive) {
      if (activePlans[index].cryptoName == 'BTC') {
        return Strings.btcIcon;
      } else if (activePlans[index].cryptoName == 'ETH') {
        return Strings.ethIcon;
      } else if (activePlans[index].cryptoName == 'RVN') {
        return Strings.rvnIcon;
      } else {
        return Strings.ltctIcon;
      }
    } else {
      if (expiredPlans[index].cryptoName == 'BTC') {
        return Strings.btcIcon;
      } else if (expiredPlans[index].cryptoName == 'ETH') {
        return Strings.ethIcon;
      } else if (expiredPlans[index].cryptoName == 'RVN') {
        return Strings.rvnIcon;
      } else {
        return Strings.ltctIcon;
      }
    }
  }

  String getHourlyProfits({required int index, required bool isActive}) {
    if (isActive) {
      double total = 0.0;
      int minutes = 0;
      if (activePlans[index].hourlyGains!.isNotEmpty) {
        for (var element in activePlans[index].hourlyGains!) {
          total += element.profit!;
          minutes += 5;
        }
        return (total / minutes).toStringAsFixed(6);
      }
      return '0.000000';
    } else {
      double total = 0.0;
      int minutes = 0;
      if (expiredPlans[index].hourlyGains!.isNotEmpty) {
        for (var element in expiredPlans[index].hourlyGains!) {
          total += element.profit!;
          minutes += 5;
        }
        return (total / minutes).toStringAsFixed(6);
      }
      return '0.000000';
    }
  }

  //HashRate business logic
  final PlanContractRepo _planContractRepo;
  List<GetPlanContractResponseModel> plansContractList = [];
  List<GetPlanContractResponseModel> activePlans = [];
  List<GetPlanContractResponseModel> expiredPlans = [];

  Future<void> getPlanContract() async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(HashRateGetPlanContractLoadingState());
    try {
      plansContractList = await _planContractRepo.getPlanContract();
      emit(HashRateGetPlanContractSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      }
      emit(HashRateGetPlanContractErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(HashRateGetPlanContractErrorState(errorMessage: errorMessage));
    }
  }

  Future<void> getTotalPower() async {
    await getPlanContract();
    activePlans = [];
    expiredPlans = [];
    totalPower = 0.0;
    totalBTCPower = 0.0;
    totalETHPower = 0.0;
    totalRVNPower = 0.0;
    totalLTCTPower = 0.0;
    btcActivePlans = 0;
    ethActivePlans = 0;
    rvnActivePlans = 0;
    ltctActivePlans = 0;
    emit(HashRateGetTotalPowerLoadingState());
    if (plansContractList.isNotEmpty) {
      for (GetPlanContractResponseModel element in plansContractList) {
        if (element.cryptoName == 'BTC') {
          if (element.planStatus!) {
            activePlans.add(element);
            btcActivePlans += 1;
            totalBTCPower += element.hashPower!;
            totalBTCPower = double.parse((totalBTCPower).toStringAsFixed(2));
          } else {
            expiredPlans.add(element);
          }
        } else if (element.cryptoName == 'ETH') {
          if (element.planStatus!) {
            activePlans.add(element);
            ethActivePlans += 1;
            totalETHPower += element.hashPower!;
            totalETHPower = double.parse((totalETHPower).toStringAsFixed(2));
          } else {
            expiredPlans.add(element);
          }
        } else if (element.cryptoName == 'RVN') {
          if (element.planStatus!) {
            activePlans.add(element);
            rvnActivePlans += 1;
            totalRVNPower += element.hashPower!;
            totalRVNPower = double.parse((totalRVNPower).toStringAsFixed(2));
          }
        } else if (element.cryptoName == 'LTCT') {
          if (element.planStatus!) {
            activePlans.add(element);
            ltctActivePlans += 1;
            totalLTCTPower += element.hashPower!;
            totalLTCTPower = double.parse((totalRVNPower).toStringAsFixed(2));
          } else {
            expiredPlans.add(element);
          }
        }
        totalPower =
            totalBTCPower + totalETHPower + totalRVNPower + totalLTCTPower;
        emit(HashRateGetTotalPowerSuccessState());
      }
    } else {
      totalPower = 0.0;
      totalBTCPower = 0.0;
      totalETHPower = 0.0;
      totalRVNPower = 0.0;
      totalLTCTPower = 0.0;
      emit(HashRateGetTotalPowerEmptyState());
    }
  }
}
