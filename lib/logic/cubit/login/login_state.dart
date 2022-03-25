part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [LoginInitial];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [LoginLoadingState];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [LoginSuccessState];
}

class SaveTokensLoadingState extends LoginState {
  @override
  List<Object?> get props => [SaveTokensLoadingState];
}

class SaveTokensSuccessState extends LoginState {
  @override
  List<Object?> get props => [SaveTokensSuccessState];
}

class LoginErrorState extends LoginState {
  @override
  List<Object?> get props => [LoginErrorState];
}

class AutoLoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [AutoLoginLoadingState];
}

class AutoLoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [AutoLoginSuccessState];
}

class AutoLoginFailedState extends LoginState {
  @override
  List<Object?> get props => [AutoLoginFailedState];
}

class ChangePasswordVisibilityState extends LoginState {
  @override
  List<Object?> get props => [ChangePasswordVisibilityState];
}
