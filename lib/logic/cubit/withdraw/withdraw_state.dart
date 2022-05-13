part of 'withdraw_cubit.dart';

abstract class WithdrawState extends Equatable {
  const WithdrawState();

  @override
  List<Object> get props => [];
}

class WithdrawInitial extends WithdrawState {}

class WithdrawGetUserDataLoadingState extends WithdrawState {}

class WithdrawGetUserDataSuccessState extends WithdrawState {}

class WithdrawGetUserDataErrorState extends WithdrawState {}

class WithdrawRequestLoadingState extends WithdrawState {}

class WithdrawRequestSuccessState extends WithdrawState {}

class WithdrawRequestErrorState extends WithdrawState {
  final String errorMessage;
  const WithdrawRequestErrorState({
    required this.errorMessage,
  });
}

class ChangeIsEmptyTrueState extends WithdrawState {}

class ChangeIsEmptyFalseState extends WithdrawState {}
