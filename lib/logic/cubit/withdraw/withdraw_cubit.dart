import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/data/models/withdraw_model.dart';
import 'package:hash_store/data/repositories/get_user_data_repo.dart';
import 'package:hash_store/data/repositories/withdraw_repo.dart';

part 'withdraw_state.dart';

class WithdrawCubit extends Cubit<WithdrawState> {
  WithdrawCubit(this._userDataRepo, this.userData, this._withdrawRepo)
      : super(WithdrawInitial());

  final UserDataRepo _userDataRepo;
  User userData;
  String selectedCurrency = 'BTC';
  bool isEmpty = true;
  late WithdrawRequestModel _withdrawRequestModel;
  final WithdrawRepo _withdrawRepo;

  Future<void> getUserData() async {
    emit(WithdrawGetUserDataLoadingState());
    try {
      userData = await _userDataRepo.getUserData();
      emit(WithdrawGetUserDataSuccessState());
    } on DioError catch (_) {
      emit(WithdrawGetUserDataErrorState());
    }
  }

  Future<void> withdrawRequest(String address, String amount) async {
    String errorMessage = Strings.defaultErrorMessage;
    _withdrawRequestModel = WithdrawRequestModel(
      address: address,
      amount: amount,
      currency: selectedCurrency,
    );
    emit(WithdrawRequestLoadingState());
    try {
      await _withdrawRepo.postWithdraw(_withdrawRequestModel);
      emit(WithdrawRequestSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else if (error.response!.statusCode == 400) {
        errorMessage = 'No sufficient balance';
      }
      emit(WithdrawRequestErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(WithdrawRequestErrorState(errorMessage: errorMessage));
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

  String getAvailableBalance() {
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

  String getMaxWithdrawBalance() {
    if (selectedCurrency == 'BTC') {
      return ((userData.balance!.btc!) - (userData.balance!.btc! * 0.5 / 100))
          .toStringAsFixed(12);
    } else if (selectedCurrency == 'ETH') {
      return ((userData.balance!.eth!) - (userData.balance!.eth! * 0.5 / 100))
          .toStringAsFixed(12);
    } else if (selectedCurrency == 'RVN') {
      return ((userData.balance!.rvn!) - (userData.balance!.rvn! * 0.5 / 100))
          .toStringAsFixed(12);
    } else {
      return ((userData.balance!.ltct!) - (userData.balance!.ltct! * 0.5 / 100))
          .toStringAsFixed(12);
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
