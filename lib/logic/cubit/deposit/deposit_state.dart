part of 'deposit_cubit.dart';

abstract class DepositState {}

class DepositInitial extends DepositState {}

class GetDepositAddressLoadingState extends DepositState {}

class GetDepositAddressSuccessState extends DepositState {}

class GetDepositAddressErrorState extends DepositState {
  final String errorMessage;
  GetDepositAddressErrorState({
    required this.errorMessage,
  });
}

class DepositBTCState extends DepositState {}

class DepositETHState extends DepositState {}

class DepositRVNState extends DepositState {}

class DepositLTCTState extends DepositState {}
