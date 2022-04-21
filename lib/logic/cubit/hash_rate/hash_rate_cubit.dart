import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constants/strings.dart';
import '../../../data/models/plan_contract_model.dart';

part 'hash_rate_state.dart';

class HashRateCubit extends Cubit<HashRateState> {
  HashRateCubit(this.plansContractList) : super(HashRateInitial());

  //HashRate total UI logic
  bool isTotalExpanded = false;
  String expandedTotalIcon = Strings.featherChevronDownIcon;
  double totalPower = 0.0;
  double totalBTCPower = 0.0;
  double totalETHPower = 0.0;
  double totalLTCTPower = 0.0;
  int btcActivePlans = 0;
  int ethActivePlans = 0;
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

  //HashRate business logic
  final List<PlanContractModel> plansContractList;

  Future<void> getTotalPower() async {
    totalPower = 0.0;
    totalBTCPower = 0.0;
    totalETHPower = 0.0;
    totalLTCTPower = 0.0;
    btcActivePlans = 0;
    ethActivePlans = 0;
    ltctActivePlans = 0;

    emit(HashRateGetTotalPowerLoadingState());
    if (plansContractList.isNotEmpty) {
      for (PlanContractModel element in plansContractList) {
        if (element.cryptoName == 'BTC') {
          btcActivePlans += 1;
          totalBTCPower += element.hashPower!;
          totalBTCPower = double.parse((totalBTCPower).toStringAsFixed(2));
        } else if (element.cryptoName == 'ETH') {
          ethActivePlans += 1;
          totalETHPower += element.hashPower!;
          totalETHPower = double.parse((totalETHPower).toStringAsFixed(2));
        } else if (element.cryptoName == 'LTCT') {
          ltctActivePlans += 1;
          totalLTCTPower += element.hashPower!;
          totalLTCTPower = double.parse((totalLTCTPower).toStringAsFixed(2));
        }
        totalPower = totalBTCPower + totalETHPower + totalLTCTPower;
        emit(HashRateGetTotalPowerSuccessState());
      }
    } else {
      totalPower = 0.0;
      totalBTCPower = 0.0;
      totalETHPower = 0.0;
      totalLTCTPower = 0.0;
      emit(HashRateGetTotalPowerEmptyState());
    }
  }

}
