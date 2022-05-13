import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/models/deposit_model.dart';
import 'package:hash_store/data/repositories/deposit_repo.dart';

import '../../../core/constants/enums.dart';

part 'deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  DepositCubit(this._depositRepo) : super(DepositInitial());

  final DepositRepo _depositRepo;
  DepositAddressResponseModel depositAddressResponseModel =
      DepositAddressResponseModel(address: '');

  Future<void> getDepositAddress() async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(GetDepositAddressLoadingState());
    try {
      depositAddressResponseModel = await _depositRepo.getDepositAddress(
          depositAddressRequestModel:
              DepositAddressRequestModel(currency: depositCurrency));
      emit(GetDepositAddressSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      }
      emit(GetDepositAddressErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(GetDepositAddressErrorState(errorMessage: errorMessage));
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
