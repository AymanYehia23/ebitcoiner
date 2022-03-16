part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final String response;

  SignUpSuccessState({required this.response});
}

class SignUpErrorState extends SignUpState {
  final String error;

  SignUpErrorState({required this.error});
}

class ChangePasswordVisibilityState extends SignUpState{}