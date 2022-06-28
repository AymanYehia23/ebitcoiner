import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/data/models/deposit_model.dart';
import 'package:ebitcoiner/data/models/withdraw_model.dart';
import 'package:ebitcoiner/data/repositories/deposit_repo.dart';
import 'package:ebitcoiner/data/repositories/withdraw_repo.dart';

import '../../../core/constants/enums.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit(this._depositRepo, this._withdrawRepo) : super(WalletInitial());

  final DepositRepo _depositRepo;
  final WithdrawRepo _withdrawRepo;

  List<DepositModel> depositList = [];
  List<WithdrawResponseModel> withdrawList = [];

  Future<void> getDeposits() async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(WalletGetDepositsLoadingState());
    try {
      depositList = await _depositRepo.getDeposits();
      emit(WalletGetDepositsSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      }
      emit(WalletGetDepositsErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(WalletGetDepositsErrorState(errorMessage: errorMessage));
    }
  }

  Future<void> getWithdraws() async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(WalletGetWithdrawsLoadingState());
    try {
      withdrawList = await _withdrawRepo.getWithdraws();
      emit(WalletGetWithdrawsSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      }
      emit(WalletGetWithdrawsErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(WalletGetWithdrawsErrorState(errorMessage: errorMessage));
    }
  }

  TransactionStatus getWithdrawsStatus(int index) {
    if (withdrawList[index].transactionStatus == 'PENDING') {
      return TransactionStatus.processing;
    } else if (withdrawList[index].transactionStatus == 'SUCCESS') {
      return TransactionStatus.sent;
    } else {
      return TransactionStatus.failed;
    }
  }

  TransactionStatus getDepositsStatus(int index) {
    if (depositList[index].transactionStatus == 'PENDING') {
      return TransactionStatus.processing;
    } else if (depositList[index].transactionStatus == 'SUCCESS') {
      return TransactionStatus.sent;
    } else {
      return TransactionStatus.failed;
    }
  }

  bool isDeposit = true;

  void changeTransaction(bool i) {
    if (i) {
      isDeposit = true;
      emit(WalletDepositState());
    } else {
      isDeposit = false;
      emit(WalletWithdrawState());
    }
  }
}
