part of 'wallet_cubit.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

class WalletInitial extends WalletState {}

class WalletGetDepositsLoadingState extends WalletState {}

class WalletGetDepositsSuccessState extends WalletState {}

class WalletGetDepositsErrorState extends WalletState {
  final String errorMessage;
  const WalletGetDepositsErrorState({
    required this.errorMessage,
  });
}

class WalletGetWithdrawsLoadingState extends WalletState {}

class WalletGetWithdrawsSuccessState extends WalletState {}

class WalletGetWithdrawsErrorState extends WalletState {
    final String errorMessage;
  const WalletGetWithdrawsErrorState({
    required this.errorMessage,
  });

}

class WalletDepositState extends WalletState {}

class WalletWithdrawState extends WalletState {}
