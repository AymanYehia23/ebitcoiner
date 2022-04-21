part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [LoginInitial];
}

class FirstLoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [FirstLoginLoadingState];
}

class FirstLoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [FirstLoginSuccessState];
}


class FirstLoginErrorState extends LoginState {
  @override
  List<Object?> get props => [FirstLoginErrorState];
}

class SecondeLoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [SecondeLoginLoadingState];
}

class SecondeLoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [SecondeLoginSuccessState];
}

class SecondeLoginErrorState extends LoginState {
  @override
  List<Object?> get props => [SecondeLoginErrorState];
}

class SaveTokensLoadingState extends LoginState {
  @override
  List<Object?> get props => [SaveTokensLoadingState];
}

class SaveTokensSuccessState extends LoginState {
  @override
  List<Object?> get props => [SaveTokensSuccessState];
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


class ChangeIsEmptyTrueState extends LoginState {
  @override
  List<Object?> get props => [ChangeIsEmptyTrueState];
}

class ChangeIsEmptyFalseState extends LoginState {
  @override
  List<Object?> get props => [ChangeIsEmptyFalseState];
}

class ChangePasswordVisibilityInitialState extends LoginState {
  @override
  List<Object?> get props => [ChangePasswordVisibilityInitialState];
}

class ChangePasswordVisibilitySuccessState extends LoginState {
  @override
  List<Object?> get props => [ChangePasswordVisibilitySuccessState];
}
