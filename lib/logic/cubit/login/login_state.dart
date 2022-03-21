part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {}

class AutoLoginLoadingState extends LoginState{}

class AutoLoginSuccessState extends LoginState {}

class AutoLoginFailedState extends LoginState {}

class LogoutLoadingState extends LoginState{}

class LogoutSuccessState extends LoginState{}

class LogoutErrorState extends LoginState{}

class ChangePasswordVisibilityState extends LoginState {}
