part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ChangePasswordVisibilityInitialState extends ProfileState {}

class ChangePasswordVisibilitySuccessState extends ProfileState {}

class ChangeIsEmptyTrueState extends ProfileState{}

class ChangeIsEmptyFalseState extends ProfileState{}

class DeleteAccountLoadingState extends ProfileState {}

class DeleteAccountSuccessState extends ProfileState {}

class DeleteAccountErrorState extends ProfileState {
  final String errorMessage;
  const DeleteAccountErrorState({
    required this.errorMessage,
  });
}

class UpdatePasswordLoadingState extends ProfileState {}

class UpdatePasswordSuccessState extends ProfileState {}

class UpdatePasswordErrorState extends ProfileState {
    final String errorMessage;
  const UpdatePasswordErrorState({
    required this.errorMessage,
  });
}

class LogoutLoadingState extends ProfileState {}

class LogoutSuccessState extends ProfileState {}

class LogoutErrorState extends ProfileState {
    final String errorMessage;
  const LogoutErrorState({
    required this.errorMessage,
  });

}

class DeleteSavedTokensLoadingState extends ProfileState {}

class DeleteSavedTokensSuccessState extends ProfileState {}

class UnauthorizedProfileState extends ProfileState{}