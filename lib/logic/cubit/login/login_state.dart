part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class FirstLoginLoadingState extends LoginState {}

class FirstLoginSuccessState extends LoginState {}

class FirstLoginErrorState extends LoginState {
  final String errorMessage;
  FirstLoginErrorState({
    required this.errorMessage,
  });
}

class SecondeLoginLoadingState extends LoginState {}

class SecondLoginSuccessState extends LoginState {}

class SecondLoginErrorState extends LoginState {
  final String errorMessage;
  SecondLoginErrorState({
    required this.errorMessage,
  });
}

class AuthErrorState extends LoginState {}

class AutoLoginLoadingState extends LoginState {}

class AutoLoginSuccessState extends LoginState {}

class AutoLoginFailedState extends LoginState {}

class ChangeIsEmptyState extends LoginState {}

class ChangePasswordVisibilityState extends LoginState {}
