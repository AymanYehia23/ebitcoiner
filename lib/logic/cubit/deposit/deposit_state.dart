part of 'deposit_cubit.dart';

abstract class DepositState extends Equatable {
  const DepositState();

  @override
  List<Object> get props => [];
}

class DepositInitial extends DepositState {}

class GetDepositAddressLoadingState extends DepositState {}

class GetDepositAddressSuccessState extends DepositState {}

class GetDepositAddressErrorState extends DepositState {}


class DepositBTCState extends DepositState{}

class DepositETHState extends DepositState {}

class DepositRVNState extends DepositState {}

class DepositLTCTState extends DepositState {}


