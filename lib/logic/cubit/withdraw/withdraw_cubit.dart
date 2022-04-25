import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/data/models/withdraw_model.dart';
import 'package:hash_store/data/repositories/withdraw_repo.dart';

part 'withdraw_state.dart';

class WithdrawCubit extends Cubit<WithdrawState> {
  WithdrawCubit(this.userData, this._withdrawRepo) : super(WithdrawInitial());

  User userData;
  String selectedCurrency = 'BTC';
  bool isEmpty = true;
  late final WithdrawRequestModel _withdrawRequestModel;
  final WithdrawRepo _withdrawRepo;

  Future<void> withdrawRequest(String address, String amount) async {
    _withdrawRequestModel = WithdrawRequestModel(
      address: address,
      amount: amount,
      currency: selectedCurrency,
    );
    emit(WithdrawRequestLoadingState());
    try {
      await _withdrawRepo.postWithdraw(_withdrawRequestModel);
      emit(WithdrawRequestSuccessState());
    } on DioError catch (_) {
      emit(WithdrawRequestErrorState());
    }
  }

  void selectCurrency(Currency currency) {
    if (currency == Currency.btc) {
      selectedCurrency = 'BTC';
    } else if (currency == Currency.eth) {
      selectedCurrency = 'ETH';
    } else if (currency == Currency.rvn) {
      selectedCurrency = 'RVN';
    } else {
      selectedCurrency = 'LTCT';
    }
  }

  String getMaxBalance() {
    if (selectedCurrency == 'BTC') {
      return userData.balance!.btc!.toStringAsFixed(12);
    } else if (selectedCurrency == 'ETH') {
      return userData.balance!.eth!.toStringAsFixed(12);
    } else if (selectedCurrency == 'RVN') {
      return userData.balance!.rvn!.toStringAsFixed(12);
    } else {
      return userData.balance!.ltct!.toStringAsFixed(12);
    }
  }

  void changeIsEmpty(bool i) {
    if (i) {
      isEmpty = true;
      emit(ChangeIsEmptyTrueState());
    } else {
      isEmpty = false;
      emit(ChangeIsEmptyFalseState());
    }
  }
}
