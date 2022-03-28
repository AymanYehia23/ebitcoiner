part of 'update_password_cubit.dart';

@immutable
abstract class UpdatePasswordState {}

class UpdatePasswordInitial extends UpdatePasswordState {}

class UpdatePasswordLoadingState extends UpdatePasswordState{}

class UpdatePasswordSuccessState extends UpdatePasswordState{}

class UpdatePasswordErrorState extends UpdatePasswordState{}

class ChangePasswordVisibilityLoadingState extends UpdatePasswordState {}

class ChangePasswordVisibilitySuccessState extends UpdatePasswordState {}


