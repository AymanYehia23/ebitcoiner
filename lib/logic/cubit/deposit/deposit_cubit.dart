import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/data/models/deposit_model.dart';
import 'package:hash_store/data/repositories/deposit_repo.dart';

import '../../../core/constants/enums.dart';

part 'deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  DepositCubit(this._depositRepo) : super(DepositInitial());

  final DepositRepo _depositRepo;
  DepositAddressModel depositAddressModel = DepositAddressModel(address: '');

  Future<void> getDepositAddress() async {
    emit(GetDepositAddressLoadingState());
    try {
      depositAddressModel =
          await _depositRepo.getDepositAddress(depositCurrency);
      emit(GetDepositAddressSuccessState());
    } on DioError catch (_) {
      emit(GetDepositAddressErrorState());
    }
  }

  String depositCurrency = '';
  void choosePaymentCurrency(Currency currency) {
    if (currency == Currency.btc) {
      depositCurrency = 'BTC';
      emit(DepositBTCState());
    } else if (currency == Currency.eth) {
      depositCurrency = 'ETH';
      emit(DepositETHState());
    } else if (currency == Currency.rvn) {
      depositCurrency = 'RVN';
      emit(DepositRVNState());
    } else {
      depositCurrency = 'LTCT';
      emit(DepositLTCTState());
    }
  }
}
