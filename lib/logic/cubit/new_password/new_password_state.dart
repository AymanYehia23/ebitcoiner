part of 'new_password_cubit.dart';

@immutable
abstract class NewPasswordState {}

class NewPasswordInitial extends NewPasswordState {}

class ChangePasswordVisibilityState extends NewPasswordState {}

class ChangeRePasswordVisibilityState extends NewPasswordState {}


