part of 'delete_account_cubit.dart';

@immutable
abstract class DeleteAccountState extends Equatable {}

class DeleteAccountInitial extends DeleteAccountState {
  @override
  // TODO: implement props
  List<Object?> get props => [DeleteAccountInitial];
}

class DeleteAccountLoadingState extends DeleteAccountState{
  @override
  // TODO: implement props
  List<Object?> get props => [DeleteAccountLoadingState];
}

class DeleteAccountSuccessState extends DeleteAccountState{
  @override
  // TODO: implement props
  List<Object?> get props => [DeleteAccountSuccessState];
}

class DeleteAccountErrorState extends DeleteAccountState{
  @override
  // TODO: implement props
  List<Object?> get props => [DeleteAccountErrorState];
}