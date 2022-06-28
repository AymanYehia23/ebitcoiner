part of 'wallet_cubit.dart';

abstract class WalletState {}

class WalletInitial extends WalletState {}

class WalletGetDepositsLoadingState extends WalletState {}

class WalletGetDepositsSuccessState extends WalletState {}

class WalletGetDepositsErrorState extends WalletState {
  final String errorMessage;
   WalletGetDepositsErrorState({
    required this.errorMessage,
  });
}

class WalletGetWithdrawsLoadingState extends WalletState {}

class WalletGetWithdrawsSuccessState extends WalletState {}

class WalletGetWithdrawsErrorState extends WalletState {
  final String errorMessage;
   WalletGetWithdrawsErrorState({
    required this.errorMessage,
  });
}

class WalletDepositState extends WalletState {}

class WalletWithdrawState extends WalletState {}
