part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState extends Equatable {}

class SignUpInitialState extends SignUpState {
  @override
  List<Object?> get props => [SignUpInitialState];
}

class SignUpLoadingState extends SignUpState {
  @override
  List<Object?> get props => [SignUpLoadingState];
}

class SignUpSuccessState extends SignUpState {
  @override
  List<Object?> get props => [SignUpSuccessState];
}

class SignUpErrorState extends SignUpState {
  final String error;

  SignUpErrorState({required this.error});

  @override
  List<Object?> get props => [SignUpErrorState];
}

class ChangePasswordVisibilityState extends SignUpState {
  @override
  List<Object?> get props => [SignUpErrorState];
}
