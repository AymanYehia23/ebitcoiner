import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/data/models/asic_contract_model.dart';
import 'package:hash_store/data/repositories/asic_contract_repo.dart';

part 'devices_state.dart';

class DevicesCubit extends Cubit<DevicesState> {
  DevicesCubit(this._asicContractRepo) : super(DevicesInitial());

  //UI Logic
  double totalMined = 0.0;
  Currency currency = Currency.btc;

  void changeChartButton(Currency selectedCurrency) {
    if (selectedCurrency == Currency.btc) {
      currency = selectedCurrency;
      emit(DevicesChartBtcState());
    } else if (selectedCurrency == Currency.eth) {
      currency = selectedCurrency;
      emit(DevicesChartETHState());
    } else {
      currency = selectedCurrency;
      emit(DevicesChartLTCTState());
    }
  }

  //Business Logic
  final AsicContractRepo _asicContractRepo;
  List<AsicContractModel> asicContractList = [];

  Future<void> getAsicContract() async {
    emit(GetAsicContractLoadingState());
    try {
      asicContractList = await _asicContractRepo.getAsicContract();
      getTotalPower();
      emit(GetAsicContractSuccessState());
    } on DioError catch (_) {
      emit(GetAsicContractErrorState());
    }
  }

  void getTotalPower() {
    for (AsicContractModel asic in asicContractList) {
      totalMined += asic.totalMined!;
    }
  }

  Status getAsicStatus(int index) {
    if (asicContractList[index].asicStatus!) {
      return Status.online;
    } else if (asicContractList[index].expired!) {
      return Status.offline;
    } else {
      return Status.onDemand;
    }
  }
}
