part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ChangePasswordVisibilityState extends ProfileState {}

class ChangeIsEmptyState extends ProfileState {}

class DeleteAccountLoadingState extends ProfileState {}

class DeleteAccountSuccessState extends ProfileState {}

class DeleteAccountErrorState extends ProfileState {
  final String errorMessage;
  DeleteAccountErrorState({
    required this.errorMessage,
  });
}

class UpdatePasswordLoadingState extends ProfileState {}

class UpdatePasswordSuccessState extends ProfileState {}

class UpdatePasswordErrorState extends ProfileState {
  final String errorMessage;
  UpdatePasswordErrorState({
    required this.errorMessage,
  });
}

class LogoutLoadingState extends ProfileState {}

class LogoutSuccessState extends ProfileState {}

class LogoutErrorState extends ProfileState {
  final String errorMessage;
  LogoutErrorState({
    required this.errorMessage,
  });
}

class DeleteSavedTokensLoadingState extends ProfileState {}

class DeleteSavedTokensSuccessState extends ProfileState {}

class UnauthorizedProfileState extends ProfileState {}
