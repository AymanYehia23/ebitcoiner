part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState extends Equatable {}

class SignUpInitialState extends SignUpState {
  @override
  List<Object?> get props => [SignUpInitialState];
}

class SignUpLoadingState extends SignUpState {
  @override
  List<Object?> get props => [SignUpLoadingState];
}

class SignUpSuccessState extends SignUpState {
  @override
  List<Object?> get props => [SignUpSuccessState];
}

class SignUpErrorState extends SignUpState {
  final String errorMessage;

  SignUpErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [SignUpErrorState];
}

class ChangeIsEmptyTrueState extends SignUpState {
  @override
  List<Object?> get props => [ChangeIsEmptyTrueState];
}

class ChangeIsEmptyFalseState extends SignUpState {
  @override
  List<Object?> get props => [ChangeIsEmptyFalseState];
}

class ChangePasswordVisibilityLoadingState extends SignUpState {
  @override
  List<Object?> get props => [ChangePasswordVisibilityLoadingState];
}

class ChangePasswordVisibilitySuccessState extends SignUpState {
  @override
  List<Object?> get props => [ChangePasswordVisibilitySuccessState];
}

