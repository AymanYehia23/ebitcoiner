import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/data/models/asics_model.dart';
import 'package:hash_store/data/repositories/asics_repo.dart';

part 'asics_state.dart';

class AsicsCubit extends Cubit<AsicsState> {
  AsicsCubit(this._asicsRepo) : super(AsicsInitial());

  final AsicsRepo _asicsRepo;
  List<AsicModel> asicsList = [];
  String uintOfPower = '';
  Currency currency = Currency.btc;
  String paymentCurrency = 'BTC';

  Future<void> getAsics() async {
    emit(GetAsicsLoadingState());
    try {
      asicsList = await _asicsRepo.getAsics();
      emit(GetAsicsSuccessState());
    } on DioError catch (_) {
      emit(GetAsicsErrorState());
    }
  }

  Future<void> addAsicContract(String asicID) async {
    emit(AddAsicContractLoadingState());
    try {
      await _asicsRepo.addAsicContract(asicID, paymentCurrency);
      emit(AddAsicContractSuccessState());
    } on DioError catch (_) {
      emit(AddAsicContractErrorState());
    }
  }

  void choosePaymentCurrency(Currency currency) {
    if (currency == Currency.btc) {
      paymentCurrency = 'BTC';
      emit(AsicsBtcState());
    } else if (currency == Currency.eth) {
      paymentCurrency = 'ETH';
      emit(AsicsEthState());
    } else if (currency == Currency.rvn) {
      paymentCurrency = 'RVN';
      emit(AsicsRVNState());
    }
    else{
      paymentCurrency = 'LTCT';
      emit(AsicsLTCTState());
    }
  }

  String currencyIcon(int index) {
    if (asicsList[index].cryptoName == 'BTC') {
      uintOfPower = 'TH/S';
      return 'assets/images/btc_icon.svg';
    } else if (asicsList[index].cryptoName == 'ETH') {
      uintOfPower = 'MH/S';
      return 'assets/images/eth_icon.svg';
    } else {
      uintOfPower = 'MH/S';
      return 'assets/images/rvn_icon.svg';
    }
  }
}
