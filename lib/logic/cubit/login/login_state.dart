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
  final String errorMessage;
  FirstLoginErrorState({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [FirstLoginErrorState];
}

class SecondeLoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [SecondeLoginLoadingState];
}

class SecondLoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [SecondLoginSuccessState];
}

class SecondLoginErrorState extends LoginState {
  final String errorMessage;
  SecondLoginErrorState({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [SecondLoginErrorState];
}

class AuthErrorState extends LoginState{
  @override
  List<Object?> get props => [AuthErrorState];

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
