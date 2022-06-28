part of 'withdraw_cubit.dart';

abstract class WithdrawState {}

class WithdrawInitial extends WithdrawState {}

class WithdrawGetUserDataLoadingState extends WithdrawState {}

class WithdrawGetUserDataSuccessState extends WithdrawState {}

class WithdrawGetUserDataErrorState extends WithdrawState {}

class WithdrawRequestLoadingState extends WithdrawState {}

class WithdrawRequestSuccessState extends WithdrawState {}

class WithdrawRequestErrorState extends WithdrawState {
  final String errorMessage;
  WithdrawRequestErrorState({
    required this.errorMessage,
  });
}

class ChangeIsEmptyTrueState extends WithdrawState {}

class ChangeIsEmptyFalseState extends WithdrawState {}
