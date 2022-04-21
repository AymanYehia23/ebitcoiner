part of 'logout_cubit.dart';

@immutable
abstract class LogoutState extends Equatable {}

class LogoutInitial extends LogoutState {
  @override
  // TODO: implement props
  List<Object?> get props => [LogoutInitial];
}

class LogoutLoadingState extends LogoutState{
  @override
  // TODO: implement props
  List<Object?> get props => [LogoutLoadingState];
}

class LogoutSuccessState extends LogoutState{
  @override
  // TODO: implement props
  List<Object?> get props => [LogoutSuccessState];
}

class LogoutErrorState extends LogoutState{
  @override
  // TODO: implement props
  List<Object?> get props => [LogoutErrorState];
}


class DeleteSavedRefreshTokenLoadingState extends LogoutState {
  @override
  // TODO: implement props
  List<Object?> get props => [DeleteSavedRefreshTokenLoadingState];
}

class DeleteSavedRefreshTokenSuccessState extends LogoutState {
  @override
  // TODO: implement props
  List<Object?> get props => [DeleteSavedRefreshTokenSuccessState];
}



