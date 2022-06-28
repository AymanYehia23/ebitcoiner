import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ebitcoiner/core/constants/enums.dart';
import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/data/models/asic_contract_model.dart';
import 'package:ebitcoiner/data/repositories/asic_contract_repo.dart';

part 'devices_state.dart';

class DevicesCubit extends Cubit<DevicesState> {
  DevicesCubit(this._asicContractRepo) : super(DevicesInitial());

  //UI Logic
  double totalMined = 0.0;
  Currency currency = Currency.btc;

  //Business Logic
  final AsicContractRepo _asicContractRepo;
  List<GetAsicContractResponseModel> asicContractList = [];

  Future<void> getAsicContract() async {
    asicContractList = [];
    String errorMessage = Strings.defaultErrorMessage;
    emit(GetAsicContractLoadingState());
    try {
      asicContractList = await _asicContractRepo.getAsicContract();
      getTotalMined();
      emit(GetAsicContractSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else if (error.response!.statusCode == 401) {
        emit(UnauthorizedDevicesState());
        return;
      }
      emit(GetAsicContractErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(GetAsicContractErrorState(errorMessage: errorMessage));
    }
  }

  void getTotalMined() {
    for (GetAsicContractResponseModel asic in asicContractList) {
      totalMined += asic.totalMined!;
    }
  }

  AsicStatus getAsicStatus(int index) {
    if (asicContractList[index].asicStatus!) {
      return AsicStatus.online;
    } else if (asicContractList[index].expired!) {
      return AsicStatus.offline;
    } else {
      return AsicStatus.onDemand;
    }
  }
}
