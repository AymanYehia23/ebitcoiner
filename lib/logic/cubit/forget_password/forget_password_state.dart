part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String errorMessage;
  ForgetPasswordErrorState({
    required this.errorMessage,
  });
}

class VerifyCodeLoadingState extends ForgetPasswordState {}

class VerifyCodeSuccessState extends ForgetPasswordState {}

class VerifyCodeErrorState extends ForgetPasswordState {
  final String errorMessage;
  VerifyCodeErrorState({
    required this.errorMessage,
  });
}

class ResetPasswordLoadingState extends ForgetPasswordState {}

class ResetPasswordSuccessState extends ForgetPasswordState {}

class ResetPasswordErrorState extends ForgetPasswordState {
  final String errorMessage;
  ResetPasswordErrorState({
    required this.errorMessage,
  });
}

class ChangeIsEmptyState extends ForgetPasswordState {}

class ChangePasswordVisibilityState extends ForgetPasswordState {}
