part of 'withdraw_cubit.dart';

abstract class WithdrawState extends Equatable {
  const WithdrawState();

  @override
  List<Object> get props => [];
}

class WithdrawInitial extends WithdrawState {}

class WithdrawRequestLoadingState extends WithdrawState{}

class WithdrawRequestSuccessState extends WithdrawState {}

class WithdrawRequestErrorState extends WithdrawState {}

class ChangeIsEmptyTrueState extends WithdrawState{}

class ChangeIsEmptyFalseState extends WithdrawState{}
